#ifndef ASSEMBLER_H_
#define ASSEMBLER_H_

#include <stdio.h>
#include <stddef.h>

/// Compile code to executable file
/// @param [in] sourceLines Each lines in source file split by '\\n'
/// @param [in] lineCount Size of sourceLines
/// @param [in] targetFile File for output
/// @param [in] fileMode Mode of executable file (see settings.h)
/// @note Modificate sourceLines if fileMode == TXT_OUTPUT_FILE
void assembler(char **sourceLines, size_t lineCount, FILE *targetFile, int fileMode);

#endif
