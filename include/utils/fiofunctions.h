#ifndef FIOFUNCTIONS_H_
#define FIOFUNCTIONS_H_

#include <stddef.h>
#include <stdio.h>

/// Error`s codes from readFile()
enum FiofunctionsError {
  FIOFUNCTIONS_OUT_OF_MEM          = -1,
  FIOFUNCTIONS_FAIL_TO_OPEN        = -2,
  FIOFUNCTIONS_INCORRECT_ARGUMENTS = -3,
};

/// Read every file line in buffer
/// @param [out] buffer Address of pointer to buffer
/// @param [in] filename Name of file which need to read
/// @return Size of buffer in heap or error`s code
size_t readFile(char **buffer, const char *filename);

void writeBinFile(const void *buffer, size_t bufferSize, FILE *outputFile);

void writeTxtFile(const char *buffer, FILE *outputFile);

void writeExecutableFile(const char *, int fileMode, FILE *outputFile);

#endif
