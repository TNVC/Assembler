#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "assembler.h"
#include "systemlike.h"
#include "errorhandler.h"
#include "stringsutils.h"
#include "attributes.h"
#include "title.h"
#include "asserts.h"

#define UNKNOWN_SYNTAX                                    \
  do                                                      \
    {                                                     \
      handleError("Unknown syntax in line [%d]", i + 1);  \
                                                          \
      return ASSEMBLER_UNKNOWN_SYNTAX;                    \
    } while (0)

#define INCORRECT_ARGUMENT                                    \
  do                                                          \
    {                                                         \
      handleError("Incorrect arguments in line [%d]", i + 1); \
                                                              \
      return ASSEMBLER_INCORRECT_ARGUMENTS;                   \
    } while (0)

#define OUT_OF_MEMORY                           \
  do                                            \
    {                                           \
      handleError("Out of memory");             \
                                                \
      return ASSEMBLER_OUT_OF_MEMORY;           \
    } while (0)

#define UNKNOWN_CMD                                                   \
  do                                                                  \
    {                                                                 \
      handleError("Unknown cmd[%s] in line %d!!", cmdString, i + 1);  \
                                                                      \
      return ASSEMBLER_UNKNOWN_CMD;                                   \
    } while (0)

#define REDECLARATION_OF_LABEL                                            \
  do                                                                      \
    {                                                                     \
      handleError("The label in line [%d] is already declared!!", i + 1); \
                                                                          \
      return (size_t)ASSEMBLER_INCORRECT_LABEL;                           \
    } while (0)

#define INCORRECT_LABEL                                                 \
  do                                                                    \
    {                                                                   \
      handleError("Incorrect label syntax in line [%d] has!!", i + 1);  \
                                                                        \
      return ASSEMBLER_INCORRECT_LABEL;                                 \
    } while (0)

#define INCORRECT_ATTRIBUTE                                                  \
  do                                                                         \
    {                                                                        \
      handleError("Incorrect attribute syntax!!\n[%s]", strings[line].buff); \
                                                                             \
      return ASSEMBLER_INCORRECT_ATTRIBUTE;                                  \
    } while (0)

/// Return value means that string hasn`t label
const int ISNT_LABEL    = -1;

/// Consts for printListingLine()
const int WITHOUT_ARGUMENTS                =  1; /// <- For cmd without any arguments. Example: ADD
const int WITH_REGISTER_ARGUMENT           =  2; /// <- For cmd with register arguments. Example: PUSH rax
const int WITH_CONSTANT_ARGUMENT           =  5; /// <- For cmd with immediately constants. Exampale: POP [10]
const int WITH_MIXED_ARGUMENT              =  6; /// <- For cmd with mixed arguments. Example: PUSH 8+rbx
const int DEFAULT_OFFSET_FOR_ORIGINAL_CODE = 25; /// <- Offset from start line for original source code line

/// Parse programm attribute
/// @param [in/out] assembler Assembler object
/// @param [in] strings Origin strings for file
/// @param [in] stringsCount Count of strings
/// @return Index of first not attribute string
static size_t parseAttribute(Assembler *assembler, String *strings, size_t stringsCount);

/// Add label from string
/// @param [in/ouy] assembler Assembler-object
/// @param [in] string C-like string with label
/// @param [in] stringIndex Index of string in sourceFile
/// @return Error`s code
static int addLabel(Assembler *assembler, char *string, size_t stringIndex);

/// Print one line to listing file
/// @brief Write all from star to code[pc]
///
/// @param [in] assembler Assembler object
/// @param [in] start Pointer to first cmd from code which yet isn`t listing
/// @param [in] string Source code line from source lines
/// @param [in] listingFile File for write listing
/// @note If listingFile is nullptr don`t try write
static void printListingLine(
                             Assembler *assembler,
                             char *start,
                             char *string,
                             FILE *listingFile
                             );

/// Parse arguments in C-like string and write to code
/// @param [in/out] assembler Assembler object with bin code of compile programm
/// @param [in] string C-like string start with first char after cmd word
/// @param [in] isProducent Bool means that expected value`s producent argumet
/// @return 1 if was syntax error or 0 if was not
static int parseArgs(Assembler *assembler, char *string, int isProducent);

/// Return register number with name
/// @param [in] name Name supposed a register name
/// @return Register number or -1 if it isn`t a register name
static cmd_t getRegNumber(const char *name);

/// Parse label in string and find it in assembler
/// @param [in] assembler Assembler-object with labels cell
/// @param [in] string C-like string with label for parse
/// @param [out] offset Length of label in string
/// @return Error`s code
static int parseLabel(Assembler *assembler, char *string, int *offset);

/// Find label in assembler cells
/// @param [in] assembler Assembler object with label cell
/// @param [in] name Name of label which need to find
/// @param [out] address Pointer to variable where need write answer
/// @return 1 if assembler cells contain label with 'name' or 0 if don`t
/// @note Correctly work with address == nullptr
static int findLabel(
                     const Assembler *assembler,
                     const char *name,
                     int *address
                     );

int compile(
            Assembler *assembler,
            String *strings,
            size_t stringsCount,
            FILE *listingFile
            )
{
  assert(assembler);
  assert(strings);
  assert(stringsCount > 0);

  assembler->pc = 0;

  ++assembler->compilationTime;

  if (!assembler->codeCapacity)
    assembler->codeCapacity = stringsCount;

  if (!assembler->code && allocateAssemblerCode(assembler, stringsCount))
    OUT_OF_MEMORY;

  size_t i = parseAttribute(assembler, strings, stringsCount);

  if (i == (size_t)ASSEMBLER_INCORRECT_ATTRIBUTE)
    return ASSEMBLER_INCORRECT_ATTRIBUTE;

  for ( ; i < stringsCount; ++i)
    {
      if (isNeedResizeAssemblerCode(assembler) && increaseAssemblerCodeCapacity(assembler))
          OUT_OF_MEMORY;

      int offset = 0;

      char cmdString[MAX_WORD_LENGTH + 1] = "";

      if (sscanf(strings[i].buff, "%8s%n", cmdString, &offset) != 1)
        continue;

#define DEF_CMD(name, num, hasArg, isProducentArg, ...)                                 \
      if (!stricmp(cmdString, #name))                                                   \
        {                                                                               \
          cmd_t *command = &assembler->code[assembler->pc];                             \
                                                                                        \
          assembler->code[assembler->pc++] = num;                                       \
                                                                                        \
          if (hasArg && parseArgs(assembler, strings[i].buff + offset, isProducentArg)) \
            INCORRECT_ARGUMENT;                                                         \
          else if (!hasArg && !isStringEmpty(strings[i].buff + offset))                 \
            UNKNOWN_SYNTAX;                                                             \
                                                                                        \
          printListingLine(assembler, command, strings[i].buff, listingFile);           \
        }                                                                               \
      else                                                                              \

#include "cmd.h"

#undef DEF_CMD
      /*else*/
        {
          switch (addLabel(assembler, strings[i].buff, i))
            {
            case ISNT_LABEL:
              UNKNOWN_CMD;
            case 0:
              break;
            default:
              return ASSEMBLER_INCORRECT_LABEL;
            }
        }
    }

  if (trimAssemblerCode(assembler))
    OUT_OF_MEMORY;

  return 0;
}

int writeCode(const Assembler *assembler, FILE *targetFile)
{
  assert(assembler);
  assert(targetFile);

  Title title = generateTitle((int)assembler->codeCapacity, assembler->videoMode);

  fwrite(&title, sizeof(title), 1 , targetFile);
  fwrite(assembler->code, sizeof(cmd_t) , assembler->codeCapacity, targetFile);

  return 0;
}

static size_t parseAttribute(Assembler *assembler, String *strings, size_t stringsCount)
{
  assert(assembler);
  assert(strings);

  int line = -1;

  int offset = 0;

  char buff[ATTRIBUTE_LENGTH + 1] = "";

  while (line < (int)stringsCount && sscanf(strings[++line].buff, "%11s%n", buff, &offset) != 1)
    continue;

  if (!strcmp(buff, ATTRIBUTE_NAME))
    {
      int atrIndex = 0;

      char *hasEqual = strchr(strings[line].buff + offset, '=');

      if (!hasEqual)
        INCORRECT_ATTRIBUTE;

      if (sscanf(hasEqual + 1, "%s%n", buff, &offset) != 1)
        INCORRECT_ATTRIBUTE;

      for ( ; atrIndex < ATTRIBUTE_COUNT; ++atrIndex)
        if (!stricmp(buff, ATTRIBUTE_VALUES[atrIndex]))
          {
            assembler->videoMode = atrIndex;

            if (!isStringEmpty(hasEqual + 1 + offset))
              INCORRECT_ATTRIBUTE;

            ++line;

            return (size_t)line;
          }

      INCORRECT_ATTRIBUTE;
    }

  return (size_t)line;
}

static int addLabel(Assembler *assembler, char *string, size_t stringIndex)
{
  assert(assembler);
  assert(string);

  size_t i = stringIndex;

  char *hasColon  = strchr(string, ':');
  if (hasColon == nullptr)
    return ISNT_LABEL;

  if (assembler->compilationTime != 1)
    return 0;

  if (!isStringEmpty(hasColon + 1))
    UNKNOWN_SYNTAX;

  int labelStart = 0;

  sscanf(string, "%*[ \t]%n", &labelStart);
  if (!isCorrectName(string + labelStart, hasColon))
    INCORRECT_LABEL;

  Label label{
    .name    = string + labelStart,
    .address = (int)assembler->pc
  };

  if (!findLabel(assembler, label.name, nullptr))
    assembler->labels[assembler->lastLabel++] = label;
  else
    REDECLARATION_OF_LABEL;

  return 0;
}

static int parseArgs(Assembler *assembler, char *string, int isProducent)
{
  assert(assembler);
  assert(string);

  Command *cmd = ((Command *)assembler->code + assembler->pc - 1);

  while (isspace(*string) && *string)
    ++string;

  if  (*string == ':')
    {
      ++string;

      cmd->immed = 1;

      return parseLabel(assembler, string, nullptr) || !isProducent;
    }

  if (*string == '[')
    {
      ++string;

      cmd->mem = 1;
    }

  data_t num = 0;
  cmd_t  reg = 0;

  char regName[MAX_REG_LENGTH + 1] = {};

  int offset = 0;

  int args = sscanf(string, "%d%n+%3s%n", &num, &offset, regName, &offset);

  if (args == 0 && sscanf(string, "%3s", regName))
    {
      if ((reg = getRegNumber(regName)) == -1)
        {
          cmd->immed = 1;

          if (parseLabel(assembler, string, &offset) || (!isProducent && !cmd->mem))
            return ASSEMBLER_INCORRECT_LABEL;
        }
      else
        {
          cmd->reg = 1;

          offset   = 3;

          assembler->code[assembler->pc++] = reg;
          //EMIT(reg, cmd_t)
        }//add typedef for register_t
    }
  else if (args == 1 && (isProducent || (!isProducent && cmd->mem)))
    {
      cmd->immed = 1;
      //EMIT_REG
      *(data_t *)(assembler->code + assembler->pc) = num;
      assembler->pc += sizeof(data_t);
    }
  else if (args == 2 && (isProducent || (!isProducent && cmd->mem)))
    {
      cmd->reg   = 1;
      cmd->immed = 1;

      if ((reg = getRegNumber(regName)) == -1)
        return ASSEMBLER_INCORRECT_ARGUMENTS;


      *(data_t *)(assembler->code + assembler->pc) = num;
      assembler->pc += sizeof(data_t);
      //EMIT(num, data_t)
      assembler->code[assembler->pc++] = reg;
    }
  else
    return ASSEMBLER_INCORRECT_ARGUMENTS;

  string += offset;

  if (cmd->mem && *string++ != ']')          return ASSEMBLER_INCORRECT_ARGUMENTS;
  if (cmd->mem && !(cmd->reg || cmd->immed)) return ASSEMBLER_INCORRECT_ARGUMENTS;
  if (!isStringEmpty(string))                return ASSEMBLER_INCORRECT_ARGUMENTS;

  return 0;
}

static cmd_t getRegNumber(const char *name)
{
  cmd_t reg = 0;

  if (name[0] != 'r' || name[2] != 'x')
    return -1;

  reg = name[1] - 'a';

  if (reg < 0 || reg >= REGISTERS_COUNT)
    return -1;

  return reg;
}

static int findLabel(
                     const Assembler *assembler,
                     const char *name,
                     int *address
                     )
{
  assert(assembler);
  assert(name);

  for (size_t i = 0; i < assembler->lastLabel; ++i)
    {
      if (!strcmpto(name, assembler->labels[i].name, ':'))
        {
          if (address)
            *address = assembler->labels[i].address;

          return 1;
        }
    }

    return 0;
}

static int parseLabel(Assembler *assembler, char *string, int *offset)
{
  assert(assembler);
  assert(string);

  char *startLabel = string;

  while (!isspace(*string) && *string && *string != ']')
    ++string;

  char *endLabel = string;

  if (offset)
    *offset = (int)(endLabel - startLabel);

  if (startLabel == endLabel)
    return ASSEMBLER_INCORRECT_LABEL;

  if (!isStringEmpty(*string == ']' ? string + 1 : string))
    return ASSEMBLER_INCORRECT_LABEL;

  char temp = *endLabel;

  *endLabel = '\0';

  int labelAddress = 0;

  if (findLabel(assembler, startLabel, &labelAddress))
    *(data_t *)(assembler->code + assembler->pc) = labelAddress;
  else
    {
      if (assembler->compilationTime == 1)
        *(data_t *)(assembler->code + assembler->pc) = -1;
      else
        return ASSEMBLER_INCORRECT_LABEL;
    }

  assembler->pc += sizeof(data_t);

  *endLabel = temp;

  return 0;
}

static void printListingLine(Assembler *assembler, char *start, char *string, FILE *listingFile)
{
  assert(assembler);
  assert(start);
  assert(string);
  assert(start < &assembler->code[assembler->pc]);

  if (!listingFile)
    return;

  int stringLength = 0;

  ptrdiff_t     offset     = &assembler->code[assembler->pc] - start;
  unsigned long startIndex = assembler->pc - (unsigned long)offset;

  stringLength += fprintf(listingFile, "%06lX ", startIndex);
  stringLength += fprintf(listingFile, "%02X ", (unsigned char)*start++);

  switch (offset)
    {
    case WITHOUT_ARGUMENTS:
      break;
    case WITH_REGISTER_ARGUMENT:
      {
        stringLength += fprintf(listingFile, "%02X ", (unsigned char)*start);

        break;
      }
    case WITH_CONSTANT_ARGUMENT:
      {
        stringLength += fprintf(listingFile, "%08X ", (unsigned)*(int *)start);

        break;
      }
    case WITH_MIXED_ARGUMENT:
      {
        stringLength += fprintf(listingFile, "%08X ", (unsigned)*(int *)start);
        start += sizeof(int);

        stringLength += fprintf(listingFile, "%02X ", (unsigned char)*start);

        break;
      }
    default:
      {
        fprintf(listingFile, "Unknown type of cmd with arguments!!");

        break;
      }
    }

  fprintf(listingFile, "%*s;%s\n", DEFAULT_OFFSET_FOR_ORIGINAL_CODE - stringLength, "", string);
}
