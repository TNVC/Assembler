#ifndef CONSOLEARGSUTILS_H_
#define CONSOLEARGSUTILS_H_

/// Errors whitch maight be return from parseConsoleArgs
enum ConsolArgsUtilsError {
  CONSOLE_NO_SUCH_FILE_FOUND  = 0x01 << 0, /// <- File not exists
  CONSOLE_NO_INPUT_FILES      = 0x01 << 1, /// <- Not input files
  CONSOLE_INCORRECT_ARGUMENTS = 0x01 << 2, /// <- Arguments for flags isn`t correct
};

/// Parse console argument for settings
/// @param [in] argc Count of console arguments
/// @param [in] argv Console arguments value
/// @return Error`s code
int parseConsoleArgs(const int argc, const char * const argv[]);

#endif
