#ifndef FILESUTILS_H_
#define FILESUTILS_H_

#include "disassembler.h"

const int ERROR = 1;

/// Load from source file code array to disasm
/// @param [in/out] disasm Disassembler object
/// @return Error`s code
int getFileCode(Disassembler *disasm);

/// Open target file and set targetFile to it
/// @param [out] targetFile Pointer to file, which need to set
/// @return Error`s code
int openTargetFile(FILE **targetFile);

#endif
