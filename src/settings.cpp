#include <stdlib.h>
#include <string.h>
#include "settings.h"

static char *SOURCE_FILE_NAME    = nullptr;

#if defined ASSEMBLER or defined DISASSEMBLER
static char *TARGET_FILE_NAME    = nullptr;
#endif

#if defined ASSEMBLER
static char *LISTING_FILE_NAME   = nullptr;
#endif

static const char *PROGRAMM_NAME = "nullptr";

char *getSourceFileName()
{
  return SOURCE_FILE_NAME;
}

void setSourceFileName(char *fileName)
{
  SOURCE_FILE_NAME = fileName;
}

#if defined ASSEMBLER or defined DISASSEMBLER

char *getTargetFileName()
{
  return TARGET_FILE_NAME;
}

void setTargetFileName(char *fileName)
{
  TARGET_FILE_NAME = fileName;
}

#endif

#if defined ASSEMBLER

char *getListingFileName()
{
  return LISTING_FILE_NAME;
}

void setListingFileName(char *fileName)
{
  LISTING_FILE_NAME = fileName;
}

#endif

const char *getProgrammName()
{
  return PROGRAMM_NAME;
}

void setProgrammName(const char *name)
{
  PROGRAMM_NAME = name;
}
