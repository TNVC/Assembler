#include <stdio.h>
#include <string.h>
#include <time.h>
#include "executor.h"
#include "fiofunctions.h"
#include "systemlike.h"
#include "softcpucmd.h"
#include "stack.h"
#include "errorhandler.h"
#include "asserts.h"

/// Parse argument of current cmd
/// @param [in] cpu SoftCPU object with memory and pc
/// @return Pointer to needed memory cell or nullptr if Arg isn`t correct
static int *parseArg(SoftCPU *cpu);

/// Dump CPU
/// @param [in] cpu SoftCPU object for dump
static void dumpCPU(SoftCPU *cpu);

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
        case SOFTCPU_HLT:
          {
            return 0;
          }
        case SOFTCPU_PUSH:
          {
            int *cell = parseArg(cpu);

            if (cell)
              {
                stack_push(&cpu->stack, *cell);
              }
            else
              {
                handleError("PUSH hasn`t argument!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_ADD:
          {
            if (stack_size(&cpu->stack) >= 2)
              stack_push(&cpu->stack, stack_pop(&cpu->stack) + stack_pop(&cpu->stack));
            else
              {
                handleError("Too little elements in stack for ADD!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_SUB:
          {
            if (stack_size(&cpu->stack) >= 2)
              stack_push(&cpu->stack, stack_pop(&cpu->stack) - stack_pop(&cpu->stack));
            else
              {
                handleError("Too little elements in stack for SUB!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_MUL:
          {
            if (stack_size(&cpu->stack) >= 2)
              stack_push(&cpu->stack, stack_pop(&cpu->stack) * stack_pop(&cpu->stack));
            else
              {
                handleError("Too little elements in stack for MUL!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_DIV:
          {
            if (stack_size(&cpu->stack) >= 2)
              {
                int firstVal  = stack_pop(&cpu->stack);
                int secondVal = stack_pop(&cpu->stack);

                if (secondVal == 0)
                  {
                    handleError("DIV by zero!!");

                    return SOFTCPU_DIV_BY_ZERO;
                  }

                stack_push(&cpu->stack, firstVal / secondVal);
              }
            else
              {
                handleError("Too little elements in stack for DIV!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_OUT:
          {
            if (stack_size(&cpu->stack) >= 1)
              {
                printf("%d\n", stack_pop(&cpu->stack));
              }
            else
              {
                handleError("Too little elements in stack for OUT!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_DUMP:
          {
            break;

            dumpCPU(cpu);

            getchar();

            break;
          }
        case SOFTCPU_IN:
          {
            int val = 0;

            if (scanf("%d", &val) != 1)
              {
                handleError("Incorrect input!!");

                return SOFTCPU_NO_INPUT;
              }

            stack_push(&cpu->stack, val);

            break;
          }
        case SOFTCPU_COPY:
          {
            if (stack_size(&cpu->stack) >= 1)
              {
                stack_push(&cpu->stack, stack_top(&cpu->stack));
              }
            else
              {
                handleError("Too little elements in stack for COPY!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_SWAP:
          {
            if (stack_size(&cpu->stack) >= 2)
              {
                int firstVal  = stack_pop(&cpu->stack);
                int secondVal = stack_pop(&cpu->stack);

                stack_push(&cpu->stack,  firstVal);
                stack_push(&cpu->stack, secondVal);
              }
            else
              {
                handleError("Too little elements in stack for SWAP!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_POP:
          {
            if (stack_size(&cpu->stack) < 1)
              {
                handleError("Too little elements in stack for POP!!");

                return SOFTCPU_EMPTY_STACK;
              }

            int *cell = parseArg(cpu);

            if (cell)
              {
                *cell = stack_pop(&cpu->stack);
              }
            else
              {
                handleError("PUSH hasn`t argument!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_JMP:
          {
            int *cell = parseArg(cpu);

            if (cell)
              {
                if (*cell < 0 || *cell >= cpu->codeCapacity)
                  {
                    handleError("Incorrect JMP argument!!");

                    return SOFTCPU_INCORRECT_JUMP;
                  }

                cpu->pc = (size_t)*cell - 1;
              }
            else
              {
                handleError("PUSH hasn`t argument!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        case SOFTCPU_JB:
          {
            int *cell = parseArg(cpu);

            if (cell)
              {
                if (*cell < 0 || *cell >= cpu->codeCapacity)
                  {
                    handleError("Incorrect JMP argument!!");

                    return SOFTCPU_INCORRECT_JUMP;
                  }

                if (stack_size(&cpu->stack) < 2)
                  {
                    handleError("Too little argument for JB!!");

                    return SOFTCPU_EMPTY_STACK;
                  }

                int first  = stack_pop(&cpu->stack);
                int second = stack_pop(&cpu->stack);

                if (first < second)
                  cpu->pc = (size_t)*cell - 1;
              }
            else
              {
                handleError("PUSH hasn`t argument!!");

                return SOFTCPU_EMPTY_STACK;
              }

            break;
          }
        default:
          {
            handleError("Unknown cmd [%d]!!", cmd.code);

            return SOFTCPU_UNKNOWN_CMD;
          }
        }
    }

  return 0;
}

static void dumpCPU(SoftCPU *cpu)
{
  printf("%*s ", 8, "");

  for (unsigned i = 0; i < 16; ++i)
    printf("%0*X ", 2, i);

  for (unsigned i = 0; i < cpu->codeCapacity; ++i)
    {
      if (i % 16 == 0)
        printf("\n%08X ", i);

      if (i == cpu->pc)
        printf("\b[%0*X]", 2, (char)cpu->code[i]);
      else
        printf("%0*X "   , 2, (char)cpu->code[i]);
    }

  putchar('\n');
  putchar('\n');

  for (unsigned i = 0; i < REGISTERS_COUNT; ++i)
    printf("Reg#%d: %d ", i, cpu->registers[i]);

  putchar('\n');

  stack_dump(&cpu->stack, stack_valid(&cpu->stack), stdout);
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
