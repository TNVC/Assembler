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
  ASSEMBLER_UNKNOWN_SYNTAX      = 0x01 << 0, /// <- Invalid label syntax
  ASSEMBLER_UNKNOWN_CMD         = 0x01 << 1, /// <- Cmd wasn`t defination in cmd.h
  ASSEMBLER_INCORRECT_ARGUMENTS = 0x01 << 2, /// <- Invalid argument syntax
  ASSEMBLER_OUT_OF_MEMORY       = 0x01 << 3, /// <- Heap is crowded
  ASSEMBLER_INCORRECT_LABEL     = 0x01 << 4, /// <- Label wasn`t declarate or declarate twice
};

/// Struct with info about label
struct Label {
  char  *name;    // <- Pointer to start label
  int    address; // <- Address where label was declarate first time
};

/// Singelton assembler-object
struct Assembler {
  char  *code;               /// <- Array with executable code
  size_t codeCapacity;       /// <- Size of code array
  Label  labels[MAX_LABELS]; /// <- Array with labels
  size_t lastLabel;          /// <- Index of first free cell in labels
  size_t compilationTime;    /// <- Count of using in call compile()
};

/// Init assembler to use
/// @param [in/out] assembler Assembler object for initilization
void initAssembler(Assembler *assembler);

/// Destroy assembler after using
/// @param [in] assembler Assembler object for destroy
void destroyAssembler(Assembler *assembler);

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
