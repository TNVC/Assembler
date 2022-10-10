#ifndef CONSOLEARGSUTILS_H_
#define CONSOLEARGSUTILS_H_

enum ConsolArgsUtilsError {
  NO_SUCH_FILE_FOUND        = 0x01 << 0,
  NO_INPUT_FILES            = 0x01 << 1,
  INCORRECT_ARGUMENTS       = 0x01 << 2,
};

/// Parse console argument for settings
/// @param [in] argc Count of console arguments
/// @param [in] argv Console arguments value
/// @return Error`s code
int parseConsoleArgs(const int argc, const char * const argv[]);

#endif
