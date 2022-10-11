#ifndef SETTINGS_H_
#define SETTINGS_H_

/// Name of target file if didn`t input anything
#if   defined ASSEMBLER
const char * const DEFAULT_TARGET_FILE_NAME = "a.bin";
#elif defined DISASSEMBLER
const char * const DEFAULT_TARGET_FILE_NAME = "code.asm";
#endif

/// Getter for SOURCE_FILE_NAME
/// @return Current value of SOURCE_FILE_NAME
char *getSourceFileName();

/// Setter for SOURCE_FILE_NAME
/// @param [in] fileName New value for field
void setSourceFileName(char *fileName);

#if defined ASSEMBLER or defined DISASSEMBLER

/// Getter for TARGET_FILE_NAME
/// @return Current value of TARGET_FILE_NAME
char *getTargetFileName();

/// Setter for TARGET_FILE_NAME
/// @param [in] fileName New value for field
void setTargetFileName(char *fileName);

#endif

#if defined ASSEMBLER

/// Getter for LISTING_FILE_NAME
/// @return Current value of LISTING_FILE_NAME
char *getListingFileName();

/// Setter for LISTING_FILE_NAME
/// @param [in] fileName New value for field
void setListingFileName(char *fileName);

#endif

/// Getter for PROGRAMM_NAME
/// @return Current value of PROGRAMM_NAME
const char *getProgrammName();

/// Setter for PROGRAMM_NAME
/// @param [in] fileName New value for field
void setProgrammName(const char *name);

#endif
