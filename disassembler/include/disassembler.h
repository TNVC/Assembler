#ifndef DISASSEMBLER_H_
#define DISASSEMBLER_H_

#include <stddef.h>
#include <stdio.h>
#include "softcpucmd.h"

enum DisassemblerError {
  DISASSEMBLER_OUT_OF_MEMORY = 0x01 << 0, /// <- Heap is crowded
};

/// Singelton disassembler-object
struct Disassembler {
  cmd_t *code;         /// <- Array with executable code
  size_t codeCapacity; /// <- Size of code array
  size_t pc;           /// <- Programm counter
};

/// Init disassembler to use
/// @param [in/out] disasm Disassembler object for initilization
void initDisassembler(Disassembler *disasm);

/// Destroy disassembler after using
/// @param [in] disasm Disassembler object for destroy
void destroyDisassembler(Disassembler *disasm);

/// Allocate code array
/// @param [in/out] disasm Disassembler object
/// @return Error`s code
/// @note Get capacity for code array from disasm.codeCapacity
int allocateDisassemblerCode(Disassembler *disasm);

/// Disasseble cmds
/// @param [in] disassembler Disassembler object with executable code cell
/// @param [in] targetFile File for write disassemble code
/// @return Error`s code
int disassemble(Disassembler *disassembler, FILE *targetFile);

#endif
