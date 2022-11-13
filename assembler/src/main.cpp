#include "consoleargsutils.h"
#include "line.h"
#include "filesutils.h"
#include "assembler.h"
#include "settings.h"

int main(const int argc, const char * const argv[])
{
  if (parseConsoleArgs(argc, argv))
    return 0;

  Strings strings = {};

  if (getFileStrings(&strings))
    return 0;

  if (parseFileStrings(&strings))
    return 0;

  FILE *targetFile = nullptr;

  if (openTargetFile(&targetFile))
    {
      destroyStrings(&strings);

      return 0;
    }

  FILE *listingFile = nullptr;

  if (openListingFile(&listingFile))
    {
      destroyStrings(&strings);

      fclose(targetFile);

      return 0;
    }

  Assembler assembler = {};

  initAssembler(&assembler);

  int ok = 1;
  if (ok) ok = !compile(&assembler, strings.sequence, strings.stringsCount);
  if (ok) ok = !compile(&assembler, strings.sequence, strings.stringsCount, listingFile);
  if (ok) ok = !writeCode(&assembler, targetFile);

  fclose(targetFile);

  if (getListingFileName())
    fclose(listingFile);

  destroyAssembler(&assembler);

  destroyStrings(&strings);

  return 0;
}
