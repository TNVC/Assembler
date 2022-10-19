#ifndef ASSEMBLER_H_
#define ASSEMBLER_H_

#include <stdio.h>
#include <stddef.h>
#include "softcpucmd.h"
#include "line.h"

/// Max count of labels in source code on assembler
#define MAX_LABELS 256

/// Errors wicht may be return from compile()
enum AssemblerError {
  ASSEMBLER_UNKNOWN_SYNTAX      = 0x01 << 0, /// <- Invalid syntax
  ASSEMBLER_UNKNOWN_CMD         = 0x01 << 1, /// <- Cmd wasn`t defination in cmd.h
  ASSEMBLER_INCORRECT_ARGUMENTS = 0x01 << 2, /// <- Invalid argument syntax
  ASSEMBLER_OUT_OF_MEMORY       = 0x01 << 3, /// <- Heap is crowded
  ASSEMBLER_INCORRECT_LABEL     = 0x01 << 4, /// <- Label wasn`t declarate,  declarate twice or has unallowed chars
};

/// Struct with info about label
struct Label {
  char  *name;    // <- Pointer to start label
  int    address; // <- Address where label was declarate first time
};

/// Singelton assembler-object
struct Assembler {
  cmd_t *code;               /// <- Array with executable code
  size_t codeCapacity;       /// <- Size of code array
  Label  labels[MAX_LABELS]; /// <- Array with labels
  size_t lastLabel;          /// <- Index of first free cell in labels
  size_t compilationTime;    /// <- Count of using in call compile()
  size_t pc;                 /// <- Programm counter
};

/// Init assembler to use
/// @param [in/out] assembler Assembler object for initilization
void initAssembler(Assembler *assembler);

/// Destroy assembler after using
/// @param [in] assembler Assembler object for destroy
void destroyAssembler(Assembler *assembler);

/// Allocate code array
/// @param [in/out] assembler Assembler object
/// @param [in] startCapacity Initial capacity for code array
/// @return Error`s code
int allocateAssemblerCode(Assembler *assembler, size_t startCapacity);

/// Resize assembler code array
/// @param [in/out] assembler Assembler object
/// @return Error`s code
int increaseAssemblerCodeCapacity(Assembler *assembler);

/// Check if an increase is needed
/// @param [in] assembler Assembler object
/// @return 1 if needed or 0 if not
int isNeedResizeAssemblerCode(Assembler *assembler);

/// Trim code array
/// @param [in/out] assembler Assembler object
/// @return Error`s code
int trimAssemblerCode(Assembler *assembler);

/// Compile code
/// @param [in/out] assembler Assembler object for repeat compile
/// @param [in] strings Each lines from source file geted from parseToLine()
/// @param [in] stringsCount Size of strings
/// @param [in] listingFile File for write compile listing
/// @return Error`s code
int compile(Assembler *assembler, String *strings, size_t stringsCount, FILE *listingFile = nullptr);

/// Write code from assembler to targetFile
/// @param [in] assembler Assembler object with code cell
/// @param [in] tagertFile File for write
/// @note targetFile have to open in bin mode
void writeCode(const Assembler *assembler, FILE *targetFile);

#endif
