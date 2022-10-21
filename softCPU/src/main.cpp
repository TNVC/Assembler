#include <stdio.h>
#include <stdlib.h>
#include "filesutils.h"
#include "consoleargsutils.h"
#include "softcpu.h"

int main(const int argc, const char * const argv[])
{
  if (parseConsoleArgs(argc, argv))
    return 0;

  SoftCPU cpu = {};

  if (initSoftCPU(&cpu))
    {
      destroySoftCPU(&cpu);

      return 0;
    }

  if (getFileCode(&cpu))
    {
      destroySoftCPU(&cpu);

      return 0;
    }

  execute(&cpu);

  destroySoftCPU(&cpu);

  return 0;
}
