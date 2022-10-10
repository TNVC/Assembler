#define VAR int
#define REAL double
#define INT(real) (int)real
#define FRACT(real) (int)((real - (int)real) * 10000)
#define TO_REAL(INT, FRACT) (INT + (FRACT / 10000.0))
#define PUSH(value) stack_push(&cpu->stack, value)
#define POP  stack_pop (&cpu->stack)
#define TOP  stack_top(&cpu->stack)
#define SIZE stack_size(&cpu->stack)
#define ARG  parseArg(cpu)
//#define REG(name)
#define SET_PC(arg) cpu->pc = (size_t)*arg - 1
#define CHECK_ADR(address)                                        \
  do                                                              \
    {                                                             \
      if (*address < 0 || (size_t)*address >= cpu->codeCapacity)  \
        return SOFTCPU_INCORRECT_JUMP;                            \
    } while (0)
#define NO_ARG                                  \
  do                                            \
  {                                             \
    handleError("Hasn`t argument!!");           \
                                                \
    return SOFTCPU_EMPTY_STACK;                 \
  } while(0)
#define NO_SIZE                                       \
  do                                                  \
    {                                                 \
      handleError("Too little elements in stack!!");  \
                                                      \
      return SOFTCPU_EMPTY_STACK;                     \
    } while (0)
#define DEF_JMP(name, num, operator)            \
  DEF_CMD(name, num, 1, {                       \
      if (SIZE < 2)                             \
        NO_SIZE;                                \
                                                \
      VAR *arg = ARG;                           \
                                                \
      if (arg)                                  \
        {                                       \
          CHECK_ADR(arg);                       \
                                                \
          if (POP operator POP)                 \
            SET_PC(arg);                        \
        }                                       \
      else                                      \
        NO_ARG;                                 \
    })
#define DEF_MATH(name, num, funct)              \
  DEF_CMD(name, num, 0, {                       \
      if (SIZE < 2)                             \
        NO_SIZE;                                \
                                                \
      REAL value = funct(TO_REAL(POP, POP));    \
                                                \
      PUSH(FRACT(value));                       \
      PUSH(INT(value));                         \
    })