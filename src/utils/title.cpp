#include <string.h>
#include <stdio.h>
#include "title.h"
#include "errorhandler.h"
#include "attributes.h"
#include "fiofunctions.h"
#include "asserts.h"

Title generateTitle(int capacity, int videoMode)
{
  assert(capacity > 0);

  Title title = {};

  title.securityCode[0] = SECURITY_CODE[0];
  title.securityCode[1] = SECURITY_CODE[1];
  title.securityCode[2] = SECURITY_CODE[2];

  title.version = SOFTCPU_CMD_VERSION;

  title.cmdCount = capacity;

  title.videoMode = (char)videoMode;

  return title;
}

int checkTitle(FILE *filePtr, int *videoMode)
{
  assert(filePtr);
  assert(videoMode);

  Title title = {};

  if (readBin(&title, sizeof(title), 1, filePtr) != 1)
    return NO_TITLE;

  if (strcmp(title.securityCode, SECURITY_CODE))
    return INCORRECT_TITLE;

  if (title.version != SOFTCPU_CMD_VERSION)
    {
      handleError("v.CPU: [%d] v.Exectable: [%d]", SOFTCPU_CMD_VERSION, title.version);

      return DIFFERENT_VERSION;
    }

  if (title.videoMode < 0 || title.videoMode >= ATTRIBUTE_COUNT)
    {
      handleError("Incorrect VideoMode[%d]", title.videoMode);

      return INCORRECT_TITLE;
    }

  *videoMode = title.videoMode;

  return title.cmdCount;
}
