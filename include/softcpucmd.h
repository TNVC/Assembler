#ifndef SOFTCPUCMD_H_
#define SOFTCPUCMD_H_

#define MAX_WORD_LENGTH 4
#define MAX_REG_LENGTH  3

#define REGISTERS_COUNT 4

const char SOFTCPU_CMD_VERSION = 1;

const char SECURITY_CODE[] = "DB";

struct Title {
  char securityCode[3];
  char version;
  int cmdCount;
};

struct Command {
  unsigned char code  : 5;
  unsigned char mem   : 1;
  unsigned char reg   : 1;
  unsigned char immed : 1;
};

enum SoftCpuCmd {

#define DEF_CMD(name, num, hasArg, ...)         \
  SOFTCPU_##name = num,

#include "cmd.h"

#undef DEF_CMD

};


#endif
