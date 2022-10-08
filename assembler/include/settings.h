#ifndef SETTINGS_H_
#define SETTINGS_H_

/// Name of target file if didn`t input anything
const char * const DEFAULT_TARGET_FILE_NAME = "a.bin";

enum OutputFileType {
  NOT_INIT_TARGET_FILE = -1, /// <- Initilizate value
  BIN_TARGET_FILE      =  0, /// <- For binary output file
  TXT_TARGET_FILE      =  1, /// <- For text output file
};

/// Getter for SOURCE_FILE_NAME
/// @return Current value of SOURCE_FILE_NAME
char *getSourceFileName();

/// Setter for SOURCE_FILE_NAME
/// @param [in] fileName New value for field
void setSourceFileName(char *fileName);

/// Getter for TARGET_FILE_NAME
/// @return Current value of TARGET_FILE_NAME
char *getTargetFileName();

/// Setter for TARGET_FILE_NAME
/// @param [in] fileName New value for field
void setTargetFileName(char *fileName);

/// Getter for TARGET_FILE_MODE
/// @return Current value of TARGET_FILE_MODE
int getTargetFileMode();

/// Setter for TARGET_FILE_MODE
/// @param [in] fileName New value for field
void setTargetFileMode(int mode);

/// Getter for PROGRAMM_NAME
/// @return Current value of PROGRAMM_NAME
const char *getProgrammName();

/// Setter for PROGRAMM_NAME
/// @param [in] fileName New value for field
void setProgrammName(const char *name);

#endif
