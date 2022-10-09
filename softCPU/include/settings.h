#ifndef SETTINGS_H_
#define SETTINGS_H_

/// Getter for SOURCE_FILE_NAME
/// @return Current value of SOURCE_FILE_NAME
char *getSourceFileName();

/// Setter for SOURCE_FILE_NAME
/// @param [in] fileName New value for field
void setSourceFileName(char *fileName);

/// Getter for PROGRAMM_NAME
/// @return Current value of PROGRAMM_NAME
const char *getProgrammName();

/// Setter for PROGRAMM_NAME
/// @param [in] fileName New value for field
void setProgrammName(const char *name);

#endif
