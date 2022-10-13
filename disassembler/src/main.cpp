#include <stdlib.h>
#include <stdio.h>
#include "consoleargsutils.h"
#include "fiofunctions.h"
#include "settings.h"
#include "title.h"
#include "errorhandler.h"
#include "disassembler.h"

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

  Disassembler disassembler = {};

  disassembler.codeCapacity = (size_t)checkTitle(sourceFile);

  switch (disassembler.codeCapacity)
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

  disassembler.code = (char *)calloc(disassembler.codeCapacity, sizeof(char));

  if (!disassembler.code)
    {
      handleError("Out of memory");

      fclose(sourceFile);

      return 0;
    }


  if (readBin(disassembler.code, sizeof(char), disassembler.codeCapacity, sourceFile) !=  disassembler.codeCapacity)
    {
      handleError("Executable file is broken!!");

      fclose(sourceFile);

      free(disassembler.code);

      return 0;
    }

  fclose(sourceFile);

  if (!getTargetFileName())
    {
      handleError("TARGET_FILE_NAME is nullptr. File: %d, Line: %d",
                  __FILE__, __LINE__);

      free(disassembler.code);

      return 0;
    }

  FILE *targetFile = fopen(getTargetFileName(), "wb");

  if (!targetFile)
    {
      handleError("Cannot open file [%d]", getTargetFileName());

      free(disassembler.code);

      return 0;
    }

  disassemble(&disassembler, targetFile);

  fclose(targetFile);

  free(disassembler.code);

  return 0;
}
