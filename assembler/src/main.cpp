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
  /// logging.cpp 6,176 bytes

  /// 24 bytes
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

  /// 12,798 bytes
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

  /// 19,358
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

          fclose(targetFile);

          return 0;
        }
    }

  Assembler assembler = {};

  initAssembler(&assembler);

  /// 28,312 bytes

  /// 410, 825, 1655, 1024 for code
  /// 33,432 bytes - 28,857 bytes(3alloc) for listing and 29,928 bytes - 25,832 bytes for fprintf
  if (!compile(&assembler, strings.sequence, strings.stringsCount))
      /// 32,408 bytes
    if (!compile(&assembler, strings.sequence, strings.stringsCount, listingFile))
      writeCode(&assembler, targetFile);

  fclose(targetFile);
  if (getListingFileName())
    fclose(listingFile);

  destroyAssembler(&assembler);

  destroyStrings(&strings);

  return 0;
}
