#ifndef EXECUTOR_H_
#define EXECUTOR_H_

#include "stack.h"
#include "softcpucmd.h"

/// Count of registers in softCpu
/// Num - Name - description
/// 0   - rax  - General register
/// 1   - rbx  - General register
/// 2   - rcx  - General register
/// 3   - rdx  - General register
/// 4   - rex  - Real sensitive register
#define REGISTERS_COUNT 5
/// Size of RAM in softCPU
#define RAM_SIZE 4096


/// Singelton SoftCPU-object
struct SoftCPU {
  cmd_t  *code;                           /// <- Array with executable code
  size_t  codeCapacity;                   /// <- Size of code array
  Stack   stack;                          /// <- SoftCPU stack
  data_t  registers[REGISTERS_COUNT];     /// <- SoftCPU registers
  data_t *RAM;                            /// <- SoftCPU RAM
  size_t  pc;                             /// <- Program counter
  int     videoMode;                      /// <- VideoMode for programm
};

/// Errors witch may be return from execute()
enum SoftCPUError {
  SOFTCPU_EMPTY_STACK         = 0x01 <<  0, /// <- Size of stack less than need for cmd
  SOFTCPU_DIV_BY_ZERO         = 0x01 <<  1, /// <- Divided by zero
  SOFTCPU_NO_INPUT            = 0x01 <<  2, /// <- No input in programm
  SOFTCPU_INCORRECT_ARGUMENTS = 0x01 <<  3, /// <- Invalid type of argument
  SOFTCPU_INCORRECT_JUMP      = 0x01 <<  4, /// <- Invalid jump argument (<0 || >=codeCapacity)
  SOFTCPU_UNKNOWN_CMD         = 0x01 <<  5, /// <- Invalid cmd code
  SOFTCPU_NEGATIVE_VALUE      = 0x01 <<  6, /// <- Negative value for math
  SOFTCPU_OUT_OF_MEMORY       = 0x01 <<  7, /// <- Heap is crowed
  SOFTCPU_FILE_IS_BROKEN      = 0x01 <<  8, /// <- Executable file is broken
  SOFTCPU_INCORRECT_REGISTER  = 0x01 <<  9, /// <- Number of register is incorrect
  SOFTCPU_VIDEO_ERROR         = 0x01 << 10, /// <- Error with VideoScreen
};

/// Init cpu  to use
/// @param [in/out] cpu SoftCPU object for initilization
/// @return Error`s code
int initSoftCPU(SoftCPU *cpu);

/// Destroy cpu after using
/// @param [in] cpu SoftCPU object for destroy
void destroySoftCPU(SoftCPU *cpu);

/// Allocate code array
/// @param [in/out] cpu SoftCPU object
/// @return Error`s code
/// @note Get capacity for code array from cpu.codeCapacity
int allocateSoftCPUCode(SoftCPU *cpu);

/// Execute cmds
/// @param [in] cpu SoftCPU object with executable code cell
/// @return Error`s code
int execute(SoftCPU *cpu);

#endif
