#include <stdio.h>
#include <string.h>
#include "errorhandler.h"
#include "fiofunctions.h"
#include "softcpucmd.h"
#include "disassembler.h"
#include "asserts.h"

#define INT_CHARS_COUNT 10
#define REGISTER_CHARS_COUNT 3
#define OPTIONAL_CHARS 4
#define ARGUMENT_CHARS INT_CHARS_COUNT + REGISTER_CHARS_COUNT + OPTIONAL_CHARS + 1

/// Parse argument of current cmd
/// @param [in] disassembler Dissasembler object with memory and pc
/// @return C-like string with argument
static char *parseArg(Disassembler *disassembler);

int disassemble(Disassembler *disasm, FILE *targetFile)
{
  assert(disasm);
  assert(targetFile);

  fprintf(targetFile, ".VideoMode = %s\n", disasm->videoMode ? "Window" : "Console");

  for (disasm->pc = 0; disasm->pc < disasm->codeCapacity; ++disasm->pc)
    {
      Command cmd = *((Command *)disasm->code + disasm->pc);

      switch (cmd.code)
        {

#define DEF_CMD(name, num, hasArg, isProducentArg, ...)               \
          case num:                                                   \
            {                                                         \
              fprintf(targetFile, #name);                             \
                                                                      \
              if (hasArg)                                             \
                {                                                     \
                  char *arg = parseArg(disasm);                       \
                                                                      \
                  fprintf(targetFile, " %s", arg ? arg : "nullptr");  \
                }                                                     \
                                                                      \
              break;                                                  \
            }

#include "cmd.h"

#undef DEF_CMD

        default:
          {
            fprintf(targetFile, "[UNKNOWN CMD]");
          }
        }

      putc('\n', targetFile);
    }

  return 0;
}


static char *parseArg(Disassembler *disasm)
{
  static char argument[ARGUMENT_CHARS] = {};

  int index = 0;

  Command cmd = *((Command *)disasm->code + disasm->pc++);

  if (cmd.mem && !(cmd.reg || cmd.immed))
    return nullptr;

  if (cmd.mem)
    argument[index++] = '[';

  cmd_t regNum = -1;
  data_t num   =  0;

  if (cmd.immed)
    {
      if (disasm->pc + sizeof(data_t) >= disasm->codeCapacity)
        return nullptr;

      num = *(data_t *)(disasm->code + disasm->pc);
      disasm->pc += sizeof(data_t);

      int offset = sprintf(argument + index, "%d", num);

      index += offset;
    }

  if (cmd.immed && cmd.reg)
    argument[index++] = '+';

  if (cmd.reg)
    {
      if (disasm->pc + sizeof(cmd_t) >= disasm->codeCapacity)
        return nullptr;

      regNum = disasm->code[disasm->pc++];

      argument[index++] = 'r';
      argument[index++] = 'a' + regNum;
      argument[index++] = 'x';
    }

  if (cmd.mem)
    argument[index++] = ']';

  argument[index] = '\0';

  --disasm->pc;

  return argument;
}
