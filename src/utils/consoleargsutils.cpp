#include <string.h>
#include "consoleargsutils.h"
#include "garbagecollector.h"
#include "systemlike.h"
#include "errorhandler.h"
#include "settings.h"
#include "asserts.h"

const int IN   = 0;
const int OUT  = 1;
const int TEMP = 2;

const char *FLAGS[] = {
  "-in"  ,
  "-out" ,
  "-temp",
};

/// Handle flag -in
/// @param [in] argument Argument for -in
/// @return Zero is all was Ok or NO_SUCH_FILE_FOUND if argument isn`t a file name
static int handleIn (const char *argument);

#if defined ASSEMBLER or defined DISASSEMBLER
/// Handle flag -out
/// @param [in] argument Argument for -out
static void handleOut(const char *argument);
#endif

#if defined ASSEMBLER
/// Handle flag -temp
/// @param [in] argument Argument for -temp
static void handleTemp(const char *argument);
#endif

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
  setSourceFileName (nullptr);
#if defined ASSEMBLER or defined DISASSEMBLER
  setTargetFileName (nullptr);
#endif
#if defined ASSEMBLER
  setListingFileName(nullptr);
#endif

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
#if defined ASSEMBLER or defined DISASSEMBLER
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
#endif
#if defined ASSEMBLER
      else if (!strcmp(argv[i], FLAGS[TEMP]))
        {
          if (++i < argc && argv[i][0] != '-')
            handleTemp(argv[i]);
          else
            {
              handleIncorrectArgument(argv[i - 1], i < argc ? argv[i] : "nothing");

              return INCORRECT_ARGUMENTS;
            }
        }
#endif
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

#if defined ASSEMBLER or defined DISASSEMBLER
  if (!getTargetFileName())
    {
      setTargetFileName(strdup(DEFAULT_TARGET_FILE_NAME));

      addElementForFree(getTargetFileName());
    }
#endif

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

#if defined ASSEMBLER or defined DISASSEMBLER
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
#endif

#if defined ASSEMBLER
static void handleTemp(const char *argument)
{
  if (!getListingFileName())
    {
      setListingFileName(strdup(argument));

      addElementForFree(getListingFileName());
    }
  else
    {
      handleWarning("Too many listing files [%s]", argument);
    }
}
#endif

static void handleIncorrectArgument(const char *flag, const char *argument)
{
  handleError("%s expeced argument, but geted %s", flag, argument);
}

static void handleUnknownFlag(const char *flag)
{
  handleWarning("Unknow flag [%s]", flag);
}
