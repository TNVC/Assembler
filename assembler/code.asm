PUSH 1
POP rax
  next:
PUSH rax
PUSH rax
MUL
OUT

PUSH rax
PUSH 1
ADD
POP rax

PUSH 10
PUSH rax
JB :next

HLT
