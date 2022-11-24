#ifndef FILESUTILS_H_
#define FILESUTILS_H_

#include <stdio.h>

const int ERROR = 1;

/// Read all chars from source file
/// @param [out] strings Strings where need save read chars
/// @return Error`s code
int getFileStrings(Strings *strings);

/// Parse chars from source file to lines
/// @param [in/out] strings Strings with origin file chars and where need save parse lines
/// @return Error`s code
int parseFileStrings(Strings *strings);

/// Open target file and set to targetFile
/// @param [out] targetFile Pointer to file, which need to set
/// @return Error`s code
int openTargetFile(FILE **targetFile);

/// Open listing file and set to listingFile
/// @param [out] listingFile Pointer to file, which need to set
/// @return Error`s code
int openListingFile(FILE **listingFile);

#endif
