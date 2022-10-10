#include <stdlib.h>
#include <string.h>
#include "settings.h"

static char *SOURCE_FILE_NAME    = nullptr;

static char *TARGET_FILE_NAME    = nullptr;

static char *LISTING_FILE_NAME   = nullptr;

static const char *PROGRAMM_NAME = "nullptr";

char *getSourceFileName()
{
  return SOURCE_FILE_NAME;
}

void setSourceFileName(char *fileName)
{
  SOURCE_FILE_NAME = fileName;
}

char *getTargetFileName()
{
  return TARGET_FILE_NAME;
}

void setTargetFileName(char *fileName)
{
  TARGET_FILE_NAME = fileName;
}

char *getListingFileName()
{
  return LISTING_FILE_NAME;
}

void setListingFileName(char *fileName)
{
  LISTING_FILE_NAME = fileName;
}

const char *getProgrammName()
{
  return PROGRAMM_NAME;
}

void setProgrammName(const char *name)
{
  PROGRAMM_NAME = name;
}
