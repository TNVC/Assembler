#include <stdio.h>
#include <stdlib.h>
#include "settings.h"
#include "coloroutput.h"
#include "errorhandler.h"
#include "systemlike.h"
#include <stdarg.h>

[[noreturn]] void handleError(const char *message, ...)
{
  va_list args = {};

  va_start(args, message);

  if (!isPointerReadCorrect(message))
    message = "MESSAGE CORRUPTED!!";

  setForegroundColor(CONSOLECOLOR_RED);

  printf("%s: Error: ", PROGRAMM_NAME);

  vprintf(message, args);

  putchar('\n');

  resetConsole();

  va_end(args);

  exit(0);
}

void handleWarning(const char *message, ...)
{
  va_list args = {};

  va_start(args, message);

  if (!isPointerReadCorrect(message))
    message = "MESSAGE CORRUPTED!!";

  setForegroundColor(CONSOLECOLOR_YELLOW);

  printf("%s: Warning: ", PROGRAMM_NAME);

  vprintf(message, args);

  putchar('\n');

  resetConsole();

  va_end(args);
}
