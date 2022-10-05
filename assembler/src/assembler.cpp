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
  int *array = nullptr;
  
  if (fileMode == BIN_OUTPUT_FILE)
    {
      array = (int *)calloc(2*lineCount, sizeof(int));
  
      if (!isPointerCorrect(array))
        handleError("Out of memory in file %s at line %d!!", __FILE__, __LINE__);
    }
  
  Title title = {};
  
  title.securityCode[0] = SECURITY_CODE[0];
  title.securityCode[1] = SECURITY_CODE[1];
  title.securityCode[2] = SECURITY_CODE[2];
  
  title.version = SOFTCPU_CMD_VERSION;
  
  title.cmdCount = lineCount;
	
  switch (fileMode)
  {
  case BIN_OUTPUT_FILE:
    {
      if (fwrite(&title, sizeof(title), 1, targetFile) != 1)
      	ERROR;
  
      break;
    }
  case TXT_OUTPUT_FILE:
    {
      fprintf(targetFile, "%s %d %d\n", title.securityCode, title.version, title.cmdCount);
      
      break;
    }
  default:
    {
      ERROR;
    }
  }
  
  size_t lastIndex = 0;

  for (size_t i = 0; i < lineCount; ++i, ++lastIndex)
    {
      char cmd[MAX_WORD_LENGTH + 1] = "";
      
      if (sscanf(sourceLines[i], "%s", cmd) != 1)
        ;//continue;
      
      char *temp = fileMode == BIN_OUTPUT_FILE ? (char *)(array + lastIndex++) : (char *)sourceLines[i];

      if      (!stricmp(cmd, SOFTCPU_CMD[SOFTCPU_PUSH]))
        {
          long startWordIndex = strchr(sourceLines[i], cmd[0]) - sourceLines[i];

          int num = 0;

          if (sscanf(sourceLines[i] + SOFTCPU_WORD_LENGTH[SOFTCPU_PUSH] + startWordIndex, "%d", &num) !=  1)
            handleError("No arguments for %s in line: %d", SOFTCPU_CMD[SOFTCPU_PUSH], i + 1);
          
          if      (fileMode == BIN_OUTPUT_FILE)
            {
              write(temp                       , SOFTCPU_PUSH, fileMode);
              write(temp + sizeof(SOFTCPU_PUSH), num         , fileMode);
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
           handleError("Unknown cmd[%s] in line %d!!", cmd, i + 1);
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
