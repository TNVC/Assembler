#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "fiofunctions.h"
#include "assembler.h"
#include "softcpucmd.h"
#include "systemlike.h"
#include "errorhandler.h"
#include "stringsutils.h"
#include "settings.h"

/// Generate title for output file
/// @param [in] cmdCount Count of cmd in source file
/// @param [in] fileMode Type of output executable file 
/// @param [out] titleSize size of title
/// @return Pointer to dimanic memory with title
/// @note In bin mode title isn`t a C-like string
static char *generateTitle(int cmdCount, int fileMode, size_t *titleSize);

/// Count length of int value
/// @param [in] value Integer value witch length need to know
/// @return Length of int-value
static size_t intLength(int value);

/// Write to buffer val
/// @param [out] buffer Write-buffer
/// @param [in] val Value for write
/// @param [in] fileMode Type of output executable file 
static void write(void *buffer, int val, int fileMode);

void assembler(char **sourceLines, size_t lineCount, FILE *targetFile, int fileMode)
{
  int cmdCount = (int)lineCount;
  
  int *array = nullptr;
  
  if (fileMode == BIN_OUTPUT_FILE)
    {
      array = (int *)calloc(2*lineCount, sizeof(int));
  
      if (!isPointerCorrect(array))
        handleError("Out of memory in file %s at line %d!!", __FILE__, __LINE__);
    }
    
  size_t titleSize = 0;
    
  char *title = generateTitle(cmdCount, fileMode, &titleSize);
	
  switch (fileMode)
  {
  case BIN_OUTPUT_FILE:
    {
      fwrite(&title, titleSize, sizeof(char), targetFile);
  
      break;
    }
  case TXT_OUTPUT_FILE:
    {
      fprintf(targetFile, "%s\n", title);
      
      break;
    }
  default:
    {
      handleError("Error in file %s at line %d", __FILE__, __LINE__);
    }
  }
    
  free(title);

  for (size_t i = 0; i < lineCount; ++i)
    {
      char cmd[MAX_WORD_LENGTH + 1] = "";
      
      if (sscanf(sourceLines[i], "%s", cmd) != 1)
        continue;
      
      void *temp = fileMode == BIN_OUTPUT_FILE ? (void *)(array + i++) : (void *)sourceLines[i];

      if      (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_PUSH]))
        {
          long startWordIndex = strchr(sourceLines[i], cmd[0]) - sourceLines[i];

          int num = 0;

          if (sscanf(sourceLines[i] + SOFTCPU_WORD_LENGTH[SOFTCPU_PUSH] + startWordIndex, "%d", &num) !=  1)
            handleError("No arguments for %s in line: %d", SOFTCPU_CMD[SOFTCPU_PUSH], i + 1);
          
          if      (fileMode == BIN_OUTPUT_FILE)
            {
              write((array + i++), SOFTCPU_PUSH, fileMode);
              write((array + i)  , num         , fileMode);
            }
          else if (fileMode == TXT_OUTPUT_FILE)
            {
              write(sourceLines[i]                                   , SOFTCPU_PUSH, fileMode);
              *(sourceLines[i] + intLength(SOFTCPU_PUSH)) = ' ';
              write(sourceLines[i] + intLength(SOFTCPU_PUSH) + 1, num, fileMode);
            }
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_ADD]))
        {
          write(temp, SOFTCPU_ADD, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_SUB]))
        {
          write(temp, SOFTCPU_SUB, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_MUL]))
        {
          write(temp, SOFTCPU_MUL, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_DIV]))
        {
          write(temp, SOFTCPU_DIV, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_OUT]))
        {
          write(temp, SOFTCPU_OUT, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_HLT]))
        {
          write(temp, SOFTCPU_HLT, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_DUMP]))
        {
          write(temp, SOFTCPU_DUMP, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_IN]))
        {
          write(temp, SOFTCPU_IN, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_COPY]))
        {
          write(temp, SOFTCPU_COPY, fileMode);
        }
      else if (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_SWAP]))
        {
          write(temp, SOFTCPU_SWAP, fileMode);
        }
        else
        {
           handleError("Unknown cmd!!");
        }
    }
    
    if (fileMode == BIN_OUTPUT_FILE)
      fwrite(array, 2*lineCount, sizeof(int), targetFile);
    else 
    {
      for (size_t i = 0; i < lineCount; ++i)
        fprintf(targetFile, "%s\n", sourceLines[i]);
    }
    
    if (fileMode == BIN_OUTPUT_FILE)
      free(array);
}

static char *generateTitle(int cmdCount, int fileMode, size_t *titleSize)
{
  char *title = nullptr;

  switch (fileMode)
  {
  case BIN_OUTPUT_FILE:
    {
      *titleSize = 2*sizeof(char) + 2*sizeof(int);
    
      title = (char *)calloc(1, *titleSize);
  
      if (!isPointerCorrect(title))
  	handleError("Out of memory in file %s at line %d!!", __FILE__, __LINE__);
  
      title[0] = 'D';
      title[1] = 'B';
      *((int *)(title + 2) + 0) = SOFTCPU_CMD_VERSION;
      *((int *)(title + 2) + 1) = cmdCount;
  
      break;
    }
  case TXT_OUTPUT_FILE:
    {
      *titleSize = 5*sizeof(char) + intLength(cmdCount) + intLength(SOFTCPU_CMD_VERSION);
      
      title = (char *)calloc(1, *titleSize);
      
      if (!isPointerCorrect(title))
  	handleError("Out of memory in file %s at line %d!!", __FILE__, __LINE__);
  	
      sprintf(title, "DB %d %d", SOFTCPU_CMD_VERSION, cmdCount);
      
      break;
    }
  default:
    {
      handleError("Error in file %s at line %d", __FILE__, __LINE__);
    }
  }
  
  return title;
}

static size_t intLength(int value)
{
  int charsNum = !(value > 0);

  value = value * !charsNum - value * charsNum;
  while (value > 0)
    {
      ++charsNum;

      value /= 10;
    }

  return (size_t)charsNum;
}

static void write(void *buffer, int val, int fileMode)
{
  if      (fileMode == BIN_OUTPUT_FILE)
    {
      *(int *)buffer = val;
    }
  else if (fileMode == TXT_OUTPUT_FILE)
    {
      sprintf((char *)buffer, "%d", val);
    }        
}
