#include <stdlib.h>
#include "errorhandler.h"
#include "stack.h"
#include "softcpu.h"
#include "asserts.h"

#define OUT_OF_MEMORY                           \
  do                                            \
    {                                           \
      handleError("Out of memory");             \
                                                \
      return SOFTCPU_OUT_OF_MEMORY;             \
    } while (0)

int initSoftCPU(SoftCPU *cpu)
{
  assert(cpu);

  cpu->code         = nullptr;
  cpu->codeCapacity = 0;
  cpu->stack        = {};
  cpu->pc           = 0;
  cpu->videoMode    = 0;
  cpu->RAM          = (data_t *)calloc(RAM_SIZE, sizeof(data_t));

  if (!cpu->RAM)
    OUT_OF_MEMORY;

  stack_init(&cpu->stack, 10);

  return 0;
}

void destroySoftCPU(SoftCPU *cpu)
{
  assert(cpu);

  free(cpu->code);
  free(cpu->RAM);
  stack_destroy(&cpu->stack);

  cpu->codeCapacity = 0;
  cpu->stack        = {};
  cpu->pc           = 0;
  cpu->videoMode    = 0;
}

int allocateSoftCPUCode(SoftCPU *cpu)
{
  assert(cpu);

  cpu->code = (cmd_t *)calloc(cpu->codeCapacity, sizeof(cmd_t));

  if (!cpu->code)
    OUT_OF_MEMORY;

  return 0;
}
