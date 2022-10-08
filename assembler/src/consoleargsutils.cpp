#include <string.h>
#include "consoleargsutils.h"
#include "garbagecollector.h"
#include "systemlike.h"
#include "errorhandler.h"
#include "settings.h"
#include "asserts.h"

const int IN  = 0;
const int OUT = 1;
const int BIN = 2;
const int TXT = 3;

const char *FLAGS[] = {
  "-in" ,
  "-out",
  "-bin",
  "-txt",
};

/// Handle flag -in
/// @param [in] argument Argument for -in
/// @return Zero is all was Ok or NO_SUCH_FILE_FOUND if argument isn`t a file name
static int handleIn (const char *argument);

/// Handle flag -out
/// @param [in] argument Argument for -out
static void handleOut(const char *argument);

/// Handle flag -bin
static void handleBin();

/// Handle flag -txt
static void handleTxt();

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
  setTargetFileName(nullptr);
  setTargetFileMode(NOT_INIT_TARGET_FILE);

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
      else if (!strcmp(argv[i], FLAGS[OUT]))
        {
          if (++i < argc && argv[i][0] != '-')
            handleOut(argv[i]);
          else
            {
              handleIncorrectArgument(argv[i - 1], i < argc ? argv[i] : "nothing");

              return INCORRECT_ARGUMENTS;
            }
        }
      else if (!strcmp(argv[i], FLAGS[BIN]))
        {
          handleBin();
        }
      else if (!strcmp(argv[i], FLAGS[TXT]))
        {
          handleTxt();
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

  if (!getTargetFileName())
    setTargetFileName(strdup(DEFAULT_TARGET_FILE_NAME));


  if (getTargetFileMode() == NOT_INIT_TARGET_FILE)
    setTargetFileMode(BIN_TARGET_FILE);

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

static void handleOut(const char *argument)
{
  if (!getTargetFileName())
    {
      setTargetFileName(strdup(argument));

      addElementForFree(getTargetFileName());
    }
  else
    {
      handleWarning("Too many output files [%s]", argument);
    }
}

static void handleBin()
{
  if (getTargetFileMode() != NOT_INIT_TARGET_FILE)
    handleWarning("Too many flags for output file format");
  else
    setTargetFileMode(BIN_TARGET_FILE);
}

static void handleTxt()
{
  if (getTargetFileMode() != NOT_INIT_TARGET_FILE)
    handleWarning("Too many flags for output file format");
  else
    setTargetFileMode(TXT_TARGET_FILE);
}

static void handleIncorrectArgument(const char *flag, const char *argument)
{
  handleError("%s expeced argument, but geted %s", flag, argument);
}

static void handleUnknownFlag(const char *flag)
{
  handleWarning("Unknow flag [%s]", flag);
}
