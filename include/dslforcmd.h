#define VAR data_t
#define REAL double

#define ACCURACY 10000.
#define INT(real) (int)(real)
#define FRACT(real) (int)(((real) - (int)(real)) * ACCURACY)
#define TO_REAL(INT, FRACT) (INT + ((FRACT) / ACCURACY))

#define SIZE stack_size(&cpu->stack)

#define PUSH(value) stack_push(&cpu->stack, value)
#define POP  stack_pop (&cpu->stack)
#define TOP  stack_top(&cpu->stack)

#define PUSH_REAL(value)                        \
  do                                            \
    {                                           \
      REAL valToPush = value;                   \
                                                \
      PUSH(FRACT(valToPush));                   \
      PUSH(INT(valToPush));                     \
    } while (0)
#define POP_REAL TO_REAL(POP, POP)
#define TOP_REAL TO_REAL(TOP, cpu->stack.array[cpu->stack.lastElementIndex - 2])

#define ARG  parseArg(cpu)
#define REG(name) cpu->registers[#name[1] - 'a']
#define SET_PC(arg) cpu->pc = (size_t)arg - 1
#define REAL_CALC_TURN_ON REG(rex)

#define CHECK_STACK_FOR_UNARY  CHECK_STACK_FOR(REG(rex) ? 2u : 1u)
#define CHECK_STACK_FOR_BINARY CHECK_STACK_FOR(REG(rex) ? 4u : 2u)
#define CHECK_STACK_FOR_ONE    CHECK_STACK_FOR(1u)
#define CHECK_STACK_FOR_TWO    CHECK_STACK_FOR(2u)
#define CHECK_STACK_FOR(value)                  \
  do                                            \
    {                                           \
      if (SIZE < (value))                       \
      NO_SIZE;                                  \
    } while (0)

#define IS_ZERO(val) (fabs(val) < 0.00001)
#define CHECK_IS_ZERO(val)                          \
  do                                                \
    {                                               \
      if (IS_ZERO(val))                             \
        DIV_BY_ZERO;                                \
    } while (0)
#define CHECK_ARG(arg)                          \
  do                                            \
    {                                           \
      if (!arg)                                 \
        NO_ARG;                                 \
    } while (0)
#define CHECK_ADR(address)                                        \
  do                                                              \
    {                                                             \
      if (address < 0 || (size_t)address >= cpu->codeCapacity)    \
        return SOFTCPU_INCORRECT_JUMP;                            \
    } while (0)

#define NO_ARG                                        \
  do                                                  \
    {                                                 \
    handleError("Hasn`t argument[%06X]!!", cpu->pc);  \
                                                      \
    return SOFTCPU_EMPTY_STACK;                       \
  } while(0)
#define NO_SIZE                                                         \
  do                                                                    \
    {                                                                   \
      handleError("Too little elements in stack [%06X]!!", cpu->pc);    \
                                                                        \
      return SOFTCPU_EMPTY_STACK;                                       \
    } while (0)
#define DIV_BY_ZERO                                 \
  do                                                \
    {                                               \
      handleError("DIV by zero[%06X]!!", cpu->pc);  \
                                                    \
      return SOFTCPU_DIV_BY_ZERO;                   \
    } while (0)
#define NO_INPUT                                \
  do                                            \
    {                                           \
      handleError("No input[%06X]!!", cpu->pc); \
                                                \
      return SOFTCPU_NO_INPUT;                  \
    } while (0)
#define NEGATIVE_VALUE                                          \
  do                                                            \
    {                                                           \
      handleError("Negative value for math[%06X]!!", cpu->pc);  \
                                                                \
      return SOFTCPU_NEGATIVE_VALUE;                            \
    } while (0)

#define DEF_JMP(name, num, operator)                                    \
  DEF_CMD(name, num, 1, 1, {                                            \
      CHECK_STACK_FOR_BINARY;                                           \
                                                                        \
      VAR *arg = ARG;                                                   \
                                                                        \
      CHECK_ARG(arg);                                                   \
                                                                        \
      CHECK_ADR(*arg);                                                  \
                                                                        \
      if (REAL_CALC_TURN_ON)                                            \
        {                                                               \
          if (POP_REAL operator POP_REAL)                               \
            SET_PC(*arg);                                               \
        }                                                               \
      else                                                              \
        {                                                               \
          if (POP operator POP)                                         \
            SET_PC(*arg);                                               \
        }                                                               \
    })

#define DEF_JMP_EQUAL(name, num, isEqual)                               \
  DEF_CMD(name, num, 1, 1, {                                            \
      CHECK_STACK_FOR_BINARY;                                           \
                                                                        \
      VAR *arg = ARG;                                                   \
                                                                        \
      CHECK_ARG(arg);                                                   \
                                                                        \
      CHECK_ADR(*arg);                                                  \
                                                                        \
      if (REAL_CALC_TURN_ON)                                            \
        {                                                               \
          if (( isEqual &&  IS_ZERO(POP_REAL - POP_REAL)) ||            \
              (!isEqual && !IS_ZERO(POP_REAL - POP_REAL)))              \
            SET_PC(*arg);                                               \
        }                                                               \
      else                                                              \
        {                                                               \
          if (( isEqual && POP == POP) ||                               \
              (!isEqual && POP != POP))                                 \
            SET_PC(*arg);                                               \
        }                                                               \
    })

#define MATH(type, notNeg, funct, ...)                  \
  do                                                    \
    {                                                   \
      type val = POP##__VA_ARGS__;                      \
                                                        \
      if (notNeg && val < 0)                            \
        NEGATIVE_VALUE;                                 \
                                                        \
      type value = (type)funct(val);                    \
                                                        \
      PUSH##__VA_ARGS__(value);                         \
    } while (0)
//#define NO_ARGS //for ...
#define DEF_MATH(name, num, notNeg, funct)      \
  DEF_CMD(name, num, 0, 0, {                    \
      CHECK_STACK_FOR_UNARY;                    \
                                                \
      if (REAL_CALC_TURN_ON)                    \
        MATH(REAL, notNeg, funct, _REAL);       \
      else                                      \
        MATH(VAR, notNeg, funct);               \
    })
