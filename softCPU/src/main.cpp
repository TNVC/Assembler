#include <stdio.h>
#include <stdlib.h>
#include "settings.h"
#include "consoleargsutils.h"
#include "fiofunctions.h"
#include "title.h"
#include "garbagecollector.h"
#include "executor.h"
#include "systemlike.h"
#include "errorhandler.h"

int main(const int argc, const char * const argv[])
{
  if (parseConsoleArgs(argc, argv))
    return 0;

  if (!getSourceFileName())
    {
      handleError("SOURCE_FILE_NAME is nullptr. File: %s, Line: %d",
                  __FILE__, __LINE__);

      return 0;
    }

  FILE *sourceFile = fopen(getSourceFileName(), "rb");

  if (!sourceFile)
    {
      handleError("Cannot open file [%d]", getSourceFileName());

      return 0;
    }

  SoftCPU cpu = {};

  cpu.codeCapacity = (size_t)checkTitle(sourceFile);

  switch (cpu.codeCapacity)
    {
    case NO_TITLE:
    case INCORRECT_TITLE:
      {
        handleError("File isn`t exectutable!!");

        fclose(sourceFile);

        return 0;
      }
    case DIFFERENT_VERSION:
      {
        handleError("Different version!!");

        fclose(sourceFile);

        return 0;
      }
    }

  cpu.code = (char *)calloc(cpu.codeCapacity, sizeof(char));

  if (!cpu.code)
    {
      handleError("Out of memory");

      fclose(sourceFile);

      return 0;
    }

  if (readBin(cpu.code, sizeof(char), cpu.codeCapacity, sourceFile) !=  cpu.codeCapacity)
    {
      handleError("Executable file is broken!!");

      fclose(sourceFile);

      free(cpu.code);

      return 0;
    }

  fclose(sourceFile);

  cpu.stack = {};

  stack_init(&cpu.stack, 10);

  execute(&cpu);

  stack_destroy(&cpu.stack);

  free(cpu.code);

  return 0;
}
