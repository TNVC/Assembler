#ifndef STRINGSUTILS_H
#define STRINGSUTILS_H_

#include "stddef.h"

enum StringsutilsError {
  STRINGSUTILS_INCORRECT_ARGUMENTS = -1,
};

/// Parse chars buffer to lines (separator = '\n')
/// @param [in/out] buffer Char buffer to parse
/// @parma [in] bufferSize Size of char buffer
/// @param [out] lineCount Count of lines in buffer
/// @return C-like strings array in dinamic memory or nullptr if was error
char **parseToLines(char *buffer, size_t bufferSize, size_t *lineCount);

/// Compare two C-like strings
/// @param [in] first First string for compare
/// @parma [in] second Second string for compare
/// @return 0 if strings equal, positive if first bigger than second and negative if second bigger than first
int stricmp(const char *first, const char *second);

#endif
