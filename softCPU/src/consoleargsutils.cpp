#include <string.h>
#include "consoleargsutils.h"
#include "settings.h"
#include "systemlike.h"
#include "garbagecollector.h"
#include "errorhandler.h"
#include "asserts.h"

const int IN  = 0;

const char *FLAGS[] = {
  "-in" ,
};

/// Handle flag -in
/// @param [in] argument Argument for -in
/// @return Zero is all was Ok or NO_SUCH_FILE_FOUND if argument isn`t a file name
static int handleIn (const char *argument);

/// Handle incorrect arguments for flags
/// @param [in] flag Name of flag wicth geted incorrect argument
/// @param [in] argument Geted argument
static void handleIncorrectArgument(const char *flag, const char *argument);

/// Handle unknown flags
/// @param [in] flag Name of unknown flag
static void handleUnknownFlag      (const char *flag);

int parseConsoleArgs(const int argc, const char * const argv[])
{
  assert(argv);
  assert(argc > 0);

  setProgrammName(argv[0]);
  setSourceFileName(nullptr);

  if (argc < 2)
    {
      handleError("No input files");

      return NO_INPUT_FILES;
    }

  for (int i = 1; i < argc; ++i)
    {
      if      (!strcmp(argv[i], FLAGS[IN]))
        {
          if (++i < argc && argv[i][0] != '-')
            {
              if (handleIn(argv[i]) == NO_SUCH_FILE_FOUND)
                return NO_SUCH_FILE_FOUND;
            }
          else
            {
              handleIncorrectArgument(argv[i - 1], i < argc ? argv[i] : "nothing");

              return INCORRECT_ARGUMENTS;
            }
        }
      else if (argv[i][0] == '-')
        {
          handleUnknownFlag(argv[i]);
        }
      else
        {
          if (handleIn(argv[i]) == NO_SUCH_FILE_FOUND)
            return NO_SUCH_FILE_FOUND;
              }
    }

  if (!getSourceFileName())
    {
      handleError("No input files");

      return NO_INPUT_FILES;
    }

  return 0;
}

static int handleIn (const char *argument)
{
  if (!getSourceFileName())
    {
      if (!isFileExists(argument))
        {
          handleError("No such file [%s]", argument);

          return NO_SUCH_FILE_FOUND;
        }

      setSourceFileName(strdup(argument));

      addElementForFree(getSourceFileName());
    }
  else
    {
      handleWarning("Too many intput files [%s]", argument);
    }

  return 0;
}

static void handleIncorrectArgument(const char *flag, const char *argument)
{
  handleError("%s expeced argument, but geted %s", flag, argument);
}

static void handleUnknownFlag(const char *flag)
{
  handleWarning("Unknow flag [%s]", flag);
}
