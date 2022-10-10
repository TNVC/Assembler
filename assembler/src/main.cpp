#include <stdlib.h>
#include "assembler.h"
#include "softcpucmd.h"
#include "consoleargsutils.h"
#include "garbagecollector.h"
#include "fiofunctions.h"
#include "line.h"
#include "stringsutils.h"
#include "settings.h"
#include "errorhandler.h"
#include "systemlike.h"

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

  Strings strings = {};

  initStrings(&strings);

  strings.size = readFile(&strings.originBuffer, getSourceFileName());

  switch (strings.size)
    {
    case (size_t)FIOFUNCTIONS_OUT_OF_MEM:
      {
        handleError("Out of memory");

        destroyStrings(&strings);

        return 0;
      }
    case (size_t)FIOFUNCTIONS_FAIL_TO_OPEN:
      {
        handleError("Fail to open file [%s]", getSourceFileName());

        destroyStrings(&strings);

        return 0;
      }
    case (size_t)FIOFUNCTIONS_INCORRECT_ARGUMENTS:
      {
        handleError("readFile() got incorrect arguments. File: %s, Line: %d",
                    __FILE__, __LINE__);

        destroyStrings(&strings);

        return 0;
      }
    }

  strings.sequence = parseToLines(strings.originBuffer, strings.size, &strings.stringsCount);

  if (!strings.sequence)
    {
      handleError("Out of memory");

      destroyStrings(&strings);

      return 0;
    }

  if (!getTargetFileName())
    {
      handleError("TARGET_FILE_NAME is nullptr. File: %d, Line: %d",
                  __FILE__, __LINE__);

      destroyStrings(&strings);

      return 0;
    }

  FILE *targetFile = fopen(getTargetFileName(), "wb");

  if (!targetFile)
    {
      handleError("Cannot open file [%s]", getTargetFileName());

      destroyStrings(&strings);

      return 0;
    }

  FILE *listingFile = nullptr;

  if (getListingFileName())
    {
      listingFile = fopen(getListingFileName(), "w");

      if (!listingFile)
        {
          handleError("Cannot open file [%s]", getListingFileName());

          destroyStrings(&strings);

          return 0;
        }
    }

  Assembler assembler = {};

    if (!compile(&assembler, strings.sequence, strings.stringsCount))
      if (!compile(&assembler, strings.sequence, strings.stringsCount, listingFile))
       writeCode(&assembler, targetFile);

  fclose(targetFile);

  free(assembler.code);

  destroyStrings(&strings);

  return 0;
}
