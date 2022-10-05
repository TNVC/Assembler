#ifndef EXECUTOR_H_
#define EXECUTOR_H_

/// Check the title in file
/// @param [in] filePtr Executable file with title
/// @return Count of comant from title
int checkTitle(FILE *filePtr);

/// Execute cmds
/// @param [in] cmds Cmd sequence
/// @param [in] cmdCount Size of sequence
void execute(const int *cmds, size_t cmdCout);

#endif
