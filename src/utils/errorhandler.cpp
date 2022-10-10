#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "errorhandler.h"
#include "coloroutput.h"
#include "settings.h"

/// Handle message
/// @brief Show message with prefix in console with color from name of the programm
///        After message reset color
///        Template: [set test color to color]progran-name: prefix: message\\n[set color to default]
///
/// @param [in] message Format C-like string with message
/// @param [in] args VA_ARGS for format string
/// @param [in] color Color of message
/// @param [in] prefix Prefix will print before message
/// @note If message is nullptr set it to "MESSAGE CORRUPTED!!"
static void handleMessage(const char *message, va_list args, int color, const char *prefix);

void handleError(const char *message, ...)
{
  va_list args = {};

  va_start(args, message);

  handleMessage(message, args, CONSOLECOLOR_RED, "Error");

  va_end(args);
}

void handleWarning(const char *message, ...)
{
  va_list args = {};

  va_start(args, message);

  handleMessage(message, args, CONSOLECOLOR_YELLOW, "Warning");

  va_end(args);
}

static void handleMessage(const char *message, va_list args, int color, const char *prefix)
{
  if (!message)
    message = "MESSAGE CORRUPTED!!";

  setForegroundColor(color);

  printf("%s: ", getProgrammName());

  printf("%s: ", prefix);

  vprintf(message, args);

  putchar('\n');

  resetConsole();
}
