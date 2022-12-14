#ifndef GARBAGECOLLECTOR_H_
#define GARBAGECOLLECTOR_H_

/// Max length of 'SequenceForFree'-array
#define MAX_LENGTH 10

/// Error`s code for addElementForFree()
const int SEQUENCE_IS_FULL = 1;

/// Add element to SequenceForFree
/// @param [in] pointer Pointer which need to free before programm finish
/// @return Error`s code
int addElementForFree(void *pointer);

#endif
