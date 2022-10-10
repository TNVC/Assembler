#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "executor.h"
#include "fiofunctions.h"
#include "systemlike.h"
#include "softcpucmd.h"
#include "stack.h"
#include "logging.h"
#include "errorhandler.h"
#include "asserts.h"

/// Parse argument of current cmd
/// @param [in] cpu SoftCPU object with memory and pc
/// @return Pointer to needed memory cell or nullptr if Arg isn`t correct
static int *parseArg(SoftCPU *cpu);

/// Dump CPU
/// @param [in] cpu SoftCPU object for dump
/// @param [in] file File for dump
static void dumpCPU(SoftCPU *cpu, FILE *file);

/// Return address of RAM cell with index in cpu
/// @param [in] cpu SoftCPU object with RAM
/// @param [in] index Index of needed cell in RAM
/// @return Pointer to RAM cell with index or nullptr if inedex isn`t correct
static int *getRAMCell(SoftCPU *cpu, int index);

int checkTitle(FILE *filePtr)
{
  assert(filePtr);

  Title title = {};

  if (readBin(&title, sizeof(title), 1, filePtr) != 1)
    return NO_TITLE;

  if (strcmp(title.securityCode, SECURITY_CODE))
    return INCORRECT_TITLE;

  if (title.version != SOFTCPU_CMD_VERSION)
    {
      handleError("v.CPU: [%d] v.Exectable: [%d]", SOFTCPU_CMD_VERSION, title.version);

      return DIFFERENT_VERSION;
    }

  return title.cmdCount;
}

int execute(SoftCPU *cpu)
{
  assert(cpu);

  for (cpu->pc = 0; cpu->pc < cpu->codeCapacity; ++cpu->pc)
    {
      Command cmd = *((Command *)cpu->code + cpu->pc);

      switch (cmd.code)
        {

#define DEF_CMD(name, num, hasArg, ...)         \
          case num:                             \
            __VA_ARGS__                         \
              break;

#include "cmd.h"

#undef DEF_CMD

        default:
          {
            handleError("Unknown cmd [%d]!!", cmd.code);

            return SOFTCPU_UNKNOWN_CMD;
          }
        }
    }

  return 0;
}

static void dumpCPU(SoftCPU *cpu, FILE *file)
{
  fprintf(file, "%*s ", 8, "");

  for (unsigned i = 0; i < 16; ++i)
    fprintf(file, "%0*X ", 2, i);

  for (unsigned i = 0; i < cpu->codeCapacity; ++i)
    {
      if (i % 16 == 0)
        fprintf(file, "\n%08X ", i);

      if (i == cpu->pc)
        fprintf(file, "\b[%0*X]", 2, (unsigned)cpu->code[i]);
      else
        fprintf(file, "%0*X "   , 2, (unsigned)cpu->code[i]);
    }

  putc('\n', file);
  putc('\n', file);

  for (unsigned i = 0; i < REGISTERS_COUNT; ++i)
    fprintf(file, "Reg#%u: %d ", i, cpu->registers[i]);

  putc('\n', file);

  stack_dump(&cpu->stack, stack_valid(&cpu->stack), file);
}

static int *parseArg(SoftCPU *cpu)
{
  assert(cpu);

  Command cmd = *((Command *)cpu->code + cpu->pc++);

  if (cmd.mem && !(cmd.reg || cmd.immed))
    return nullptr;

  /// m r i
  /// 0 0 0 ---
  ///========== 0 1 0 +++ rax
  /// 1 0 0 ---
  ///========== 0 0 1 +++ 12
  ///========== 1 1 0 +++ [rax]
  ///========== 0 1 1 +++ 12+rax
  ///========== 1 0 1 +++ [12]
  ///========== 1 1 1 +++ [12+rax]

  int regNum = -1;
  int num    =  0;

  if (cmd.immed)
    {
      if (cpu->pc + sizeof(int) >= cpu->codeCapacity)
        {
          handleError("Executable file is broken!!");

          return nullptr;
        }

      num = *(int *)(cpu->code + cpu->pc);

      cpu->pc += sizeof(int);
    }

  if (cmd.reg)
    {
      if (cpu->pc + sizeof(char) >= cpu->codeCapacity)
        {
          handleError("Executable file is broken!!");

          return nullptr;
        }

      regNum = cpu->code[cpu->pc++];

      if (regNum < 0 || regNum >= REGISTERS_COUNT)
        {
          handleError("Incorrect register number!!");

          return nullptr;
        }
    }

  if (cmd.mem)
    {
      int memIndex = 0;

      if (cmd.reg)
        memIndex += cpu->registers[regNum];

      if (cmd.immed)
        memIndex += num;

      if (memIndex >= RAM_SIZE)
        {
          handleError("Incorrect RAM address [%d]!!", memIndex);

          return nullptr;
        }

      --cpu->pc;

      return getRAMCell(cpu, memIndex);
    }

  if (cmd.immed)
    {
      static int buffer = 0;

      buffer = num;

      if (cmd.reg)
        buffer += cpu->registers[regNum];

      --cpu->pc;

      return &buffer;
    }

  if (cmd.reg)
    {
      --cpu->pc;

      return &cpu->registers[regNum];
    }

  handleError("Unkwonwn error!!");

  return nullptr;
}

static int *getRAMCell(SoftCPU *cpu, int index)
{
  assert(cpu);

  if (index < 0 || index >= RAM_SIZE)
    return nullptr;

  clock_t start = clock();

  clock_t delay = CLOCKS_PER_SEC / 10;

  while (clock() - start <= delay)
    continue;

  return &cpu->RAM[index];
}
