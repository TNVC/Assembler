#include "consoleargsutils.h"
#include "asserts.h"
#include "settings.h"
#include "errorhandler.h"
#include <string.h>
#include "systemlike.h"
#include "garbagecollector.h"

#define HANDLE_IF(name, handler)                \
  if (!strcmp(argv[i], FLAGS[name]))            \
    do                                          \
      {                                         \
        if (++i < argc && argv[i][0] != '-')    \
          {                                     \
            int error = handler(argv[i]);       \
                                                \
            if (error)                          \
              return error;                     \
          }                                     \
        else                                    \
          INCORRECT_ARGUMENT;                   \
      } while (0)

#define ELSE_HANDLE_IF(name, handler) else HANDLE_IF(name, handler)

#define INCORRECT_ARGUMENT                                              \
  do                                                                    \
    {                                                                   \
      handleIncorrectArgument(                                          \
                              argv[i - 1],                              \
                              i < argc ? argv[i] : "nothing"            \
                             );                                         \
                                                                        \
      return CONSOLE_INCORRECT_ARGUMENTS;                               \
    } while (0)

#define NO_INPUT_FILES                          \
  do                                            \
    {                                           \
      handleError("No input files");            \
                                                \
      return CONSOLE_NO_INPUT_FILES;            \
    } while (0)

#define HANDLE_FILE_NAME(name, type)                               \
  do                                                               \
    {                                                              \
      if (!get ## type ## FileName())                              \
        {                                                          \
          set ## type ## FileName(strdup(name));                   \
                                                                   \
          addElementForFree(get ## type ## FileName());            \
        }                                                          \
      else                                                         \
        {                                                          \
          handleWarning("Too many "#type" files [%s]", name);      \
        }                                                          \
    } while (0)

/// Consts-indexes in FLAGS array
const int IN   = 0;
const int OUT  = 1;
const int TEMP = 2;

/// Type of indefity console flags
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
/// @return Error`s code
static int handleOut(const char *argument);
#endif

#if defined ASSEMBLER
/// Handle flag -temp
/// @param [in] argument Argument for -temp
/// @return Error`s code
static int handleTemp(const char *argument);
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
    NO_INPUT_FILES;

  for (int i = 1; i < argc; ++i)
    {
      HANDLE_IF(IN, handleIn);
#if defined ASSEMBLER or defined DISASSEMBLER
      ELSE_HANDLE_IF(OUT, handleOut);
#endif
#if defined ASSEMBLER
      ELSE_HANDLE_IF(TEMP, handleTemp);
#endif
      else if (argv[i][0] == '-')
          handleUnknownFlag(argv[i]);
      else
        {
          if (handleIn(argv[i]))
            return CONSOLE_NO_SUCH_FILE_FOUND;
        }
    }

  if (!getSourceFileName())
    NO_INPUT_FILES;

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
  HANDLE_FILE_NAME(argument, Source);

  if (!isFileExists(argument))
    {
      handleError("No such file [%s]", argument);

      return CONSOLE_NO_SUCH_FILE_FOUND;
    }

  return 0;
}

#if defined ASSEMBLER or defined DISASSEMBLER
static int handleOut(const char *argument)
{
  HANDLE_FILE_NAME(argument, Target);

  return 0;
}
#endif

#if defined ASSEMBLER
static int handleTemp(const char *argument)
{
  HANDLE_FILE_NAME(argument, Listing);

  return 0;
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
