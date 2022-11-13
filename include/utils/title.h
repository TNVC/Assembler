#ifndef TITLE_H_
#define TITLE_H_

#include <stdio.h>

const char SOFTCPU_CMD_VERSION = 2;

const char SECURITY_CODE[] = "DB";

struct Title {
  char securityCode[3];
  char version;
  char videoMode;
  int cmdCount;
};

enum TitleError {
  INCORRECT_TITLE   = 0x01 << 0,
  NO_TITLE          = 0x01 << 1,
  DIFFERENT_VERSION = 0x01 << 2,
};

/// Generete execute file title
/// @param [in] capacity Size of executable code
/// @param [in] videoMode VideoMode for programm
/// @return Title object
Title generateTitle(int capacity, int videoMode);

/// Check the title in file
/// @param [in] filePtr Executable file with title
/// @param [out] videoMode VideoMode for programm
/// @return Size of code from title or error`s code
int checkTitle(FILE *filePtr, int *videoMode);

#endif
