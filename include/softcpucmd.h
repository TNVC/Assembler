#ifndef SOFTCPUCMD_H_
#define SOFTCPUCMD_H_

/// Max length in chars of command word
#define MAX_WORD_LENGTH 8
/// Max length in chars of register name
#define MAX_REG_LENGTH  3
/// Count of registers in softCPU
#define REGISTERS_COUNT 4

/// Command struct
struct Command {
  unsigned char code  : 5; /// <- Code of cmd
  unsigned char mem   : 1; /// <- Argument status: take value from RAM
  unsigned char reg   : 1; /// <- Argument status: take value from register
  unsigned char immed : 1; /// <- Argument statsu: take value immediately from argument
};

/// Enumeration of cmd codes
/// @note Autogenerate from cmd.h
enum SoftCpuCmd {

#define DEF_CMD(name, num, hasArg, ...)         \
  SOFTCPU_##name = num,

#include "cmd.h"

#undef DEF_CMD

};

#endif
