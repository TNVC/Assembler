#include <string.h>
#include "consoleargsutils.h"
#include "settings.h"
#include "systemlike.h"
#include "errorhandler.h"

#define CHECK_FILE(FILE_NAME)  		                                       \
  do                                                                           \
    {                                                                          \
      if (!isFileExists(FILE_NAME))                                            \
        handleError("No such file [%s]", FILE_NAME); 			       \
    } while (0)

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
static void handleIn (const char *argument);

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

void parseConsoleArgs(const int argc, const char *argv[])
{
  if (argc <= 0 || !isPointerCorrect(argv))
    handleError("Inccorect arguments");

  PROGRAMM_NAME = argv[0];
  SOURCE_FILE_NAME = nullptr;
  TARGET_FILE_NAME = nullptr;
  OUTPUT_FILE_TYPE = NOT_INIT_OUTPUT_FILE;

  if (argc < 2)
      handleError("No input files");

  for (int i = 1; i < argc; ++i)
    {
      if      (!strcmp(argv[i], FLAGS[IN]))
        {
          if (++i < argc && argv[i][0] != '-')
            handleIn(argv[i]);
          else
            handleIncorrectArgument(argv[i - 1], i < argc ? argv[i] : "nothing");
        }
      else if (!strcmp(argv[i], FLAGS[OUT]))
        {
          if (++i < argc && argv[i][0] != '-')
            handleOut(argv[i]);
          else
            handleIncorrectArgument(argv[i - 1], i < argc ? argv[i] : "nothing");
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
          handleIn(argv[i]);
        }
    }

  if (!SOURCE_FILE_NAME)
      handleError("No input files");
      
  if (!TARGET_FILE_NAME)
      TARGET_FILE_NAME = strdup(DEFAULT_TARGET_FILE_NAME);
      
  if (OUTPUT_FILE_TYPE == NOT_INIT_OUTPUT_FILE)
    OUTPUT_FILE_TYPE = BIN_OUTPUT_FILE;
}

static void handleIn (const char *argument)
{
  if (!SOURCE_FILE_NAME)
    {
      CHECK_FILE(argument);
      
      SOURCE_FILE_NAME = strdup(argument);
    }
  else
    {
      handleWarning("Too many intput files [%s]", argument);
    }
}

static void handleOut(const char *argument)
{
  if (!TARGET_FILE_NAME)
    {
      TARGET_FILE_NAME = strdup(argument);
    }
  else
    {
      handleWarning("Too many output files [%s]", argument);
    }
}

static void handleBin()
{
  if (OUTPUT_FILE_TYPE != NOT_INIT_OUTPUT_FILE)
    handleWarning("Too many flags for output file format");
  else
    OUTPUT_FILE_TYPE = BIN_OUTPUT_FILE;
}

static void handleTxt()
{
  if (OUTPUT_FILE_TYPE != NOT_INIT_OUTPUT_FILE)
    handleWarning("Too many flags for output file format");
  else
    OUTPUT_FILE_TYPE = TXT_OUTPUT_FILE;
}

static void handleIncorrectArgument(const char *flag, const char *argument)
{
  handleError("%s expeced argument, but geted %s", flag, argument);
}

static void handleUnknownFlag(const char *flag)
{
  handleWarning("Unknow flag [%s]", flag);      
}
