#include "dslforcmd.h"

DEF_CMD(HLT ,  0, 0, {
    return 0;
  })

DEF_CMD(PUSH,  1, 1, {
    VAR *arg = ARG;

    if (arg)
      PUSH(*arg);
    else
      NO_ARG;
  })

DEF_CMD(ADD ,  2, 0, {
    if (SIZE < 2)
      NO_SIZE;

    PUSH(POP + POP);
  })

DEF_CMD(SUB ,  3, 0, {
    if (SIZE < 2)
      NO_SIZE;

    PUSH(POP - POP);
  })

DEF_CMD(MUL ,  4, 0, {
    if (SIZE < 2)
      NO_SIZE;

    PUSH(POP * POP);
  })

DEF_CMD(DIV ,  5, 0, {
    if (SIZE < 2)
      NO_SIZE;

    VAR a = POP;
    VAR b = POP;

    if (b == 0)
      {
        handleError("DIV by zero!!");

        return SOFTCPU_DIV_BY_ZERO;
      }

    PUSH(a / b);
  })

DEF_CMD(OUT ,  6, 0, {
    if (SIZE < 1)
      NO_SIZE;

    printf("%d\n", POP);
  })

DEF_CMD(DUMP,  7, 0, {
    dumpCPU(cpu, getLogFile());
  })

DEF_CMD(IN  ,  8, 0, {
    VAR a = 0;

    if (scanf("%d", &a) != 1)
      {
        handleError("No input!!");

        return SOFTCPU_NO_INPUT;
      }

    PUSH(a);
  })

DEF_CMD(COPY,  9, 0, {
    if (SIZE < 1)
      NO_SIZE;

    PUSH(TOP);
  })

DEF_CMD(SWAP, 10, 0, {
    if (SIZE < 2)
      NO_SIZE;

    VAR a = POP;
    VAR b = POP;

    PUSH(b);
    PUSH(a);
  })

DEF_CMD(POP , 11, 1, {
    if (SIZE < 1)
      NO_SIZE;

    VAR *arg = ARG;

    if (arg)
      *arg = POP;
    else
      NO_ARG;
  })

DEF_CMD(JMP , 12, 1, {
    VAR *arg = ARG;

    if (arg)
      {
        CHECK_ADR(*arg);

        SET_PC(*arg);
      }
    else
      NO_ARG;
  })

DEF_JMP(JB , 13, < )

DEF_JMP(JBE, 14, <=)

DEF_JMP(JA , 15, > )

DEF_JMP(JAE, 16, >=)

DEF_JMP(JE , 17, ==)

DEF_JMP(JNE, 18, !=)

DEF_MATH(SIN, 19, sin)

DEF_MATH(COS, 20, cos)

DEF_MATH(TAN, 21, tan)

DEF_CMD(SHOW, 22, 0, {
    showMemory(cpu);
  })

DEF_CMD(RET, 25, 0, {
    if (SIZE < 1)
      NO_SIZE;

    VAR adr = POP;

    CHECK_ADR(adr);

    SET_PC(adr);
  })

DEF_CMD(CALL, 26, 1, {
    VAR *arg = ARG;

    if (arg)
      {
        CHECK_ADR(*arg);

        PUSH((VAR)(cpu->pc + 1));

        SET_PC(*arg);
      }
    else
      NO_ARG;
  })

#undef DEF_JMP
#undef DEF_MATH
