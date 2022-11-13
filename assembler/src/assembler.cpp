#include <stdlib.h>
#include "assembler.h"
#include "systemlike.h"
#include "errorhandler.h"
#include "asserts.h"

/// Resize code array to newSize
/// @param [in/out] assembler Assembler object
/// @param [in] newSize New capacity of code array
/// @return Error`s code
/// @note Set assembler.codeCapacity to newSize
static int resizeAssemblerCode(Assembler *assembler, size_t newSize);

void initAssembler(Assembler *assembler)
{
  assert(assembler);

  assembler->code            = nullptr;
  assembler->codeCapacity    = 0;
  assembler->lastLabel       = 0;
  assembler->compilationTime = 0;
  assembler->pc              = 0;
  assembler->videoMode       = 0;
}

void destroyAssembler(Assembler *assembler)
{
  assert(assembler);

  free(assembler->code);
  assembler->codeCapacity    = 0;
  assembler->lastLabel       = 0;
  assembler->compilationTime = 0;
  assembler->pc              = 0;
  assembler->videoMode       = 0;
}

int allocateAssemblerCode(Assembler *assembler, size_t startCapacity)
{
  assert(assembler);

  assembler->code = (cmd_t *)calloc(startCapacity, sizeof(cmd_t));

  if (!assembler->code)
    return ASSEMBLER_OUT_OF_MEMORY;

  return 0;
}

int increaseAssemblerCodeCapacity(Assembler *assembler)
{
  assert(assembler);

  if (resizeAssemblerCode(assembler, 2*assembler->codeCapacity + 2*sizeof(data_t)))
    return ASSEMBLER_OUT_OF_MEMORY;

  return 0;
}

int isNeedResizeAssemblerCode(Assembler *assembler)
{
  assert(assembler);

  if (assembler->compilationTime != 1)
    return 0;

  if (assembler->pc + 2*sizeof(data_t) >= assembler->codeCapacity)
    return 1;

  return 0;
}

int trimAssemblerCode(Assembler *assembler)
{
  assert(assembler);

  if (assembler->compilationTime != 1)
    return 0;

  if (assembler->pc && assembler->pc != assembler->codeCapacity && resizeAssemblerCode(assembler, assembler->pc))
    return ASSEMBLER_OUT_OF_MEMORY;

  return 0;
}

static int resizeAssemblerCode(Assembler *assembler, size_t newSize)
{
  assert(assembler);

  cmd_t *temp = (cmd_t *)recalloc(assembler->code, newSize, sizeof(cmd_t));

  assembler->codeCapacity = newSize;

    if (!temp)
      return ASSEMBLER_OUT_OF_MEMORY;

  assembler->code = temp;

  return 0;
}
