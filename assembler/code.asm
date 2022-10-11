PUSH 2	
POP rcx
  next:
PUSH rcx
CALL FACT
OUT

PUSH rcx
PUSH 1
ADD
POP rcx

PUSH 10
PUSH rcx
JB :next

IN
CALL FACT
OUT

HLT

FACT:
;dump

  POP rax  ;save ret address
  POP rbx  ;take parameter
  
  PUSH rbx ;push a
  
;dump
    start:
  PUSH 1   ;\
  PUSH rbx ; |=>push a-1
  SUB      ;/
  POP rbx  ;save a-1
  PUSH rbx ;push a-1
  
;dump
  MUL      ;mul a*(a-1)

;dump
  PUSH 1   ;
  PUSH rbx ;push cur value of a  
  
;dump
  JA  start; a > 1
  
    end:
  PUSH rax ;push ret address
  RET
