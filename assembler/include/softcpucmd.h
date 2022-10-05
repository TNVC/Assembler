#ifndef SOFTCPUCMD_H_
#define SOFTCPUCMD_H_

#define MAX_WORD_LENGTH 4

const char SOFTCPU_CMD_VERSION = 1;

enum SoftCpuCmd {
  SOFTCPU_HLT ,
  SOFTCPU_PUSH,
  SOFTCPU_ADD ,
  SOFTCPU_SUB ,
  SOFTCPU_MUL ,
  SOFTCPU_DIV ,
  SOFTCPU_OUT ,
  SOFTCPU_DUMP,
  SOFTCPU_IN  ,
  SOFTCPU_COPY,
  SOFTCPU_SWAP,
};

const char *SOFTCPU_CMD[] = {
  "HLT" ,
  "PUSH",
  "ADD" ,
  "SUB" ,
  "MUL" ,
  "DIV" ,
  "OUT" ,
  "DUMP",
  "IN"  ,
  "COPY",
  "SWAP",
};

const int SOFTCPU_WORD_LENGTH[] = {
  3,
  4,
  3,
  3,
  3,
  3,
  3,
  4,
  2,
  4,
  4,
};

#endif
