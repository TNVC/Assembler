#include <stdio.h>
#include "executor.h"
#include "fiofunctions.h"
#include "systemlike.h"
#include "softcpucmd.h"
#include "stack.h"
#include "errorhandler.h"

#define STOP_EXECUTE(STK, MESSAGE, ...)     \
  do                                        \
   {                                        \
     stack_destroy(&STK);                   \
                                            \
     handleError(MESSAGE __VA_OPT__(,) __VA_ARGS__);     \
   } while (0)
   
/// Dump CPU
/// @param [in] cmds Cmd sequence
/// @param [in] cmdCount Count of cmd in cmds
/// @param [in] pc Current cmd index
/// @param [in] stk CPU stack
static void dumpCPU(const int *cmds, size_t cmdCount, size_t pc, const Stack *stk);

int checkTitle(FILE *filePtr)
{
  if (!isPointerCorrect(filePtr))
    ERROR;
    
  Title title = {};
  
  if (readBin(&title, sizeof(title), 1, filePtr) != 1)
    ERROR;
    
  if (title.securityCode[0] != SECURITY_CODE[0] ||
      title.securityCode[1] != SECURITY_CODE[1] ||
      title.securityCode[2] != SECURITY_CODE[2])
    {
      handleError("File type isn`t executable!!");
    }
      
   if (title.version != SOFTCPU_CMD_VERSION)
     handleError("Other version!! v.CPU: [%d] v.Exectable: [%d]", SOFTCPU_CMD_VERSION, title.version);
    
  return title.cmdCount;
}

void execute(const int *cmds, size_t cmdCount)
{
  if (!isPointerCorrect(cmds))
      ERROR;
      
  cmdCount *= 2;
      
  Stack stk = {};
  
  stack_init(&stk, cmdCount/2);
      
  for (size_t pc = 0; pc < cmdCount; pc += 2)
    {
      switch (cmds[pc])
      {
      case SOFTCPU_HLT:
        {
          stack_destroy(&stk);
        
          return;
        }
      case SOFTCPU_PUSH:
        {
          if (pc + 1 < cmdCount)
            stack_push(&stk, cmds[pc + 1]);
          else
            STOP_EXECUTE(stk, "%s hasn`t argument!!", SOFTCPU_CMD[SOFTCPU_PUSH]);
            
          break;
        }
      case SOFTCPU_ADD:
        {
          if (stack_size(&stk) >= 2)
            stack_push(&stk, stack_pop(&stk) + stack_pop(&stk));
          else
            STOP_EXECUTE(stk, "Too little elements in stack for %s!!", SOFTCPU_CMD[SOFTCPU_ADD]);
        
          break;
        }
      case SOFTCPU_SUB:
        {
          if (stack_size(&stk) >= 2)
            stack_push(&stk, stack_pop(&stk) - stack_pop(&stk));
          else
            STOP_EXECUTE(stk, "Too little elements in stack for %s!!", SOFTCPU_CMD[SOFTCPU_SUB]);
        
          break;
        }
      case SOFTCPU_MUL:
        {
          if (stack_size(&stk) >= 2)
            stack_push(&stk, stack_pop(&stk) * stack_pop(&stk));
          else
            STOP_EXECUTE(stk, "Too little elements in stack for %s!!", SOFTCPU_CMD[SOFTCPU_MUL]);
        
          break;
        }
      case SOFTCPU_DIV:
        {
          if (stack_size(&stk) >= 2)
            {
              int firstVal  = stack_pop(&stk);
              int secondVal = stack_pop(&stk);
              
              if (secondVal == 0)
              	STOP_EXECUTE(stk, "DIV by zero!!");
              
              stack_push(&stk, firstVal + secondVal);
            }
          else
            STOP_EXECUTE(stk, "Too little elements in stack for %s!!", SOFTCPU_CMD[SOFTCPU_DIV]);
        
          break;
        }
      case SOFTCPU_OUT:
        {
          if (stack_size(&stk) >= 1)
            {
              printf("%d\n", stack_pop(&stk));
            }
          else
            STOP_EXECUTE(stk, "Too little elements in stack for %s!!", SOFTCPU_CMD[SOFTCPU_OUT]);
        
          break;
        }
      case SOFTCPU_DUMP:
        {
          dumpCPU(cmds, cmdCount, pc, &stk);
          
          getchar();
        
          break;
        }
      case SOFTCPU_IN:
        {
          int val = 0;
          
          if (scanf("%d", &val) != 1)
            STOP_EXECUTE(stk, "Incorrect input!!");
           
          stack_push(&stk, val);
        
          break;
        }
      case SOFTCPU_COPY:
        {
          if (stack_size(&stk) >= 1)
            {
              stack_push(&stk, stack_top(&stk));
            }
          else
            STOP_EXECUTE(stk, "Too little elements in stack for %s!!", SOFTCPU_CMD[SOFTCPU_COPY]);
        
        
          break;
        }
      case SOFTCPU_SWAP:
        {          
          if (stack_size(&stk) >= 2)
            {        
              int firstVal  = stack_pop(&stk);
              int secondVal = stack_pop(&stk); 
              
              stack_push(&stk,  firstVal);
              stack_push(&stk, secondVal);
            }
          else
            STOP_EXECUTE(stk, "Too little elements in stack for %s!!", SOFTCPU_CMD[SOFTCPU_SWAP]);
            
          break;
        }
      default:
        {          
          STOP_EXECUTE(stk, "Unknown cmd[%d]!!", cmds[pc]);
            
          break;
        }
      }
    }
    
    stack_destroy(&stk);
}

static void dumpCPU(const int *cmds, size_t cmdCount, size_t pc, const Stack *stk)
{
  printf("%*s ", 8, "");
  
  for (unsigned i = 0; i < 16; ++i)
      printf("%0*X ", (int)sizeof(int), i);
  
  for (unsigned i = 0; i < cmdCount; ++i)
    {
      if (i % 16 == 0)
        printf("\n%08X ", i);
        
      if (i == pc)
        printf("\b[%0*X]", (int)sizeof(int), (unsigned)cmds[i]);
      else
        printf("%0*X "  , (int)sizeof(int), (unsigned)cmds[i]);
    }
    
    putchar('\n');

  stack_dump(stk, stack_valid(stk), stdout);
}
