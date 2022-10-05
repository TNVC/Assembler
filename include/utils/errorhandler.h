#ifndef ERRORHANDLER_H_
#define ERRORHANDLER_H_

#include <stdarg.h>

#define ERROR                                       \
      handleError("Error in file %s at line %d", __FILE__, __LINE__)

/// Handle error and finish the programm
/// @param [in] message Error message - C-like foramt string ofr printf
/// @param [in] ... VA_ARGS for format string
/// @note Add before message name of the programm and "Error" 
[[noreturn]] void handleError  (const char *message, ...);

/// Handle warning
/// @param [in] message Warning message - C-like foramt string ofr printf
/// @param [in] ... VA_ARGS for format string
/// @note Add before message name of the programm and "Warring"
             void handleWarning(const char *message, ...);

#endif
