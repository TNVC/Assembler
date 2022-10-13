#ifndef DISASSEMBLER_H_
#define DISASSEMBLER_H_

#include <stddef.h>
#include <stdio.h>

/// Singelton disassembler-object
struct Disassembler {
  char *code;          /// <- Array with executable code
  size_t codeCapacity; /// <- Size of code array
  size_t pc;           /// <- Programm counter
};

/// Init disassembler to use
/// @param [in/out] disasm Disassembler object for initilization
void initDisassembler(Disassembler *disasm);

/// Destroy disassembler after using
/// @param [in] disasm Disassembler object for destroy
void destroyDisassembler(Disassembler *disasm);

/// Disasseble cmds
/// @param [in] disassembler Disassembler object with executable code cell
/// @param [in] targetFile File for write disassemble code
/// @return Error`s code
int disassemble(Disassembler *disassembler, FILE *targetFile);

#endif
