#include <stdlib.h>
#include <stdio.h>
#include "consoleargsutils.h"
#include "disassembler.h"
#include "filesutils.h"

int main(const int argc, const char * const argv[])
{
  if (parseConsoleArgs(argc, argv))
    return 0;

  Disassembler disassembler = {};

  initDisassembler(&disassembler);

  if (getFileCode(&disassembler))
    {
      destroyDisassembler(&disassembler);

      return 0;
    }


  FILE *targetFile = nullptr;

  if (openTargetFile(&targetFile))
    {
      destroyDisassembler(&disassembler);

      return 0;
    }


  disassemble(&disassembler, targetFile);

  fclose(targetFile);

  destroyDisassembler(&disassembler);

  return 0;
}
