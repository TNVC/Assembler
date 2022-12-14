#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "stringsutils.h"
#include "asserts.h"

static size_t splitBuff(char *buffer, size_t size);

String *parseToLines(char *buffer, size_t bufferSize, size_t *lineCount)
{
  assert(buffer);
  assert(lineCount);

  *lineCount = splitBuff(buffer, bufferSize);

  String *strings = (String *)calloc(*lineCount, sizeof(String));

  if (!strings)
    return nullptr;

  size_t currentLine = 0, lineSize = 0;

  for (size_t i = 0; currentLine < *lineCount; ++i)
    {
      strings[currentLine].buff = buffer + i;

      for ( ; buffer[i]; ++i, ++lineSize)
        {
          if (buffer[i] == ';')
            {
              buffer[i] = '\0';

              while(buffer[++i])
                continue;

              --i;
              --lineSize;
            }
        }

      strings[currentLine++].size = lineSize;

      lineSize = 0;
    }

  return strings;
}

static size_t splitBuff(char *buffer, size_t size)
{
  assert(buffer);

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
  assert(first);
  assert(second);

  int i = 0;

  for ( ; first[i] && second[i]; ++i)
    if (tolower(first[i]) != tolower(second[i]))
      return tolower(first[i]) - tolower(second[i]);

  return tolower(first[i]) - tolower(second[i]);
}

int isStringEmpty(const char *string)
{
  for ( ; *string; ++string)
    if (!isspace(*string))
      return 0;

  return 1;
}

int strcmpto(const char *first, const char *second, char determinant)
{
  assert(first);
  assert(second);

  int i = 0;

  for ( ; first[i]                && second[i] &&
          first[i] != determinant && second[i] != determinant; ++i)
    if (first[i] != second[i])
      return first[i] - second[i];

  if ((first[i]  == '\0' || first[i]  == determinant) &&
      (second[i] == '\0' || second[i] == determinant))
    return 0;

  return first[i] - second[i];
}


int hasSpace(const char *start, const char *end)
{
  assert(start);
  assert(end);

  while (start != end)
    if (isspace(*start++))
      return 1;

  return 0;
}

int isCorrectName(const char *start, const char *end)
{
  assert(start);
  assert(end);

  for ( ; start != end; ++start)
    {
      if (!(isalnum(*start) || *start == '_' || *start == '$'))
        return 0;
    }

  return 1;
}
