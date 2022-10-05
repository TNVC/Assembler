#ifndef SETTINGS_H_
#define SETTINGS_H_

/// Link defination of name of source file
extern char *SOURCE_FILE_NAME;

/// Link defination of name of target file
extern char *TARGET_FILE_NAME;

/// Name of target file if didn`t input anything
const char * const DEFAULT_TARGET_FILE_NAME = "a.bin";

enum OutputFileType {
  NOT_INIT_OUTPUT_FILE = -1, /// <- Initilizate value
  BIN_OUTPUT_FILE      =  0, /// <- For binary output file
  TXT_OUTPUT_FILE      =  1, /// <- For text output file
};

/// Link defination for output file type
/// Using OutputFileType
extern int OUTPUT_FILE_TYPE;

/// Link defination of current name of this programm 
extern const char *PROGRAMM_NAME;

#endif
