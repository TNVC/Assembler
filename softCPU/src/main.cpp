#include <stdio.h>
#include <stdlib.h>
#include "settings.h"
#include "consoleargsutils.h"
#include "fiofunctions.h"
#include "executor.h"
#include "systemlike.h"
#include "errorhandler.h"

int main(const int argc, const char *argv[])
{
  parseConsoleArgs(argc, argv);

  if (!isPointerCorrect(SOURCE_FILE_NAME))
      ERROR;
    
  FILE *source = fopen(SOURCE_FILE_NAME, "rb");
    
  if (!isPointerCorrect(source))
      ERROR;
    
  size_t cmdCount = checkTitle(source);
  
  int *cmds = (int *)calloc(2*cmdCount, sizeof(int));
  
  if (readBin(cmds, sizeof(int), 2*cmdCount, source) !=  2*cmdCount)
    {
      fclose(source);
      
      ERROR;
    }
  
  if (!isPointerCorrect(cmds))
    {
      fclose(source);
    
      ERROR;
    }
  
  execute(cmds, cmdCount);
  
  fclose(source);

  return 0;
}
