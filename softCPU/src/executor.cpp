#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "softcpu.h"
#include "fiofunctions.h"
#include "systemlike.h"
#include "video.h"
#include "stack.h"
#include "logging.h"
#include "errorhandler.h"
#include "asserts.h"

#define FILE_IS_BROKEN                            \
  do                                              \
    {                                             \
      handleError("Executable file is broken!!"); \
                                                  \
      return SOFTCPU_FILE_IS_BROKEN;              \
    } while (0)

#define INCORRECT_REGISTER                        \
  do                                              \
    {                                             \
      handleError("Incorrect register number!!"); \
                                                  \
      return SOFTCPU_INCORRECT_REGISTER;          \
    } while (0)

#define INCORRECT_ADDRESS                                     \
  do                                                          \
    {                                                         \
      handleError("Incorrect RAM address [%d]!!", memIndex);  \
                                                              \
      return nullptr;                                         \
    } while (0)

#define FAIL_VIDEO                              \
  do                                            \
    {                                           \
      handleError("Fail to init videoMode!!");  \
                                                \
      return SOFTCPU_VIDEO_ERROR;               \
    } while (0)

/// Sleep delay
/// @param [in] delay Delay for sleep
static void sleep(clock_t delay);

/// Parse argument of current cmd
/// @param [in] cpu SoftCPU object with memory and pc
/// @return Pointer to needed memory cell or nullptr if Arg isn`t correct
static data_t *parseArg(SoftCPU *cpu);

/// Get arguments from code array
/// @param [in] cpu SoftCPU object
/// @param [in] cmd Cmd with arguments flags
/// @param [out] num Place where need write immediately constant if it has
/// @param [out] regNum Place where need write register number if it has
/// @return Error`s
/// @note If num or regNum is nullptr don`t try write
static int getArgs(SoftCPU *cpu, Command cmd, data_t *num, cmd_t *regNum);

/// Dump CPU
/// @param [in] cpu SoftCPU object for dump
/// @param [in] file File for dump
static void dumpCPU(SoftCPU *cpu, FILE *file);

/// Dump code array
/// @param [in] cpu SoftCPU object
/// @param [in] file File for dump
static void dumpCode(SoftCPU *cpu, FILE *file);

/// Dump RAM
/// @param [in] cpu SoftCPU object
/// @param [in] file File for dump
static void dumpRAM(SoftCPU *cpu, FILE *file);

/// Dump register
/// @param [in] cpu SoftCPU object
/// @param [in] file File for dump
static void dumpRegisters(SoftCPU *cpu, FILE *file);

/// Return address of RAM cell with index in cpu
/// @param [in] cpu SoftCPU object with RAM
/// @param [in] index Index of needed cell in RAM
/// @return Pointer to RAM cell with index or nullptr if inedex isn`t correct
static data_t *getRAMCell(SoftCPU *cpu, int index);

/// Display RAM content
/// @param [in] cpu SoftCPU-object with RAM cell
/// @note Size of line in RAM gets from MEMORY_LINE_SIZE in executer.h
static void showMemory(SoftCPU *cpu);

int execute(SoftCPU *cpu)
{
  assert(cpu);

  if (initVideoScreen(static_cast<VideoMode>(cpu->videoMode)))
    FAIL_VIDEO;

  for (cpu->pc = 0; cpu->pc < cpu->codeCapacity; ++cpu->pc)
    {
      Command cmd = *((Command *)cpu->code + cpu->pc);

      switch (cmd.code)
        {

#if defined DEBUG_BUILD_
#define DEF_CMD(name, num, hasArg, isProducentArg, ...) \
          case num:                                     \
            dumpCPU(cpu, getLogFile());                 \
            __VA_ARGS__                                 \
              break;
#else
#define DEF_CMD(name, num, hasArg, isProducentArg, ...) \
          case num:                                     \
            __VA_ARGS__                                 \
              break;
#endif

#include "cmd.h"

#undef DEF_CMD

        default:
          {
            handleError("Unknown cmd [%d]!!", cmd.code);

            return SOFTCPU_UNKNOWN_CMD;
          }
        }
    }

#if defined DEBUG_BUILD_
  dumpCPU(cpu, getLogFile());
#endif

  destroyVideoScreen();

  return 0;
}

static void dumpCPU(SoftCPU *cpu, FILE *file)
{
  assert(cpu);
  assert(file);

  dumpCode(cpu, file);

  dumpRAM(cpu, file);

  dumpRegisters(cpu, file);

  stack_dump(&cpu->stack, stack_valid(&cpu->stack), file);

  getchar();
}

static data_t *parseArg(SoftCPU *cpu)//evalute not parse
{
  assert(cpu);

  Command cmd = *((Command *)cpu->code + cpu->pc++);

  if (cmd.mem && !(cmd.reg || cmd.immed))
    return nullptr;

  data_t num    =  0;
  cmd_t  regNum = -1;

  if (getArgs(cpu, cmd, &num, &regNum))
    return nullptr;

  --cpu->pc;

  if (cmd.mem)
    {
      int memIndex = 0;

      if (cmd.reg)
        memIndex += cpu->registers[(int)regNum];

      if (cmd.immed)
        memIndex += num;

      if (memIndex >= RAM_SIZE)
        INCORRECT_ADDRESS;

      return getRAMCell(cpu, memIndex);
    }

  if (cmd.immed)
    {
      static data_t buffer = 0;

      buffer = num;

      if (cmd.reg)
        buffer += cpu->registers[(int)regNum];

      return &buffer;
    }

  if (cmd.reg)
    return &cpu->registers[(int)regNum];

  handleError("Unkwonwn error!!");

  return nullptr;
}

static int getArgs(SoftCPU *cpu, Command cmd, data_t *num, cmd_t *regNum)
{
  assert(cpu);

  if (cmd.immed)
    {
      if (cpu->pc + sizeof(data_t) >= cpu->codeCapacity)
        FILE_IS_BROKEN;

      *num = *(data_t *)(cpu->code + cpu->pc);

      cpu->pc += sizeof(data_t);
    }

  if (cmd.reg)
    {
      if (cpu->pc + sizeof(cmd_t) >= cpu->codeCapacity)
        FILE_IS_BROKEN;

      *regNum = cpu->code[cpu->pc++];

      if (*regNum < 0 || *regNum >= REGISTERS_COUNT)
        INCORRECT_REGISTER;
    }

  return 0;
}

static data_t *getRAMCell(SoftCPU *cpu, int index)
{
  assert(cpu);

  if (index < 0 || index >= RAM_SIZE)
    return nullptr;

  sleep(CLOCKS_PER_SEC / (RAM_SIZE * 30));

  return &cpu->RAM[index];
}

static void showMemory(SoftCPU *cpu)
{
  struct RGBA  {
    int alpha : 8;
    int blue  : 8;
    int green : 8;
    int red   : 8;
  };

  assert(cpu);

  for (int x = 0; x < RAM_SIZE; ++x)
    {
      RGBA cell = *(RGBA *)getRAMCell(cpu, x);

      Color color = getColor(
                             (unsigned char)cell.red,
                             (unsigned char)cell.green,
                             (unsigned char)cell.blue,
                             (unsigned char)cell.alpha
                             );

      if (cpu->videoMode == (int)VideoMode::Console && cell.alpha == '\0')
        break;
      else if (cell.alpha == -1)
        clearScreen();
      else
        setPixelColor(
                      getCoord(unsigned(x % SCREEN_WIDTH), unsigned(x / SCREEN_WIDTH)),
                      color
                      );
    }

  showScreen();

  sleep(CLOCKS_PER_SEC / 24);
}

static void sleep(clock_t delay)
{
  clock_t start = clock();

  while (clock() - start <= delay)
    continue;
}

static void dumpCode(SoftCPU *cpu, FILE *file)
{
  assert(cpu);
  assert(file);

  fprintf(file, "%*s ", 8, "");

  for (unsigned i = 0; i < 16; ++i)
    fprintf(file, " %2.2X ", i);

  for (unsigned i = 0; i < cpu->codeCapacity; ++i)
    {
      if (i % 16 == 0)
        fprintf(file, "\n%8.8X:", i);

      if (i == cpu->pc)
        fprintf(file, "[%2.2X]", (unsigned char)cpu->code[i]);
      else
        fprintf(file, " %2.2X ", (unsigned char)cpu->code[i]);
    }

  putc('\n', file);
  putc('\n', file);

}

static void dumpRAM(SoftCPU *cpu, FILE *file)
{
  assert(cpu);
  assert(file);

  fprintf(file, "%*s ", 8, "");

  for (unsigned i = 0; i < 16; ++i)
    fprintf(file, " %8.8X ", i);

  for (unsigned i = 0; i < RAM_SIZE; ++i)
    {
      if (i % 16 == 0)
        fprintf(file, "\n%8.8X:", i);

      fprintf(file, " %8.8X ", (unsigned char)cpu->RAM[i]);
    }

  putc('\n', file);
  putc('\n', file);
}

static void dumpRegisters(SoftCPU *cpu, FILE *file)
{
  assert(cpu);
  assert(file);

  for (unsigned i = 0; i < REGISTERS_COUNT; ++i)
    fprintf(file, "Reg#%u: %d ", i, cpu->registers[i]);

  putc('\n', file);
}
