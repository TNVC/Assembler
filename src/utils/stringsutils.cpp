#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "stringsutils.h"
#include "systemlike.h"
#include "asserts.h"

static size_t splitBuff(char *buffer, size_t size);

char **parseToLines(char *buffer, size_t bufferSize, size_t *lineCount)
{
  if (!isPointerCorrect(buffer) || !bufferSize || !isPointerCorrect(lineCount))
    return nullptr;

  *lineCount = splitBuff(buffer, bufferSize);

  if (*lineCount == (size_t)STRINGSUTILS_INCORRECT_ARGUMENTS)
    return nullptr;

  char **strings = (char **)calloc(*lineCount, sizeof(char *));

  if (!isPointerCorrect(strings))
    return nullptr;

  size_t currentLine = 0, lineSize = 0;

  for (size_t i = 0; currentLine < *lineCount; )
    {
      strings[currentLine] = buffer + i;

      while (buffer[i])
        {
          if (buffer[i] == ';')
            buffer[i] = '\0';
            
          ++lineSize;
          ++i;
        }

      ++currentLine;

      lineSize = 0;
    }

  return strings;
}

static size_t splitBuff(char *buffer, size_t size)
{
  if (!isPointerCorrect(buffer) || !size)
    {
      return (size_t)STRINGSUTILS_INCORRECT_ARGUMENTS;
    }

    size_t lines = 0;

    char *lastFindChar = strchr(buffer, '\n');

    for ( ; lastFindChar; lastFindChar = strchr(lastFindChar, '\n'))
    {
        ++lines;

        *lastFindChar = '\0';

        ++lastFindChar;

        if (lastFindChar >= buffer + size)
            break;
    }

    return lines;
}

int stricmp(const char *first, const char *second)
{
  assert(isPointerReadCorrect(first));
  assert(isPointerReadCorrect(second));

  int i = 0;

  for ( ; first[i] && second[i]; ++i)
    if (tolower(first[i]) != tolower(second[i]))
      return tolower(first[i]) - tolower(second[i]);

  return tolower(first[i]) - tolower(second[i]);
}
