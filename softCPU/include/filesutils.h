#ifndef FILESUTILS_H_
#define FILESUTILS_H_

#include "softcpu.h"

const int ERROR = 1;

/// Load from source file code array to cpu
/// @param [in/out] cpu SoftCPU object
/// @return Error`s code
int getFileCode(SoftCPU *cpu);

#endif
