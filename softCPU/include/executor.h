#ifndef EXECUTOR_H_
#define EXECUTOR_H_

#include "stack.h"

#define REGISTERS_COUNT 4
#define RAM_SIZE 1024

struct SoftCPU {
  char *code;
  size_t codeCapacity;
  Stack stack;
  int registers[REGISTERS_COUNT];
  int RAM[RAM_SIZE];
  size_t pc;
};

enum TitleError {
  INCORRECT_TITLE   = 0x01 << 0,
  NO_TITLE          = 0x01 << 1,
  DIFFERENT_VERSION = 0x01 << 2,
};

enum SoftCPUError {
  SOFTCPU_EMPTY_STACK         = 0x01 << 0,
  SOFTCPU_DIV_BY_ZERO         = 0x01 << 1,
  SOFTCPU_NO_INPUT            = 0x01 << 2,
  SOFTCPU_INCORRECT_ARGUMENTS = 0x01 << 3,
  SOFTCPU_INCORRECT_JUMP      = 0x01 << 4,
  SOFTCPU_UNKNOWN_CMD         = 0x01 << 5,
};

/// Check the title in file
/// @param [in] filePtr Executable file with title
/// @return Size of code from title or error`s code
int checkTitle(FILE *filePtr);

/// Execute cmds
/// @param [in] cpu SoftCPU object with executable code cell
/// @return Error`s code
int execute(SoftCPU *cpu);

#endif
