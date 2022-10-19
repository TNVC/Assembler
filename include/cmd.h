#include "dslforcmd.h"

DEF_CMD(HLT, 0, 0, {
    return 0;
  })

DEF_CMD(PUSH,  1, 1, {
    VAR *arg = ARG;

    CHECK_ARG(arg);

    PUSH(*arg);
  })

DEF_CMD(ADD, 2, 0, {
    CHECK_STACK_FOR_BINARY;

    if (REAL_CALC_TURN_ON)
      PUSH_REAL(POP_REAL + POP_REAL);
    else
      PUSH(POP + POP);
  })

DEF_CMD(SUB, 3, 0, {
    CHECK_STACK_FOR_BINARY;

    if (REAL_CALC_TURN_ON)
      PUSH_REAL(POP_REAL - POP_REAL);
    else
      PUSH(POP - POP);
  })

DEF_CMD(MUL, 4, 0, {
    CHECK_STACK_FOR_BINARY;

    if (REAL_CALC_TURN_ON)
      PUSH_REAL(POP_REAL * POP_REAL);
    else
      PUSH(POP * POP);
  })

DEF_CMD(DIV, 5, 0, {
    CHECK_STACK_FOR_BINARY;

    if (REAL_CALC_TURN_ON)
      {
        REAL a = POP_REAL;
        REAL b = POP_REAL;

        CHECK_IS_ZERO(b);

        PUSH_REAL(a / b);
      }
    else
      {
        VAR a = POP;
        VAR b = POP;

        CHECK_IS_ZERO(b);

        PUSH(a / b);
      }
  })

DEF_CMD(OUT, 6, 0, {
    CHECK_STACK_FOR_UNARY;

    if (REAL_CALC_TURN_ON)
      printf("%lg\n", POP_REAL);
    else
      printf("%d\n", POP);
  })

DEF_CMD(DUMP, 7, 0, {
    dumpCPU(cpu, stdout);

    getchar();
  })

DEF_CMD(IN, 8, 0, {
    if (REAL_CALC_TURN_ON)
      {
        REAL a = 0;

        if (scanf("%lg", &a) != 1)
          NO_INPUT;

        PUSH_REAL(a);
      }
    else
      {
        VAR a = 0;

        if (scanf("%d", &a) != 1)
          NO_INPUT;

        PUSH(a);
      }
  })

DEF_CMD(COPY, 9, 0, {
    CHECK_STACK_FOR_UNARY;

    if (REAL_CALC_TURN_ON)
      PUSH_REAL(TOP_REAL);
    else
      PUSH(TOP);
  })

DEF_CMD(SWAP, 10, 0, {
    CHECK_STACK_FOR_BINARY;

    if (REAL_CALC_TURN_ON)
      {
        REAL a = POP_REAL;
        REAL b = POP_REAL;

        PUSH_REAL(a);
        PUSH_REAL(b);
      }
    else
      {
        VAR a = POP;
        VAR b = POP;

        PUSH(a);
        PUSH(b);
      }
  })

DEF_CMD(POP, 11, 1, {
    CHECK_STACK_FOR_ONE;

    VAR *arg = ARG;

    CHECK_ARG(arg);

    *arg = POP;
  })

DEF_CMD(JMP, 12, 1, {
    VAR *arg = ARG;

    CHECK_ARG(arg);

    CHECK_ADR(*arg);

    SET_PC(*arg);
  })

DEF_JMP(JB , 13, < )

DEF_JMP(JBE, 14, <=)

DEF_JMP(JA , 15, > )

DEF_JMP(JAE, 16, >=)

DEF_JMP_ACCURATE(JE , 17, 1)

DEF_JMP_ACCURATE(JNE, 18, 0)

DEF_MATH(SIN , 19, 0, sin)

DEF_MATH(COS , 20, 0, cos)

DEF_MATH(TAN , 21, 0, tan)

DEF_MATH(SQRT, 22, 1, sqrt)

DEF_CMD(SHOW, 23, 0, {
    showMemory(cpu);
  })

DEF_CMD(RET, 24, 0, {
    CHECK_STACK_FOR_ONE;

    VAR adr = POP;

    CHECK_ADR(adr);

    SET_PC(adr);
  })

DEF_CMD(CALL, 25, 1, {
    VAR *arg = ARG;

    CHECK_ARG(arg);

    CHECK_ADR(*arg);

    PUSH((VAR)(cpu->pc + 1));

    SET_PC(*arg);
  })

#undef DEF_JMP
#undef DEF_JMP_ACCURACY
#undef DEF_MATH
#undef MATH
