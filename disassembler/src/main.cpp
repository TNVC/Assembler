#include <stdlib.h>
#include <stdio.h>
#include "consoleargsutils.h"
#include "disassembler.h"
#include "filesutils.h"

#define END                                     \
  do                                            \
    {                                           \
      destroyDisassembler(&disassembler);       \
                                                \
      return 0;                                 \
    } while (0)

int main(const int argc, const char * const argv[])
{
  if (parseConsoleArgs(argc, argv))
    return 0;

  Disassembler disassembler = {};

  initDisassembler(&disassembler);

  if (getFileCode(&disassembler))
    END;

  FILE *targetFile = nullptr;

  if (openTargetFile(&targetFile))
    END;

  disassemble(&disassembler, targetFile);

  fclose(targetFile);

  END;
}
