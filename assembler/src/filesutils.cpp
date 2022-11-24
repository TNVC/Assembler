#include "line.h"
#include "filesutils.h"
#include "asserts.h"
#include "errorhandler.h"
#include "fiofunctions.h"
#include "stringsutils.h"
#include "settings.h"

int getFileStrings(Strings *strings)
{
  assert(strings);

  if (!getSourceFileName())
    {
      handleError("SOURCE_FILE_NAME is nullptr. File: %s, Line: %d",
                  __FILE__, __LINE__);

      return ERROR;
    }

  initStrings(strings);

  strings->size = readFile(&strings->originBuffer, getSourceFileName());

  switch (strings->size)
    {
    case (size_t)FIOFUNCTIONS_OUT_OF_MEM:
      {
        handleError("Out of memory");

        destroyStrings(strings);

        return ERROR;
      }
    case (size_t)FIOFUNCTIONS_FAIL_TO_OPEN:
      {
        handleError("Fail to open file [%s]", getSourceFileName());

        destroyStrings(strings);

        return ERROR;
      }
    case (size_t)FIOFUNCTIONS_INCORRECT_ARGUMENTS:
      {
        handleError("readFile() got incorrect arguments. File: %s, Line: %d",
                    __FILE__, __LINE__);

        destroyStrings(strings);

        return ERROR;
      }
    default:
      break;
    }

  return 0;
}

int parseFileStrings(Strings *strings)
{
  assert(strings);

  strings->sequence = parseToLines(strings->originBuffer, strings->size, &strings->stringsCount);

  if (!strings->sequence)
    {
      handleError("Out of memory");

      destroyStrings(strings);

      return ERROR;
    }

  return 0;
}

int openTargetFile(FILE **targetFile)
{
  assert(targetFile);

  if (!getTargetFileName())
    {
      handleError("TARGET_FILE_NAME is nullptr. File: %d, Line: %d",
                  __FILE__, __LINE__);

      return ERROR;
    }

  *targetFile = fopen(getTargetFileName(), "wb");

  if (!*targetFile)
    {
      handleError("Cannot open file [%s]", getTargetFileName());

      return ERROR;
    }

  return 0;
}

int openListingFile(FILE **listingFile)
{
  assert(listingFile);

  if (getListingFileName())
    {
      *listingFile = fopen(getListingFileName(), "w");

      if (!listingFile)
        {
          handleError("Cannot open file [%s]", getListingFileName());

          return ERROR;
        }
    }

  return 0;
}
