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
/// @return 1 if was syntax error or 0 if was not
static int parseArgs(Assembler *assembler, char *string, size_t *pc);

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

static void print(Assembler *ass)
{
  for (size_t i = 0; i < ass->codeCapacity; ++i)
    printf("%1.1X%1.1X ", (ass->code[i] & 0xf0) >> 4, (ass->code[i] & 0x0f));
  printf("\n");
}

int compile(Assembler *assembler, String *strings, size_t stringsCount, FILE *targetFile)
{
  assert(assembler);
  assert(strings);
  assert(targetFile);

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
      //printf("start: ");
      //print(assembler);////////////////////
      //printf("start: %zu\n", pc);
      if (assembler->compilationTime == 1 && pc + sizeof(int) + sizeof(char) >= assembler->codeCapacity)
        {
          char *temp = (char *)recalloc(assembler->code,
                                        2*assembler->codeCapacity + sizeof(int) + sizeof(char),
                                        sizeof(char));

          assembler->codeCapacity = 2*assembler->codeCapacity + sizeof(int) + sizeof(char);

          if (!temp)
            {
              handleError("Out of memory");

              free(assembler->code);

              return ASSEMBLER_OUT_OF_MEMORY;
            }

          assembler->code = temp;
        }

      int offset = 0;

      char cmdString[MAX_WORD_LENGTH + 1] = "";

      if (sscanf(strings[i].buff, "%4s%n", cmdString, &offset) != 1)
        continue;

      if      (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_PUSH]))
        {
          assembler->code[pc++] = SOFTCPU_PUSH;

          if (parseArgs(assembler, strings[i].buff + offset, &pc))
            {
              handleError("Incorrect arguments in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_INCORRECT_ARGUMENTS;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_POP]))
        {
          assembler->code[pc++] = SOFTCPU_POP;

          if (parseArgs(assembler, strings[i].buff + offset, &pc))
            {
              handleError("Incorrect arguments in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_INCORRECT_ARGUMENTS;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_JMP]))
        {
          assembler->code[pc++] = SOFTCPU_JMP;

          if (parseArgs(assembler, strings[i].buff + offset, &pc))
            {
              handleError("Incorrect arguments in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_INCORRECT_ARGUMENTS;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_ADD]))
        {
          assembler->code[pc++] = SOFTCPU_POP;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_SUB]))
        {
          assembler->code[pc++] = SOFTCPU_SUB;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_MUL]))
        {
          assembler->code[pc++] = SOFTCPU_MUL;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_DIV]))
        {
          assembler->code[pc++] = SOFTCPU_DIV;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_OUT]))
        {
          assembler->code[pc++] = SOFTCPU_OUT;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_HLT]))
        {
          assembler->code[pc++] = SOFTCPU_HLT;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_DUMP]))
        {
          assembler->code[pc++] = SOFTCPU_DUMP;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_IN]))
        {
          assembler->code[pc++] = SOFTCPU_IN;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_COPY]))
        {
          assembler->code[pc++] = SOFTCPU_COPY;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else if (!stricmp(cmdString, SOFTCPU_CMD[SOFTCPU_SWAP]))
        {
          assembler->code[pc++] = SOFTCPU_SWAP;

          if (!isStringEmpty(strings[i].buff + offset))
            {
              handleError("Unknown syntax in line [%d]", i + 1);

              free(assembler->code);

              return ASSEMBLER_UNKNOWN_SYNTAX;
            }
        }
      else
        {
          char *hasColon = nullptr;
          if ((hasColon = strchr(strings[i].buff, ':')) != nullptr)
            {
              if (!isStringEmpty(hasColon + 1))
                {
                  handleError("Unknown syntax in line [%d]", i + 1);

                  free(assembler->code);

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
        }
      //printf("end  : ");
      //print(assembler);
      //printf("end  : %zu\n", pc);
    }
  //printf("\n\n");

  if (assembler->compilationTime == 1 && pc != assembler->codeCapacity)
    {
      char *temp = (char *)recalloc(assembler->code, pc, sizeof(char));

      assembler->codeCapacity = pc;

      if (!temp)
        {
          handleError("Out of memory");

          free(assembler->code);

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

static int parseArgs(Assembler *assembler, char *string, size_t *pc)
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
        *(int *)(assembler->code + *pc) = -1;

      *pc += sizeof(int);

      *endLabel = temp;

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
        }
      else
        assembler->code[(*pc)++] = (char)reg;
    }
  else if (args == 1)
    {
      cmd->immed = 1;

      *(int *)(assembler->code + *pc) = num;
      *pc += sizeof(int);
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
