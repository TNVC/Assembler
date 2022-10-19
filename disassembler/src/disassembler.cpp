#include <stdlib.h>
#include "disassembler.h"
#include "errorhandler.h"
#include "asserts.h"

void initDisassembler(Disassembler *disasm)
{
  assert(disasm);

  disasm->code         = nullptr;
  disasm->codeCapacity = 0;
  disasm->pc           = 0;
}

void destroyDisassembler(Disassembler *disasm)
{
  assert(disasm);

  free(disasm->code);
  disasm->codeCapacity = 0;
  disasm->pc           = 0;
}

int allocateDisassemblerCode(Disassembler *disasm)
{
  assert(disasm);

  disasm->code = (cmd_t *)calloc(disasm->codeCapacity, sizeof(cmd_t));

  if (!disasm->code)
    {
      handleError("Out of memory");

      return DISASSEMBLER_OUT_OF_MEMORY;
    }

  return 0;
}
