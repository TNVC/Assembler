#ifndef EXECUTOR_H_
#define EXECUTOR_H_

#include "stack.h"

/// Count of registers in softCpu
#define REGISTERS_COUNT 4
/// Size of RAM in softCPU
#define RAM_SIZE 128

/// Singelton SoftCPU-object
struct SoftCPU {
  char *code;                     /// <- Array with executable code
  size_t codeCapacity;            /// <- Size of code array
  Stack stack;                    /// <- SoftCPU stack
  int registers[REGISTERS_COUNT]; /// <- SoftCPU registers
  int RAM[RAM_SIZE];              /// <- SoftCPU RAM
  size_t pc;                      /// <- Program counter
};

/// Errors witch may be return from execute()
enum SoftCPUError {
  SOFTCPU_EMPTY_STACK         = 0x01 << 0, /// <- Size of stack less than need for cmd
  SOFTCPU_DIV_BY_ZERO         = 0x01 << 1, /// <- Divided by zero
  SOFTCPU_NO_INPUT            = 0x01 << 2, /// <- No input in programm
  SOFTCPU_INCORRECT_ARGUMENTS = 0x01 << 3, /// <- Invalid type of argument
  SOFTCPU_INCORRECT_JUMP      = 0x01 << 4, /// <- Invalid jump argument (<0 || >=codeCapacity)
  SOFTCPU_UNKNOWN_CMD         = 0x01 << 5, /// <- Invalid cmd code
};

/// Init cpu  to use
/// @param [in/out] cpu SoftCPU object for initilization
void initAssembler(SoftCPU *cpu);

/// Destroy cpu after using
/// @param [in] cpu SoftCPU object for destroy
void destroyAssembler(SoftCPU *cpu);

/// Execute cmds
/// @param [in] cpu SoftCPU object with executable code cell
/// @return Error`s code
int execute(SoftCPU *cpu);

#endif
