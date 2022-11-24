#include "title.h"
#include "fiofunctions.h"
#include "filesutils.h"
#include "errorhandler.h"
#include "settings.h"
#include "asserts.h"

/// Get code array capacity from title and set to disasm.codeCapacity
/// @param [out] disasm Disassembler object
/// @param [in] sourceFile File with original code
/// @return Error`s code
static int getAndSaveCapacityFromTitle(Disassembler *disasm, FILE *sourceFile);

int getFileCode(Disassembler *disasm)
{
  assert(disasm);

  if (!getSourceFileName())
    {
      handleError("SOURCE_FILE_NAME is nullptr. File: %s, Line: %d",
                  __FILE__, __LINE__);

      return ERROR;
    }

  FILE *sourceFile = fopen(getSourceFileName(), "rb");

  if (!sourceFile)
    {
      handleError("Cannot open file [%d]", getSourceFileName());

      return ERROR;
    }

  if (getAndSaveCapacityFromTitle(disasm, sourceFile))
    {
      fclose(sourceFile);

      return ERROR;
    }

  if (allocateDisassemblerCode(disasm))
    {
      handleError("Out of memory");

      fclose(sourceFile);

      return ERROR;
    }

  if (readBin(disasm->code, sizeof(char), disasm->codeCapacity, sourceFile) !=  disasm->codeCapacity)
    {
      handleError("Executable file is broken!!");

      fclose(sourceFile);

      return ERROR;
    }

  fclose(sourceFile);

  return 0;
}

int openTargetFile(FILE **targetFile)
{
  assert(targetFile);

  if (!getTargetFileName())
    {
      handleError("TARGET_FILE_NAME is nullptr. File: %d, Line: %d",
                  __FILE__, __LINE__);

      return ERROR;
    }

  *targetFile = fopen(getTargetFileName(), "wb");

  if (!targetFile)
    {
      handleError("Cannot open file [%d]", getTargetFileName());

      return ERROR;
    }

  return 0;
}

static int getAndSaveCapacityFromTitle(Disassembler *disasm, FILE *sourceFile)
{
  assert (disasm);
  assert(sourceFile);

  disasm->codeCapacity = (size_t)checkTitle(sourceFile, &disasm->videoMode);

  switch (disasm->codeCapacity)
    {
    case NO_TITLE:
    case INCORRECT_TITLE:
      {
        handleError("File isn`t exectutable!!");

        return ERROR;
      }
    case DIFFERENT_VERSION:
      {
        handleError("Different version!!");

        return ERROR;
      }
    default:
      break;
    }

  return 0;
}
