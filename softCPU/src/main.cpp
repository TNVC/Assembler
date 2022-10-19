#include <stdio.h>
#include <stdlib.h>
#include "filesutils.h"
#include "consoleargsutils.h"
#include "softcpu.h"

#define END                                     \
  do                                            \
    {                                           \
      destroySoftCPU(&cpu);                     \
                                                \
      return 0;                                 \
    } while (0)

int main(const int argc, const char * const argv[])
{
  if (parseConsoleArgs(argc, argv))
    return 0;

  SoftCPU cpu = {};

  if (initSoftCPU(&cpu))
    END;

  if (getFileCode(&cpu))
    END;

  execute(&cpu);

  END;
}
