#include <stdlib.h>
#include "fiofunctions.h"
#include "stringsutils.h"
#include "settings.h"
#include "consoleargsutils.h"
#include "assembler.h"
#include "systemlike.h"
#include "errorhandler.h"
 
static char **LINES = nullptr; 
      
static void freeResources();
      
int main(const int argc, const char *argv[])
{
  atexit(freeResources);

  parseConsoleArgs(argc, argv);

  char  *buffer    = nullptr;
  size_t lineCount = 0;
  size_t size      = 0;

  if (!isPointerCorrect(SOURCE_FILE_NAME))
    ERROR;

  size = readFile(&buffer, SOURCE_FILE_NAME);

  if ((size_t)FIOFUNCTIONS_OUT_OF_MEM          == size ||
      (size_t)FIOFUNCTIONS_FAIL_TO_OPEN        == size ||
      (size_t)FIOFUNCTIONS_INCORRECT_ARGUMENTS == size)
    ERROR;

  char **lines = parseToLines(buffer, size, &lineCount);
  
  LINES = lines;

  if (!isPointerCorrect(lines))
    ERROR;
    
  if (!isPointerCorrect(TARGET_FILE_NAME))
    ERROR;

  FILE *targetFile = fopen(TARGET_FILE_NAME, OUTPUT_FILE_TYPE == BIN_OUTPUT_FILE ? "wb" : "w");

  if (!isPointerCorrect(targetFile))
    ERROR;

  assembler(lines, lineCount, targetFile, OUTPUT_FILE_TYPE);
  
  fclose(targetFile);
  
  return 0;
}

static void freeResources()
{
  if (isPointerCorrect(SOURCE_FILE_NAME))
    free(SOURCE_FILE_NAME);
  if (isPointerCorrect(TARGET_FILE_NAME))
    free(TARGET_FILE_NAME);
  if (isPointerCorrect(LINES))
    free(LINES);
}
