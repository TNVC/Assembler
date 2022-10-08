#ifndef ASSEMBLER_H_
#define ASSEMBLER_H_

#include <stdio.h>
#include <stddef.h>
#include "softcpucmd.h"
#include "line.h"

#define MAX_LABELS 256

enum AssemblerError {
  ASSEMBLER_UNKNOWN_SYNTAX      = 0x01 << 0,
  ASSEMBLER_UNCNOWN_CMD         = 0x01 << 1,
  ASSEMBLER_INCORRECT_ARGUMENTS = 0x01 << 2,
  ASSEMBLER_OUT_OF_MEMORY       = 0x01 << 3,
  ASSEMBLER_INCORRECT_LABEL     = 0x01 << 4,
};

struct Label {
  char  *name;
  int    address;
};

struct Assembler {
  char  *code;
  size_t codeCapacity;
  Label  labels[MAX_LABELS];
  size_t lastLabel;
  size_t compilationTime;
};

/// Compile code to executable file
/// @param [in/out] assembler Assembler object for repeat compile
/// @param [in] strings Each lines from source file geted from parseToLine()
/// @param [in] stringsCount Size of strings
/// @param [in] targetFile File for output
/// @return Error`s code
int compile(Assembler *assembler, String *strings, size_t stringsCount, FILE *targetFile);

/// Generete execute file title
/// @param [in] assembler Assembler object with info for generator
/// @return Title object
Title generateTitle(const Assembler *assembler);

#endif
