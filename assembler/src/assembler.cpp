#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "assembler.h"
#include "systemlike.h"
#include "errorhandler.h"
#include "stringsutils.h"
#include "settings.h"
#include "asserts.h"

/// Parse arguments in C-like string and write to code
/// @param [in/out] assembler Assembler object with bin code of compile programm
/// @param [in] string C-like string start with first char after cmd word
/// @param [in] pc Pointer to pc
/// @param [in] listingFile File for write listing
/// @return 1 if was syntax error or 0 if was not
static int parseArgs(Assembler *assembler, char *string, size_t *pc, FILE *listingFile);

/// Return register number with name
/// @param [in] name Name supposed a register name
/// @return Register number or -1 if it isn`t a register name
static int getRegNumber(const char *name);

/// Find label in assembler cells
/// @param [in] assembler Assembler object with label cell
/// @param [in] name Name of label which need to find
/// @param [out] address Pointer to variable where need write answer
/// @return 1 if assembler cells contain label with 'name' or 0 if don`t
static int findLabel(const Assembler *assembler, const char *name, int *address);

int compile(Assembler *assembler, String *strings, size_t stringsCount, FILE *listingFile)
{
  assert(assembler);
  assert(strings);

  ++assembler->compilationTime;

  if (!assembler->codeCapacity)
    assembler->codeCapacity = stringsCount;

  size_t pc = 0;

  if (!assembler->code)
    assembler->code = (char *)calloc(stringsCount, sizeof(char));

  if (!assembler->code)
    {
      handleError("Out of memory");

      return ASSEMBLER_OUT_OF_MEMORY;
    }

  for (size_t i = 0; i < stringsCount; ++i)
    {
      if (assembler->compilationTime == 1 && pc + sizeof(int) + sizeof(char) >= assembler->codeCapacity)
        {
          char *temp = (char *)recalloc(assembler->code,
                                        2*assembler->codeCapacity + sizeof(int) + sizeof(char),
                                        sizeof(char));

          assembler->codeCapacity = 2*assembler->codeCapacity + sizeof(int) + sizeof(char);

          if (!temp)
            {
              handleError("Out of memory");

              return ASSEMBLER_OUT_OF_MEMORY;
            }

          assembler->code = temp;
        }

      int offset = 0;

      char cmdString[MAX_WORD_LENGTH + 1] = "";

      if (sscanf(strings[i].buff, "%4s%n", cmdString, &offset) != 1)
        continue;


#define DEF_CMD(name, num, hasArg, ...)                                 \
      if (!stricmp(cmdString, #name))                                   \
    {                                                                   \
      assembler->code[pc++] = num;                                      \
                                                                        \
      if (listingFile)                                                  \
        {                                                               \
          fprintf(listingFile, "%06lX ", pc);                           \
                                                                        \
          fprintf(listingFile, "%02X ", (unsigned)num);                 \
        }                                                               \
                                                                        \
      if (hasArg &&                                                     \
          parseArgs(assembler,                                          \
                    strings[i].buff + offset,                           \
                    &pc, listingFile))                                  \
        {                                                               \
          handleError("Incorrect arguments in line [%d]", i + 1);       \
                                                                        \
          return ASSEMBLER_INCORRECT_ARGUMENTS;                         \
        }                                                               \
      else if (!hasArg && !isStringEmpty(strings[i].buff + offset))     \
        {                                                               \
          handleError("Unknown syntax in line [%d]", i + 1);            \
                                                                        \
          return ASSEMBLER_UNKNOWN_SYNTAX;                              \
        }                                                               \
    }                                                                   \
  else                                                                  \

#include "cmd.h"

#undef DEF_CMD

        {
          char *hasColon = nullptr;
          if ((hasColon = strchr(strings[i].buff, ':')) != nullptr)
            {
              if (!isStringEmpty(hasColon + 1))
                {
                  handleError("Unknown syntax in line [%d]", i + 1);

                  return ASSEMBLER_UNKNOWN_SYNTAX;
                }

              int labelStart = 0;
              for ( ; isspace(strings[i].buff[labelStart]); ++labelStart)
                continue;

              Label label = {};

              label.address = (int)pc;

              label.name = strings[i].buff + labelStart;

              assembler->labels[assembler->lastLabel++] = label;
            }
          else
            {
              handleError("Unknown cmd[%s] in line %d!!", cmdString, i + 1);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }

          continue;
        }

        if (listingFile)
          putc('\n', listingFile);
    }

  if (assembler->compilationTime == 1 && pc != assembler->codeCapacity)
    {
      char *temp = (char *)recalloc(assembler->code, pc, sizeof(char));

      assembler->codeCapacity = pc;

      if (!temp)
        {
          handleError("Out of memory");

          return ASSEMBLER_OUT_OF_MEMORY;
        }

      assembler->code = temp;
    }

  return 0;
}

Title generateTitle(const Assembler *assembler)
{
  assert(assembler);

  Title title = {};

  title.securityCode[0] = SECURITY_CODE[0];
  title.securityCode[1] = SECURITY_CODE[1];
  title.securityCode[2] = SECURITY_CODE[2];

  title.version = SOFTCPU_CMD_VERSION;

  title.cmdCount = (int)assembler->codeCapacity;

  return title;
}

void writeCode(const Assembler *assembler, FILE *targetFile)
{
  assert(assembler);
  assert(targetFile);

  Title title = generateTitle(assembler);

  fwrite(&title, sizeof(title), 1 , targetFile);
  fwrite(assembler->code  , sizeof(char) , assembler->codeCapacity, targetFile);
}

static int parseArgs(Assembler *assembler, char *string, size_t *pc, FILE *listingFile)
{
  assert(assembler);
  assert(string);
  assert(pc);

  while (isspace(*string) && *string)
         ++string;

  Command *cmd = ((Command *)assembler->code + *pc - 1);

  //=========== 1
  //=========== [1]
  // :1
  // :[1]
  //=========== rax
  //=========== [rax]
  // :rax
  // :[rax]
  //=========== 1+rax
  //=========== [1+rax]
  // :1+rax
  // :[1+rax]
  // label
  //========== :label

  if  (*string == ':')
    {
      ++string;

      char *startLabel = string;

      while (!isspace(*string) && *string)
        ++string;

      char *endLabel = string;

      if (startLabel == endLabel)
        return ASSEMBLER_INCORRECT_LABEL;

      if (!isStringEmpty(string))
        return ASSEMBLER_INCORRECT_LABEL;

      char temp = *endLabel;

      *endLabel = '\0';

      int labelAddress = 0;

      cmd->immed = 1;

      if (findLabel(assembler, startLabel, &labelAddress))
        *(int *)(assembler->code + *pc) = labelAddress;
      else
        {
          if (assembler->compilationTime == 1)
            *(int *)(assembler->code + *pc) = -1;
          else
            {
              handleError("No such label [%s]", startLabel);

              return ASSEMBLER_INCORRECT_LABEL;
            }
        }

      *pc += sizeof(int);

      *endLabel = temp;

      if (listingFile)
        fprintf(listingFile, "%06X", (unsigned)labelAddress);

      return 0;
    }

  if (*string == '[')
    {
      ++string;

      cmd->mem = 1;
    }

  int num = 0;
  int reg = 0;

  char regName[MAX_REG_LENGTH + 1] = {};

  int offset = 0;

  int args = sscanf(string, "%d%n+%3s%n", &num, &offset, regName, &offset);

  if (args == 0 && sscanf(string, "%3s", regName))
    {
      cmd->reg = 1;

      offset = 3;

      if ((reg = getRegNumber(regName)) == -1)
        return ASSEMBLER_INCORRECT_ARGUMENTS;

      if (cmd->mem)
        {
          *(int *)(assembler->code + *pc) = reg;

          *pc += sizeof(int);

          if (listingFile)
            fprintf(listingFile, "%08X", (unsigned)reg);
        }
      else
        {
          assembler->code[(*pc)++] = (char)reg;

          if (listingFile)
            fprintf(listingFile, "%02X", (unsigned)reg);
        }
    }
  else if (args == 1)
    {
      cmd->immed = 1;

      *(int *)(assembler->code + *pc) = num;
      *pc += sizeof(int);

      if (listingFile)
        fprintf(listingFile, "%08X", (unsigned)num);
    }
  else if (args == 2)
    {
      cmd->reg   = 1;
      cmd->immed = 1;

      if ((reg = getRegNumber(regName)) == -1)
        return ASSEMBLER_INCORRECT_ARGUMENTS;


      *(int *)(assembler->code + *pc) = num;
      *pc += sizeof(int);

      assembler->code[(*pc)++] = (char)reg;

      if (listingFile)
        fprintf(listingFile, "%08X %02X", (unsigned)num, (unsigned)reg);
    }
  else
    return ASSEMBLER_INCORRECT_ARGUMENTS;

  string += offset;

  if (cmd->mem && *string++ != ']')
       return ASSEMBLER_INCORRECT_ARGUMENTS;

  if (cmd->mem && !(cmd->reg || cmd->immed))
      return ASSEMBLER_INCORRECT_ARGUMENTS;

  if (!isStringEmpty(string))
    return ASSEMBLER_INCORRECT_ARGUMENTS;

  return 0;
}

static int getRegNumber(const char *name)
{
  char reg = 0;

  if (name[0] != 'r' || name[2] != 'x')
    return -1;

  reg = name[1] - 'a';

  if (reg < 0 || reg >= REGISTERS_COUNT)
    return -1;

  return reg;
}

static int findLabel(const Assembler *assembler, const char *name, int *address)
{
  assert(assembler);
  assert(name);
  assert(address);

  for (size_t i = 0; i < assembler->lastLabel; ++i)
    {
      if (!strcmpto(name, assembler->labels[i].name, ':'))
        {
          *address = assembler->labels[i].address;

          return 1;
        }
    }

    return 0;
}
