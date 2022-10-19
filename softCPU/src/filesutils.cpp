#include "filesutils.h"
#include "fiofunctions.h"
#include "errorhandler.h"
#include "title.h"
#include "settings.h"
#include "asserts.h"

int getFileCode(SoftCPU *cpu)
{
  assert(cpu);

  if (!getSourceFileName())
    {
      handleError("SOURCE_FILE_NAME is nullptr. File: %s, Line: %d",
                  __FILE__, __LINE__);

      return ERROR;
    }

  FILE *sourceFile = fopen(getSourceFileName(), "rb");

  if (!sourceFile)
    {
      handleError("Cannot open file [%d]", getSourceFileName());

      return ERROR;
    }

  cpu->codeCapacity = (size_t)checkTitle(sourceFile);

  switch (cpu->codeCapacity)
    {
    case NO_TITLE:
    case INCORRECT_TITLE:
      {
        handleError("File isn`t exectutable!!");

        fclose(sourceFile);

        return ERROR;
      }
    case DIFFERENT_VERSION:
      {
        handleError("Different version!!");

        fclose(sourceFile);

        return ERROR;
      }
    default:
      break;
    }

  cpu->code = (char *)calloc(cpu->codeCapacity, sizeof(char));

  if (!cpu->code)
    {
      handleError("Out of memory");

      fclose(sourceFile);

      return ERROR;
    }

  if (readBin(cpu->code, sizeof(char), cpu->codeCapacity, sourceFile) !=  cpu->codeCapacity)
    {
      handleError("Executable file is broken!!");

      fclose(sourceFile);

      free(cpu->code);

      return ERROR;
    }

  fclose(sourceFile);

  return 0;
}
