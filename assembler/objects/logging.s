	.file	"logging.cpp"
	.text
.Ltext0:
	.file 0 "/home/tnvc/Documents/assembler/assembler" "../src/logging/logging.cpp"
	.local	_ZL8LOG_FILE
	.comm	_ZL8LOG_FILE,8,8
	.local	_ZL9LOG_LEVEL
	.comm	_ZL9LOG_LEVEL,4,4
	.local	_ZL13LOG_FILE_NAME
	.comm	_ZL13LOG_FILE_NAME,8,8
	.data
	.align 8
	.type	_ZL17MAX_LOG_FILE_SIZE, @object
	.size	_ZL17MAX_LOG_FILE_SIZE, 8
_ZL17MAX_LOG_FILE_SIZE:
	.quad	268435456
	.section	.rodata
.LC0:
	.string	".log/"
.LC1:
	.string	"a"
	.align 8
.LC2:
	.string	"==========================================================================================\n"
	.align 8
.LC3:
	.string	"============================================= START =============================================\n\n"
	.text
	.type	_ZL7initLogv, @function
_ZL7initLogv:
.LFB13:
	.file 1 "../src/logging/logging.cpp"
	.loc 1 80 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 81 20
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	_Z12isFileExistsPKc@PLT
	.loc 1 81 7
	testl	%eax, %eax
	sete	%al
	.loc 1 81 3
	testb	%al, %al
	je	.L2
	.loc 1 82 10
	movl	$511, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	mkdir@PLT
.L2:
	.loc 1 84 36
	call	_ZL17getNewLogFileNamev
	.loc 1 84 17
	movq	%rax, _ZL13LOG_FILE_NAME(%rip)
	.loc 1 86 19
	movq	_ZL13LOG_FILE_NAME(%rip), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	.loc 1 86 12
	movq	%rax, _ZL8LOG_FILE(%rip)
	.loc 1 88 16
	movq	_ZL8LOG_FILE(%rip), %rax
	.loc 1 88 3
	testq	%rax, %rax
	jne	.L3
	.loc 1 89 12
	movl	$0, %eax
	jmp	.L4
.L3:
	.loc 1 91 10
	movq	_ZL8LOG_FILE(%rip), %rax
	movl	$0, %ecx
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setvbuf@PLT
	.loc 1 93 9
	leaq	_ZL10destroyLogv(%rip), %rax
	movq	%rax, %rdi
	call	atexit@PLT
.LBB2:
	.loc 1 95 15
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 95 136
	movq	$0, -8(%rbp)
	.loc 1 95 159
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	.loc 1 95 184
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdx
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	fputs@PLT
	.loc 1 95 232
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$99, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 95 365
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.LBE2:
	.loc 1 97 12
	movl	$0, -12(%rbp)
	.loc 1 117 10
	movl	-12(%rbp), %eax
.L4:
	.loc 1 118 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	_ZL7initLogv, .-_ZL7initLogv
	.section	.rodata
	.align 8
.LC4:
	.string	"==========================================================================================\n\n"
	.align 8
.LC5:
	.string	"=============================================  END  =============================================\n\n"
	.text
	.type	_ZL10destroyLogv, @function
_ZL10destroyLogv:
.LFB14:
	.loc 1 121 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 122 23
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	testl	%eax, %eax
	setne	%al
	.loc 1 122 3
	testb	%al, %al
	je	.L6
	.loc 1 124 19
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$92, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 124 142
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$99, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 124 275
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 126 13
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L6:
	.loc 1 129 12
	movq	$0, _ZL8LOG_FILE(%rip)
	.loc 1 131 23
	movq	_ZL13LOG_FILE_NAME(%rip), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	testl	%eax, %eax
	setne	%al
	.loc 1 131 3
	testb	%al, %al
	je	.L7
	.loc 1 132 9
	movq	_ZL13LOG_FILE_NAME(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
.L7:
	.loc 1 134 17
	movq	$0, _ZL13LOG_FILE_NAME(%rip)
	.loc 1 136 13
	movl	$0, _ZL9LOG_LEVEL(%rip)
	.loc 1 137 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	_ZL10destroyLogv, .-_ZL10destroyLogv
	.section	.rodata
	.align 8
.LC6:
	.string	"=============================================NEWFILE=============================================\n\n"
	.text
	.globl	_Z10getLogFilev
	.type	_Z10getLogFilev, @function
_Z10getLogFilev:
.LFB15:
	.loc 1 140 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 141 39
	movq	_ZL13LOG_FILE_NAME(%rip), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	movl	%eax, -16(%rbp)
	.loc 1 143 31
	movq	_ZL13LOG_FILE_NAME(%rip), %rax
	movq	%rax, %rdi
	call	_Z11getFileSizePKc@PLT
	.loc 1 143 47
	movq	_ZL17MAX_LOG_FILE_SIZE(%rip), %rdx
	cmpq	%rdx, %rax
	setnb	%al
	.loc 1 143 50
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
.LBB3:
	.loc 1 145 3
	cmpl	$0, -16(%rbp)
	je	.L9
	.loc 1 145 21 discriminator 1
	cmpl	$0, -12(%rbp)
	je	.L9
.LBB4:
.LBB5:
	.loc 1 147 27
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	testl	%eax, %eax
	setne	%al
	.loc 1 147 7
	testb	%al, %al
	je	.L10
.LBB6:
.LBB7:
	.loc 1 149 23
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 149 144
	movq	$0, -8(%rbp)
	.loc 1 149 167
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	.loc 1 149 192
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdx
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	fputs@PLT
	.loc 1 149 240
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$99, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 149 373
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.LBE7:
	.loc 1 151 17
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L10:
.LBE6:
.LBE5:
	.loc 1 154 11
	movq	_ZL13LOG_FILE_NAME(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 156 26
	call	_ZL14openNewLogFilev
	.loc 1 156 11
	testl	%eax, %eax
	sete	%al
	.loc 1 156 7
	testb	%al, %al
	je	.L11
	.loc 1 157 16
	movl	$0, %eax
	jmp	.L12
.L11:
.LBB8:
	.loc 1 159 19
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 159 140
	movq	$0, -8(%rbp)
	.loc 1 159 163
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	.loc 1 159 188
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdx
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	fputs@PLT
	.loc 1 159 236
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$99, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 159 369
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.LBE8:
.LBE4:
	.loc 1 160 5
	jmp	.L13
.L9:
.LBB9:
.LBB10:
	.loc 1 161 8
	cmpl	$0, -16(%rbp)
	jne	.L13
	.loc 1 161 27 discriminator 1
	cmpl	$0, -12(%rbp)
	je	.L13
.LBB11:
	.loc 1 163 26
	call	_ZL14openNewLogFilev
	.loc 1 163 11
	testl	%eax, %eax
	sete	%al
	.loc 1 163 7
	testb	%al, %al
	je	.L14
	.loc 1 164 16
	movl	$0, %eax
	jmp	.L12
.L14:
.LBB12:
	.loc 1 166 19
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 166 140
	movq	$0, -8(%rbp)
	.loc 1 166 163
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	.loc 1 166 188
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdx
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	fputs@PLT
	.loc 1 166 236
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$99, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 166 369
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rcx
	movl	$91, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L13:
.LBE12:
.LBE11:
.LBE10:
.LBE9:
.LBE3:
	.loc 1 169 10
	movq	_ZL8LOG_FILE(%rip), %rax
.L12:
	.loc 1 170 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	_Z10getLogFilev, .-_Z10getLogFilev
	.section	.rodata
.LC7:
	.string	".log/defaultLogFile.txt"
	.text
	.type	_ZL17getNewLogFileNamev, @function
_ZL17getNewLogFileNamev:
.LFB16:
	.loc 1 173 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 174 16
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 174 42
	nop
	.loc 1 203 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	_ZL17getNewLogFileNamev, .-_ZL17getNewLogFileNamev
	.section	.rodata
.LC8:
	.string	"nullptr"
	.align 8
.LC9:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. Decimal value of '%s': %lld."
	.align 8
.LC10:
	.string	"Incorrect use of log functions!! File: %30s, Function: %60s, Line: %5d."
	.text
	.globl	_Z12loggingPrintjxPKcS0_S0_i
	.type	_Z12loggingPrintjxPKcS0_S0_i, @function
_Z12loggingPrintjxPKcS0_S0_i:
.LFB17:
	.loc 1 207 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movl	%r9d, -24(%rbp)
	.loc 1 214 24
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 214 7
	testl	%eax, %eax
	sete	%al
	.loc 1 214 3
	testb	%al, %al
	je	.L18
	.loc 1 215 10
	leaq	.LC8(%rip), %rax
	movq	%rax, -40(%rbp)
.L18:
	.loc 1 216 24
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 216 7
	testl	%eax, %eax
	sete	%al
	.loc 1 216 3
	testb	%al, %al
	je	.L19
	.loc 1 217 14
	leaq	.LC8(%rip), %rax
	movq	%rax, -48(%rbp)
.L19:
	.loc 1 218 24
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 218 7
	testl	%eax, %eax
	sete	%al
	.loc 1 218 3
	testb	%al, %al
	je	.L20
	.loc 1 219 18
	leaq	.LC8(%rip), %rax
	movq	%rax, -56(%rbp)
.L20:
	.loc 1 221 19
	movl	_ZL9LOG_LEVEL(%rip), %eax
	andl	-20(%rbp), %eax
	.loc 1 221 3
	testl	%eax, %eax
	jne	.L21
	.loc 1 222 12
	movl	$0, %eax
	jmp	.L22
.L21:
	.loc 1 224 29
	call	_Z10getLogFilev
	movq	%rax, -16(%rbp)
	.loc 1 226 24
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 226 7
	testl	%eax, %eax
	sete	%al
	.loc 1 226 3
	testb	%al, %al
	je	.L23
	.loc 1 227 12
	movl	$0, %eax
	jmp	.L22
.L23:
	.loc 1 229 41
	call	_ZL13getDataStringv
	movq	%rax, -8(%rbp)
	.loc 1 231 24
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 231 7
	testl	%eax, %eax
	sete	%al
	.loc 1 231 3
	testb	%al, %al
	je	.L24
	.loc 1 232 12
	movl	$0, %eax
	jmp	.L22
.L24:
	.loc 1 234 3
	cmpl	$16, -20(%rbp)
	jne	.L25
	.loc 1 238 21
	movl	-24(%rbp), %edi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	movl	%edi, %r9d
	movq	%rsi, %r8
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 239 75
	jmp	.L22
.L25:
	.loc 1 246 14
	movl	-24(%rbp), %esi
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 249 14
	movl	$0, %eax
.L22:
	.loc 1 251 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	_Z12loggingPrintjxPKcS0_S0_i, .-_Z12loggingPrintjxPKcS0_S0_i
	.section	.rodata
	.align 8
.LC11:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. Double value of '%s': %lf."
	.text
	.globl	_Z12loggingPrintjdPKcS0_S0_i
	.type	_Z12loggingPrintjdPKcS0_S0_i, @function
_Z12loggingPrintjdPKcS0_S0_i:
.LFB18:
	.loc 1 255 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movsd	%xmm0, -32(%rbp)
	movq	%rsi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rcx, -56(%rbp)
	movl	%r8d, -24(%rbp)
	.loc 1 262 24
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 262 7
	testl	%eax, %eax
	sete	%al
	.loc 1 262 3
	testb	%al, %al
	je	.L27
	.loc 1 263 10
	leaq	.LC8(%rip), %rax
	movq	%rax, -40(%rbp)
.L27:
	.loc 1 264 24
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 264 7
	testl	%eax, %eax
	sete	%al
	.loc 1 264 3
	testb	%al, %al
	je	.L28
	.loc 1 265 14
	leaq	.LC8(%rip), %rax
	movq	%rax, -48(%rbp)
.L28:
	.loc 1 266 24
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 266 7
	testl	%eax, %eax
	sete	%al
	.loc 1 266 3
	testb	%al, %al
	je	.L29
	.loc 1 267 18
	leaq	.LC8(%rip), %rax
	movq	%rax, -56(%rbp)
.L29:
	.loc 1 269 19
	movl	_ZL9LOG_LEVEL(%rip), %eax
	andl	-20(%rbp), %eax
	.loc 1 269 3
	testl	%eax, %eax
	jne	.L30
	.loc 1 270 12
	movl	$0, %eax
	jmp	.L31
.L30:
	.loc 1 272 29
	call	_Z10getLogFilev
	movq	%rax, -16(%rbp)
	.loc 1 274 24
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 274 7
	testl	%eax, %eax
	sete	%al
	.loc 1 274 3
	testb	%al, %al
	je	.L32
	.loc 1 275 12
	movl	$0, %eax
	jmp	.L31
.L32:
	.loc 1 277 41
	call	_ZL13getDataStringv
	movq	%rax, -8(%rbp)
	.loc 1 279 24
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 279 7
	testl	%eax, %eax
	sete	%al
	.loc 1 279 3
	testb	%al, %al
	je	.L33
	.loc 1 280 12
	movl	$0, %eax
	jmp	.L31
.L33:
	.loc 1 282 3
	cmpl	$16, -20(%rbp)
	jne	.L34
	.loc 1 285 21
	movq	-32(%rbp), %rsi
	movl	-24(%rbp), %r8d
	movq	-56(%rbp), %rdi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	subq	$8, %rsp
	pushq	-40(%rbp)
	movq	%rsi, %xmm0
	movl	%r8d, %r9d
	movq	%rdi, %r8
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 286 75
	jmp	.L31
.L34:
	.loc 1 293 14
	movl	-24(%rbp), %esi
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 296 14
	movl	$0, %eax
.L31:
	.loc 1 298 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	_Z12loggingPrintjdPKcS0_S0_i, .-_Z12loggingPrintjdPKcS0_S0_i
	.section	.rodata
	.align 8
.LC12:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. Char value of '%s': '%c'."
	.text
	.globl	_Z12loggingPrintjcPKcS0_S0_i
	.type	_Z12loggingPrintjcPKcS0_S0_i, @function
_Z12loggingPrintjcPKcS0_S0_i:
.LFB19:
	.loc 1 302 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, %eax
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movq	%r8, -48(%rbp)
	movl	%r9d, -52(%rbp)
	movb	%al, -24(%rbp)
	.loc 1 308 18
	movsbl	-24(%rbp), %eax
	movl	%eax, %edi
	call	isgraph@PLT
	.loc 1 308 26
	testl	%eax, %eax
	jne	.L36
	.loc 1 308 43 discriminator 1
	movsbl	-24(%rbp), %eax
	movl	%eax, %edi
	call	isspace@PLT
	.loc 1 308 51 discriminator 1
	testl	%eax, %eax
	je	.L37
	.loc 1 308 51 is_stmt 0 discriminator 3
	movl	$32, %eax
	jmp	.L39
.L37:
	.loc 1 308 51 discriminator 4
	movl	$35, %eax
	jmp	.L39
.L36:
	.loc 1 308 26 is_stmt 1 discriminator 2
	movzbl	-24(%rbp), %eax
.L39:
	.loc 1 308 9 discriminator 8
	movb	%al, -24(%rbp)
	.loc 1 310 24 discriminator 8
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 310 7 discriminator 8
	testl	%eax, %eax
	sete	%al
	.loc 1 310 3 discriminator 8
	testb	%al, %al
	je	.L40
	.loc 1 311 10
	leaq	.LC8(%rip), %rax
	movq	%rax, -32(%rbp)
.L40:
	.loc 1 312 24
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 312 7
	testl	%eax, %eax
	sete	%al
	.loc 1 312 3
	testb	%al, %al
	je	.L41
	.loc 1 313 14
	leaq	.LC8(%rip), %rax
	movq	%rax, -40(%rbp)
.L41:
	.loc 1 314 24
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 314 7
	testl	%eax, %eax
	sete	%al
	.loc 1 314 3
	testb	%al, %al
	je	.L42
	.loc 1 315 18
	leaq	.LC8(%rip), %rax
	movq	%rax, -48(%rbp)
.L42:
	.loc 1 317 19
	movl	_ZL9LOG_LEVEL(%rip), %eax
	andl	-20(%rbp), %eax
	.loc 1 317 3
	testl	%eax, %eax
	jne	.L43
	.loc 1 318 12
	movl	$0, %eax
	jmp	.L44
.L43:
	.loc 1 320 29
	call	_Z10getLogFilev
	movq	%rax, -16(%rbp)
	.loc 1 322 24
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 322 7
	testl	%eax, %eax
	sete	%al
	.loc 1 322 3
	testb	%al, %al
	je	.L45
	.loc 1 323 12
	movl	$0, %eax
	jmp	.L44
.L45:
	.loc 1 325 41
	call	_ZL13getDataStringv
	movq	%rax, -8(%rbp)
	.loc 1 327 24
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 327 7
	testl	%eax, %eax
	sete	%al
	.loc 1 327 3
	testb	%al, %al
	je	.L46
	.loc 1 328 12
	movl	$0, %eax
	jmp	.L44
.L46:
	.loc 1 330 3
	cmpl	$16, -20(%rbp)
	jne	.L47
	.loc 1 333 21
	movsbl	-24(%rbp), %esi
	movl	-52(%rbp), %r8d
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	pushq	%rsi
	pushq	-32(%rbp)
	movl	%r8d, %r9d
	movq	%rdi, %r8
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 334 75
	jmp	.L44
.L47:
	.loc 1 341 14
	movl	-52(%rbp), %esi
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 344 14
	movl	$0, %eax
.L44:
	.loc 1 346 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	_Z12loggingPrintjcPKcS0_S0_i, .-_Z12loggingPrintjcPKcS0_S0_i
	.section	.rodata
	.align 8
.LC13:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. Pointer value of '%s': %p."
	.text
	.globl	_Z12loggingPrintjPKvPKcS2_S2_i
	.type	_Z12loggingPrintjPKvPKcS2_S2_i, @function
_Z12loggingPrintjPKvPKcS2_S2_i:
.LFB20:
	.loc 1 350 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movl	%r9d, -24(%rbp)
	.loc 1 357 24
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 357 7
	testl	%eax, %eax
	sete	%al
	.loc 1 357 3
	testb	%al, %al
	je	.L49
	.loc 1 358 10
	leaq	.LC8(%rip), %rax
	movq	%rax, -40(%rbp)
.L49:
	.loc 1 359 24
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 359 7
	testl	%eax, %eax
	sete	%al
	.loc 1 359 3
	testb	%al, %al
	je	.L50
	.loc 1 360 14
	leaq	.LC8(%rip), %rax
	movq	%rax, -48(%rbp)
.L50:
	.loc 1 361 24
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 361 7
	testl	%eax, %eax
	sete	%al
	.loc 1 361 3
	testb	%al, %al
	je	.L51
	.loc 1 362 18
	leaq	.LC8(%rip), %rax
	movq	%rax, -56(%rbp)
.L51:
	.loc 1 364 19
	movl	_ZL9LOG_LEVEL(%rip), %eax
	andl	-20(%rbp), %eax
	.loc 1 364 3
	testl	%eax, %eax
	jne	.L52
	.loc 1 365 12
	movl	$0, %eax
	jmp	.L53
.L52:
	.loc 1 367 29
	call	_Z10getLogFilev
	movq	%rax, -16(%rbp)
	.loc 1 369 24
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 369 7
	testl	%eax, %eax
	sete	%al
	.loc 1 369 3
	testb	%al, %al
	je	.L54
	.loc 1 370 12
	movl	$0, %eax
	jmp	.L53
.L54:
	.loc 1 372 41
	call	_ZL13getDataStringv
	movq	%rax, -8(%rbp)
	.loc 1 374 24
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 374 7
	testl	%eax, %eax
	sete	%al
	.loc 1 374 3
	testb	%al, %al
	je	.L55
	.loc 1 375 12
	movl	$0, %eax
	jmp	.L53
.L55:
	.loc 1 377 3
	cmpl	$16, -20(%rbp)
	jne	.L56
	.loc 1 380 21
	movl	-24(%rbp), %edi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	movl	%edi, %r9d
	movq	%rsi, %r8
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 381 75
	jmp	.L53
.L56:
	.loc 1 388 14
	movl	-24(%rbp), %esi
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 391 14
	movl	$0, %eax
.L53:
	.loc 1 393 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	_Z12loggingPrintjPKvPKcS2_S2_i, .-_Z12loggingPrintjPKvPKcS2_S2_i
	.section	.rodata
	.align 8
.LC14:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. C-like string value of '%s': \"%s\"."
	.align 8
.LC15:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. Message: \"%s\"."
	.align 8
.LC16:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. WARNING!!: \"%s\"."
	.align 8
.LC17:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. ERROR!!: \"%s\"."
	.align 8
.LC18:
	.string	"[%s] File: %30s, Function: %60s, Line: %5d. !!FATAL ERROR!!: \"%s\"."
	.align 8
.LC19:
	.string	"Incorrect use of log functions!! File: %30s, Function: %60s, Line %5d."
	.text
	.globl	_Z12loggingPrintjPKcS0_S0_S0_i
	.type	_Z12loggingPrintjPKcS0_S0_S0_i, @function
_Z12loggingPrintjPKcS0_S0_S0_i:
.LFB21:
	.loc 1 397 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movl	%r9d, -24(%rbp)
	.loc 1 398 24
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 398 7
	testl	%eax, %eax
	sete	%al
	.loc 1 398 3
	testb	%al, %al
	je	.L58
	.loc 1 399 11
	leaq	.LC8(%rip), %rax
	movq	%rax, -32(%rbp)
.L58:
	.loc 1 400 24
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 400 7
	testl	%eax, %eax
	sete	%al
	.loc 1 400 3
	testb	%al, %al
	je	.L59
	.loc 1 401 10
	leaq	.LC8(%rip), %rax
	movq	%rax, -40(%rbp)
.L59:
	.loc 1 402 24
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 402 7
	testl	%eax, %eax
	sete	%al
	.loc 1 402 3
	testb	%al, %al
	je	.L60
	.loc 1 403 14
	leaq	.LC8(%rip), %rax
	movq	%rax, -48(%rbp)
.L60:
	.loc 1 404 24
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 404 7
	testl	%eax, %eax
	sete	%al
	.loc 1 404 3
	testb	%al, %al
	je	.L61
	.loc 1 405 18
	leaq	.LC8(%rip), %rax
	movq	%rax, -56(%rbp)
.L61:
	.loc 1 407 19
	movl	_ZL9LOG_LEVEL(%rip), %eax
	andl	-20(%rbp), %eax
	.loc 1 407 3
	testl	%eax, %eax
	jne	.L62
	.loc 1 408 12
	movl	$0, %eax
	jmp	.L63
.L62:
	.loc 1 410 29
	call	_Z10getLogFilev
	movq	%rax, -16(%rbp)
	.loc 1 412 24
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 412 7
	testl	%eax, %eax
	sete	%al
	.loc 1 412 3
	testb	%al, %al
	je	.L64
	.loc 1 413 12
	movl	$0, %eax
	jmp	.L63
.L64:
	.loc 1 415 41
	call	_ZL13getDataStringv
	movq	%rax, -8(%rbp)
	.loc 1 417 24
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 417 7
	testl	%eax, %eax
	sete	%al
	.loc 1 417 3
	testb	%al, %al
	je	.L65
	.loc 1 418 12
	movl	$0, %eax
	jmp	.L63
.L65:
	.loc 1 420 3
	cmpl	$16, -20(%rbp)
	ja	.L66
	movl	-20(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L68(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L68(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L68:
	.long	.L66-.L68
	.long	.L72-.L68
	.long	.L71-.L68
	.long	.L66-.L68
	.long	.L70-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L69-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L67-.L68
	.text
.L67:
	.loc 1 423 21
	cmpq	$0, -32(%rbp)
	je	.L73
	.loc 1 423 21 is_stmt 0 discriminator 1
	movq	-32(%rbp), %rax
	jmp	.L74
.L73:
	.loc 1 423 21 discriminator 2
	leaq	.LC8(%rip), %rax
.L74:
	.loc 1 423 21 discriminator 4
	movl	-24(%rbp), %r8d
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rdi
	pushq	%rax
	pushq	-40(%rbp)
	movl	%r8d, %r9d
	movq	%rsi, %r8
	leaq	.LC14(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 424 95 is_stmt 1 discriminator 4
	jmp	.L63
.L69:
	.loc 1 427 21
	movl	-24(%rbp), %edi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	subq	$8, %rsp
	pushq	-32(%rbp)
	movl	%edi, %r9d
	movq	%rsi, %r8
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 428 69
	jmp	.L63
.L70:
	.loc 1 431 21
	movl	-24(%rbp), %edi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	subq	$8, %rsp
	pushq	-32(%rbp)
	movl	%edi, %r9d
	movq	%rsi, %r8
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 432 69
	jmp	.L63
.L71:
	.loc 1 435 21
	movl	-24(%rbp), %edi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	subq	$8, %rsp
	pushq	-32(%rbp)
	movl	%edi, %r9d
	movq	%rsi, %r8
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 436 69
	jmp	.L63
.L72:
	.loc 1 439 21
	movl	-24(%rbp), %edi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	subq	$8, %rsp
	pushq	-32(%rbp)
	movl	%edi, %r9d
	movq	%rsi, %r8
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 440 69
	jmp	.L63
.L66:
	.loc 1 443 21
	movl	-24(%rbp), %esi
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 444 50
	nop
.L63:
	.loc 1 448 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	_Z12loggingPrintjPKcS0_S0_S0_i, .-_Z12loggingPrintjPKcS0_S0_S0_i
	.type	_ZL14openNewLogFilev, @function
_ZL14openNewLogFilev:
.LFB22:
	.loc 1 451 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 452 36
	call	_ZL17getNewLogFileNamev
	.loc 1 452 17
	movq	%rax, _ZL13LOG_FILE_NAME(%rip)
	.loc 1 454 19
	movq	_ZL13LOG_FILE_NAME(%rip), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	.loc 1 454 12
	movq	%rax, _ZL8LOG_FILE(%rip)
	.loc 1 456 24
	movq	_ZL8LOG_FILE(%rip), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	.loc 1 456 7
	testl	%eax, %eax
	sete	%al
	.loc 1 456 3
	testb	%al, %al
	je	.L76
	.loc 1 458 17
	movl	$0, _ZL9LOG_LEVEL(%rip)
	.loc 1 460 14
	movl	$0, %eax
	jmp	.L77
.L76:
	.loc 1 463 10
	movq	_ZL8LOG_FILE(%rip), %rax
	movl	$0, %ecx
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setvbuf@PLT
	.loc 1 465 10
	movl	$1, %eax
.L77:
	.loc 1 466 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	_ZL14openNewLogFilev, .-_ZL14openNewLogFilev
	.type	_ZL13getDataStringv, @function
_ZL13getDataStringv:
.LFB23:
	.loc 1 469 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 470 10
	movq	$0, -24(%rbp)
	.loc 1 472 7
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	.loc 1 474 27
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, -16(%rbp)
	.loc 1 476 25
	movq	-16(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -8(%rbp)
	.loc 1 477 23
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16isPointerCorrectPKv@PLT
	testl	%eax, %eax
	setne	%al
	.loc 1 477 3
	testb	%al, %al
	je	.L79
	.loc 1 478 14
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
.L79:
	.loc 1 480 10
	movq	-16(%rbp), %rax
	.loc 1 481 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	_ZL13getDataStringv, .-_ZL13getDataStringv
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB24:
	.loc 1 481 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 481 1
	cmpl	$1, -4(%rbp)
	jne	.L83
	.loc 1 481 1 is_stmt 0 discriminator 1
	cmpl	$65535, -8(%rbp)
	jne	.L83
	.loc 1 73 36 is_stmt 1
	call	_ZL7initLogv
	.loc 1 73 17
	movl	%eax, _ZL9LOG_LEVEL(%rip)
.L83:
	.loc 1 481 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I__Z10getLogFilev, @function
_GLOBAL__sub_I__Z10getLogFilev:
.LFB25:
	.loc 1 481 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 481 1
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	_GLOBAL__sub_I__Z10getLogFilev, .-_GLOBAL__sub_I__Z10getLogFilev
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z10getLogFilev
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdlib.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.file 8 "/usr/include/c++/11/cstdlib"
	.file 9 "/usr/include/c++/11/bits/std_abs.h"
	.file 10 "/usr/include/c++/11/stdlib.h"
	.file 11 "/usr/include/string.h"
	.file 12 "/usr/include/ctype.h"
	.file 13 "/usr/include/stdio.h"
	.file 14 "../include/utils/systemlike.h"
	.file 15 "/usr/include/time.h"
	.file 16 "/usr/include/x86_64-linux-gnu/sys/stat.h"
	.file 17 "/usr/include/x86_64-linux-gnu/c++/11/bits/c++config.h"
	.file 18 "../include/logging/logging.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x10ff
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1d
	.long	.LASF1698
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0xb
	.long	.LASF1582
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x3e
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF1575
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF1576
	.uleb128 0x1e
	.byte	0x8
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF1577
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF1578
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF1579
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF1580
	.uleb128 0x1f
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF1581
	.uleb128 0xb
	.long	.LASF1583
	.byte	0x3
	.byte	0x96
	.byte	0x16
	.long	0x45
	.uleb128 0xb
	.long	.LASF1584
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x71
	.uleb128 0xb
	.long	.LASF1585
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x71
	.uleb128 0xb
	.long	.LASF1586
	.byte	0x3
	.byte	0xa0
	.byte	0x12
	.long	0x71
	.uleb128 0x7
	.long	0xad
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF1587
	.uleb128 0x10
	.long	0xad
	.uleb128 0x20
	.long	.LASF1699
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x240
	.uleb128 0x3
	.long	.LASF1588
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x6a
	.byte	0
	.uleb128 0x3
	.long	.LASF1589
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xa8
	.byte	0x8
	.uleb128 0x3
	.long	.LASF1590
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xa8
	.byte	0x10
	.uleb128 0x3
	.long	.LASF1591
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xa8
	.byte	0x18
	.uleb128 0x3
	.long	.LASF1592
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xa8
	.byte	0x20
	.uleb128 0x3
	.long	.LASF1593
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xa8
	.byte	0x28
	.uleb128 0x3
	.long	.LASF1594
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xa8
	.byte	0x30
	.uleb128 0x3
	.long	.LASF1595
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xa8
	.byte	0x38
	.uleb128 0x3
	.long	.LASF1596
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xa8
	.byte	0x40
	.uleb128 0x3
	.long	.LASF1597
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xa8
	.byte	0x48
	.uleb128 0x3
	.long	.LASF1598
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xa8
	.byte	0x50
	.uleb128 0x3
	.long	.LASF1599
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xa8
	.byte	0x58
	.uleb128 0x3
	.long	.LASF1600
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x259
	.byte	0x60
	.uleb128 0x3
	.long	.LASF1601
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x25e
	.byte	0x68
	.uleb128 0x3
	.long	.LASF1602
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x6a
	.byte	0x70
	.uleb128 0x3
	.long	.LASF1603
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x6a
	.byte	0x74
	.uleb128 0x3
	.long	.LASF1604
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x84
	.byte	0x78
	.uleb128 0x3
	.long	.LASF1605
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x55
	.byte	0x80
	.uleb128 0x3
	.long	.LASF1606
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5c
	.byte	0x82
	.uleb128 0x3
	.long	.LASF1607
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x263
	.byte	0x83
	.uleb128 0x3
	.long	.LASF1608
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x273
	.byte	0x88
	.uleb128 0x3
	.long	.LASF1609
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x90
	.byte	0x90
	.uleb128 0x3
	.long	.LASF1610
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x27d
	.byte	0x98
	.uleb128 0x3
	.long	.LASF1611
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x287
	.byte	0xa0
	.uleb128 0x3
	.long	.LASF1612
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x25e
	.byte	0xa8
	.uleb128 0x3
	.long	.LASF1613
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x4c
	.byte	0xb0
	.uleb128 0x3
	.long	.LASF1614
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x32
	.byte	0xb8
	.uleb128 0x3
	.long	.LASF1615
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x6a
	.byte	0xc0
	.uleb128 0x3
	.long	.LASF1616
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x28c
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF1617
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xb9
	.uleb128 0x21
	.long	.LASF1700
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x11
	.long	.LASF1618
	.uleb128 0x7
	.long	0x254
	.uleb128 0x7
	.long	0xb9
	.uleb128 0x18
	.long	0xad
	.long	0x273
	.uleb128 0x19
	.long	0x3e
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x24c
	.uleb128 0x11
	.long	.LASF1619
	.uleb128 0x7
	.long	0x278
	.uleb128 0x11
	.long	.LASF1620
	.uleb128 0x7
	.long	0x282
	.uleb128 0x18
	.long	0xad
	.long	0x29c
	.uleb128 0x19
	.long	0x3e
	.byte	0x13
	.byte	0
	.uleb128 0x7
	.long	0xb4
	.uleb128 0x7
	.long	0x240
	.uleb128 0x6
	.byte	0x20
	.byte	0x3
	.long	.LASF1621
	.uleb128 0x6
	.byte	0x10
	.byte	0x4
	.long	.LASF1622
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.long	.LASF1623
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.long	.LASF1624
	.uleb128 0x6
	.byte	0x10
	.byte	0x4
	.long	.LASF1625
	.uleb128 0x12
	.byte	0x8
	.byte	0x3c
	.long	.LASF1628
	.long	0x2ee
	.uleb128 0x3
	.long	.LASF1626
	.byte	0x6
	.byte	0x3d
	.byte	0x9
	.long	0x6a
	.byte	0
	.uleb128 0x13
	.string	"rem"
	.byte	0x3e
	.byte	0x9
	.long	0x6a
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.long	.LASF1627
	.byte	0x6
	.byte	0x3f
	.byte	0x5
	.long	0x2c9
	.uleb128 0x12
	.byte	0x10
	.byte	0x44
	.long	.LASF1629
	.long	0x31f
	.uleb128 0x3
	.long	.LASF1626
	.byte	0x6
	.byte	0x45
	.byte	0xe
	.long	0x71
	.byte	0
	.uleb128 0x13
	.string	"rem"
	.byte	0x46
	.byte	0xe
	.long	0x71
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	.LASF1630
	.byte	0x6
	.byte	0x47
	.byte	0x5
	.long	0x2fa
	.uleb128 0x12
	.byte	0x10
	.byte	0x4e
	.long	.LASF1631
	.long	0x350
	.uleb128 0x3
	.long	.LASF1626
	.byte	0x6
	.byte	0x4f
	.byte	0x13
	.long	0x350
	.byte	0
	.uleb128 0x13
	.string	"rem"
	.byte	0x50
	.byte	0x13
	.long	0x350
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF1632
	.uleb128 0xb
	.long	.LASF1633
	.byte	0x6
	.byte	0x51
	.byte	0x5
	.long	0x32b
	.uleb128 0xb
	.long	.LASF1634
	.byte	0x7
	.byte	0xa
	.byte	0x12
	.long	0x9c
	.uleb128 0x10
	.long	0x363
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF1635
	.uleb128 0x22
	.long	.LASF1636
	.byte	0x6
	.value	0x330
	.byte	0xf
	.long	0x388
	.uleb128 0x7
	.long	0x38d
	.uleb128 0x23
	.long	0x6a
	.long	0x3a1
	.uleb128 0x1
	.long	0x3a1
	.uleb128 0x1
	.long	0x3a1
	.byte	0
	.uleb128 0x7
	.long	0x3a6
	.uleb128 0x24
	.uleb128 0x25
	.string	"std"
	.byte	0x11
	.value	0x116
	.byte	0xb
	.long	0x546
	.uleb128 0x2
	.byte	0x8
	.byte	0x7f
	.byte	0xb
	.long	0x2ee
	.uleb128 0x2
	.byte	0x8
	.byte	0x80
	.byte	0xb
	.long	0x31f
	.uleb128 0x2
	.byte	0x8
	.byte	0x86
	.byte	0xb
	.long	0x546
	.uleb128 0x2
	.byte	0x8
	.byte	0x89
	.byte	0xb
	.long	0x563
	.uleb128 0x2
	.byte	0x8
	.byte	0x8c
	.byte	0xb
	.long	0x57e
	.uleb128 0x2
	.byte	0x8
	.byte	0x8d
	.byte	0xb
	.long	0x594
	.uleb128 0x2
	.byte	0x8
	.byte	0x8e
	.byte	0xb
	.long	0x5aa
	.uleb128 0x2
	.byte	0x8
	.byte	0x8f
	.byte	0xb
	.long	0x5c0
	.uleb128 0x2
	.byte	0x8
	.byte	0x91
	.byte	0xb
	.long	0x5eb
	.uleb128 0x2
	.byte	0x8
	.byte	0x94
	.byte	0xb
	.long	0x607
	.uleb128 0x2
	.byte	0x8
	.byte	0x96
	.byte	0xb
	.long	0x61e
	.uleb128 0x2
	.byte	0x8
	.byte	0x99
	.byte	0xb
	.long	0x63a
	.uleb128 0x2
	.byte	0x8
	.byte	0x9a
	.byte	0xb
	.long	0x656
	.uleb128 0x2
	.byte	0x8
	.byte	0x9b
	.byte	0xb
	.long	0x688
	.uleb128 0x2
	.byte	0x8
	.byte	0x9d
	.byte	0xb
	.long	0x6a9
	.uleb128 0x2
	.byte	0x8
	.byte	0xa0
	.byte	0xb
	.long	0x6c9
	.uleb128 0x2
	.byte	0x8
	.byte	0xa3
	.byte	0xb
	.long	0x6dc
	.uleb128 0x2
	.byte	0x8
	.byte	0xa5
	.byte	0xb
	.long	0x6e9
	.uleb128 0x2
	.byte	0x8
	.byte	0xa6
	.byte	0xb
	.long	0x6fa
	.uleb128 0x2
	.byte	0x8
	.byte	0xa7
	.byte	0xb
	.long	0x71a
	.uleb128 0x2
	.byte	0x8
	.byte	0xa8
	.byte	0xb
	.long	0x73a
	.uleb128 0x2
	.byte	0x8
	.byte	0xa9
	.byte	0xb
	.long	0x75a
	.uleb128 0x2
	.byte	0x8
	.byte	0xab
	.byte	0xb
	.long	0x771
	.uleb128 0x2
	.byte	0x8
	.byte	0xac
	.byte	0xb
	.long	0x797
	.uleb128 0x2
	.byte	0x8
	.byte	0xf0
	.byte	0x16
	.long	0x357
	.uleb128 0x2
	.byte	0x8
	.byte	0xf5
	.byte	0x16
	.long	0x7f8
	.uleb128 0x2
	.byte	0x8
	.byte	0xf6
	.byte	0x16
	.long	0x812
	.uleb128 0x2
	.byte	0x8
	.byte	0xf8
	.byte	0x16
	.long	0x82e
	.uleb128 0x2
	.byte	0x8
	.byte	0xf9
	.byte	0x16
	.long	0x884
	.uleb128 0x2
	.byte	0x8
	.byte	0xfa
	.byte	0x16
	.long	0x844
	.uleb128 0x2
	.byte	0x8
	.byte	0xfb
	.byte	0x16
	.long	0x864
	.uleb128 0x2
	.byte	0x8
	.byte	0xfc
	.byte	0x16
	.long	0x89f
	.uleb128 0xd
	.string	"abs"
	.byte	0x4f
	.long	.LASF1637
	.long	0x2c2
	.long	0x4cc
	.uleb128 0x1
	.long	0x2c2
	.byte	0
	.uleb128 0xd
	.string	"abs"
	.byte	0x4b
	.long	.LASF1638
	.long	0x2b4
	.long	0x4e4
	.uleb128 0x1
	.long	0x2b4
	.byte	0
	.uleb128 0xd
	.string	"abs"
	.byte	0x47
	.long	.LASF1639
	.long	0x2bb
	.long	0x4fc
	.uleb128 0x1
	.long	0x2bb
	.byte	0
	.uleb128 0xd
	.string	"abs"
	.byte	0x3d
	.long	.LASF1640
	.long	0x350
	.long	0x514
	.uleb128 0x1
	.long	0x350
	.byte	0
	.uleb128 0xd
	.string	"abs"
	.byte	0x38
	.long	.LASF1641
	.long	0x71
	.long	0x52c
	.uleb128 0x1
	.long	0x71
	.byte	0
	.uleb128 0x1a
	.string	"div"
	.byte	0xb1
	.long	.LASF1644
	.long	0x31f
	.uleb128 0x1
	.long	0x71
	.uleb128 0x1
	.long	0x71
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	.LASF1319
	.byte	0x6
	.value	0x25a
	.byte	0xc
	.long	0x6a
	.long	0x55d
	.uleb128 0x1
	.long	0x55d
	.byte	0
	.uleb128 0x7
	.long	0x562
	.uleb128 0x26
	.uleb128 0x27
	.long	.LASF1320
	.byte	0x6
	.value	0x25f
	.byte	0x12
	.long	.LASF1320
	.long	0x6a
	.long	0x57e
	.uleb128 0x1
	.long	0x55d
	.byte	0
	.uleb128 0x5
	.long	.LASF1321
	.byte	0x6
	.byte	0x66
	.byte	0xf
	.long	0x2bb
	.long	0x594
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x5
	.long	.LASF1322
	.byte	0x6
	.byte	0x69
	.byte	0xc
	.long	0x6a
	.long	0x5aa
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x5
	.long	.LASF1323
	.byte	0x6
	.byte	0x6c
	.byte	0x11
	.long	0x71
	.long	0x5c0
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x8
	.long	.LASF1324
	.byte	0x6
	.value	0x33c
	.byte	0xe
	.long	0x4c
	.long	0x5eb
	.uleb128 0x1
	.long	0x3a1
	.uleb128 0x1
	.long	0x3a1
	.uleb128 0x1
	.long	0x32
	.uleb128 0x1
	.long	0x32
	.uleb128 0x1
	.long	0x37b
	.byte	0
	.uleb128 0x28
	.string	"div"
	.byte	0x6
	.value	0x35c
	.byte	0xe
	.long	0x2ee
	.long	0x607
	.uleb128 0x1
	.long	0x6a
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x8
	.long	.LASF1328
	.byte	0x6
	.value	0x281
	.byte	0xe
	.long	0xa8
	.long	0x61e
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x8
	.long	.LASF1330
	.byte	0x6
	.value	0x35e
	.byte	0xf
	.long	0x31f
	.long	0x63a
	.uleb128 0x1
	.long	0x71
	.uleb128 0x1
	.long	0x71
	.byte	0
	.uleb128 0x8
	.long	.LASF1332
	.byte	0x6
	.value	0x3a2
	.byte	0xc
	.long	0x6a
	.long	0x656
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x32
	.byte	0
	.uleb128 0x8
	.long	.LASF1333
	.byte	0x6
	.value	0x3ad
	.byte	0xf
	.long	0x32
	.long	0x677
	.uleb128 0x1
	.long	0x677
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x32
	.byte	0
	.uleb128 0x7
	.long	0x67c
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.long	.LASF1642
	.uleb128 0x10
	.long	0x67c
	.uleb128 0x8
	.long	.LASF1334
	.byte	0x6
	.value	0x3a5
	.byte	0xc
	.long	0x6a
	.long	0x6a9
	.uleb128 0x1
	.long	0x677
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x32
	.byte	0
	.uleb128 0x14
	.long	.LASF1335
	.value	0x346
	.long	0x6c9
	.uleb128 0x1
	.long	0x4c
	.uleb128 0x1
	.long	0x32
	.uleb128 0x1
	.long	0x32
	.uleb128 0x1
	.long	0x37b
	.byte	0
	.uleb128 0x29
	.long	.LASF1336
	.byte	0x6
	.value	0x276
	.byte	0xd
	.long	0x6dc
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x2a
	.long	.LASF1337
	.byte	0x6
	.value	0x1c6
	.byte	0xc
	.long	0x6a
	.uleb128 0x14
	.long	.LASF1339
	.value	0x1c8
	.long	0x6fa
	.uleb128 0x1
	.long	0x45
	.byte	0
	.uleb128 0x5
	.long	.LASF1340
	.byte	0x6
	.byte	0x76
	.byte	0xf
	.long	0x2bb
	.long	0x715
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0x7
	.long	0xa8
	.uleb128 0x5
	.long	.LASF1341
	.byte	0x6
	.byte	0xb1
	.byte	0x11
	.long	0x71
	.long	0x73a
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x715
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x5
	.long	.LASF1342
	.byte	0x6
	.byte	0xb5
	.byte	0x1a
	.long	0x3e
	.long	0x75a
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x715
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x8
	.long	.LASF1343
	.byte	0x6
	.value	0x317
	.byte	0xc
	.long	0x6a
	.long	0x771
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x8
	.long	.LASF1344
	.byte	0x6
	.value	0x3b1
	.byte	0xf
	.long	0x32
	.long	0x792
	.uleb128 0x1
	.long	0xa8
	.uleb128 0x1
	.long	0x792
	.uleb128 0x1
	.long	0x32
	.byte	0
	.uleb128 0x7
	.long	0x683
	.uleb128 0x8
	.long	.LASF1345
	.byte	0x6
	.value	0x3a9
	.byte	0xc
	.long	0x6a
	.long	0x7b3
	.uleb128 0x1
	.long	0xa8
	.uleb128 0x1
	.long	0x67c
	.byte	0
	.uleb128 0x2b
	.long	.LASF1643
	.byte	0x11
	.value	0x130
	.byte	0xb
	.long	0x812
	.uleb128 0x2
	.byte	0x8
	.byte	0xc8
	.byte	0xb
	.long	0x357
	.uleb128 0x2
	.byte	0x8
	.byte	0xd8
	.byte	0xb
	.long	0x812
	.uleb128 0x2
	.byte	0x8
	.byte	0xe3
	.byte	0xb
	.long	0x82e
	.uleb128 0x2
	.byte	0x8
	.byte	0xe4
	.byte	0xb
	.long	0x844
	.uleb128 0x2
	.byte	0x8
	.byte	0xe5
	.byte	0xb
	.long	0x864
	.uleb128 0x2
	.byte	0x8
	.byte	0xe7
	.byte	0xb
	.long	0x884
	.uleb128 0x2
	.byte	0x8
	.byte	0xe8
	.byte	0xb
	.long	0x89f
	.uleb128 0x1a
	.string	"div"
	.byte	0xd5
	.long	.LASF1645
	.long	0x357
	.uleb128 0x1
	.long	0x350
	.uleb128 0x1
	.long	0x350
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	.LASF1348
	.byte	0x6
	.value	0x362
	.byte	0x1e
	.long	0x357
	.long	0x82e
	.uleb128 0x1
	.long	0x350
	.uleb128 0x1
	.long	0x350
	.byte	0
	.uleb128 0x5
	.long	.LASF1349
	.byte	0x6
	.byte	0x71
	.byte	0x24
	.long	0x350
	.long	0x844
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x5
	.long	.LASF1350
	.byte	0x6
	.byte	0xc9
	.byte	0x16
	.long	0x350
	.long	0x864
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x715
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x5
	.long	.LASF1351
	.byte	0x6
	.byte	0xce
	.byte	0x1f
	.long	0x374
	.long	0x884
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x715
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x5
	.long	.LASF1352
	.byte	0x6
	.byte	0x7c
	.byte	0xe
	.long	0x2b4
	.long	0x89f
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0x5
	.long	.LASF1353
	.byte	0x6
	.byte	0x7f
	.byte	0x14
	.long	0x2c2
	.long	0x8ba
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0x2
	.byte	0xa
	.byte	0x27
	.byte	0xc
	.long	0x546
	.uleb128 0x2
	.byte	0xa
	.byte	0x2b
	.byte	0xe
	.long	0x563
	.uleb128 0x2
	.byte	0xa
	.byte	0x2e
	.byte	0xe
	.long	0x6c9
	.uleb128 0x2
	.byte	0xa
	.byte	0x33
	.byte	0xc
	.long	0x2ee
	.uleb128 0x2
	.byte	0xa
	.byte	0x34
	.byte	0xc
	.long	0x31f
	.uleb128 0x2
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.long	0x4b4
	.uleb128 0x2
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.long	0x4cc
	.uleb128 0x2
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.long	0x4e4
	.uleb128 0x2
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.long	0x4fc
	.uleb128 0x2
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.long	0x514
	.uleb128 0x2
	.byte	0xa
	.byte	0x37
	.byte	0xc
	.long	0x57e
	.uleb128 0x2
	.byte	0xa
	.byte	0x38
	.byte	0xc
	.long	0x594
	.uleb128 0x2
	.byte	0xa
	.byte	0x39
	.byte	0xc
	.long	0x5aa
	.uleb128 0x2
	.byte	0xa
	.byte	0x3a
	.byte	0xc
	.long	0x5c0
	.uleb128 0x2
	.byte	0xa
	.byte	0x3c
	.byte	0xc
	.long	0x7f8
	.uleb128 0x2
	.byte	0xa
	.byte	0x3c
	.byte	0xc
	.long	0x52c
	.uleb128 0x2
	.byte	0xa
	.byte	0x3c
	.byte	0xc
	.long	0x5eb
	.uleb128 0x2
	.byte	0xa
	.byte	0x3e
	.byte	0xc
	.long	0x607
	.uleb128 0x2
	.byte	0xa
	.byte	0x40
	.byte	0xc
	.long	0x61e
	.uleb128 0x2
	.byte	0xa
	.byte	0x43
	.byte	0xc
	.long	0x63a
	.uleb128 0x2
	.byte	0xa
	.byte	0x44
	.byte	0xc
	.long	0x656
	.uleb128 0x2
	.byte	0xa
	.byte	0x45
	.byte	0xc
	.long	0x688
	.uleb128 0x2
	.byte	0xa
	.byte	0x47
	.byte	0xc
	.long	0x6a9
	.uleb128 0x2
	.byte	0xa
	.byte	0x48
	.byte	0xc
	.long	0x6dc
	.uleb128 0x2
	.byte	0xa
	.byte	0x4a
	.byte	0xc
	.long	0x6e9
	.uleb128 0x2
	.byte	0xa
	.byte	0x4b
	.byte	0xc
	.long	0x6fa
	.uleb128 0x2
	.byte	0xa
	.byte	0x4c
	.byte	0xc
	.long	0x71a
	.uleb128 0x2
	.byte	0xa
	.byte	0x4d
	.byte	0xc
	.long	0x73a
	.uleb128 0x2
	.byte	0xa
	.byte	0x4e
	.byte	0xc
	.long	0x75a
	.uleb128 0x2
	.byte	0xa
	.byte	0x50
	.byte	0xc
	.long	0x771
	.uleb128 0x2
	.byte	0xa
	.byte	0x51
	.byte	0xc
	.long	0x797
	.uleb128 0x2c
	.long	.LASF1701
	.byte	0x7
	.byte	0x4
	.long	0x45
	.byte	0x12
	.byte	0x12
	.byte	0xf
	.long	0x9e3
	.uleb128 0xe
	.long	.LASF1646
	.byte	0x1
	.uleb128 0xe
	.long	.LASF1647
	.byte	0x2
	.uleb128 0xe
	.long	.LASF1648
	.byte	0x4
	.uleb128 0xe
	.long	.LASF1649
	.byte	0x8
	.uleb128 0xe
	.long	.LASF1650
	.byte	0x10
	.byte	0
	.uleb128 0x2d
	.long	.LASF1702
	.uleb128 0x9
	.long	.LASF1651
	.byte	0x47
	.byte	0xe
	.long	0x2a1
	.uleb128 0x9
	.byte	0x3
	.quad	_ZL8LOG_FILE
	.uleb128 0x9
	.long	.LASF1652
	.byte	0x49
	.byte	0x11
	.long	0x45
	.uleb128 0x9
	.byte	0x3
	.quad	_ZL9LOG_LEVEL
	.uleb128 0x9
	.long	.LASF1653
	.byte	0x4b
	.byte	0xe
	.long	0xa8
	.uleb128 0x9
	.byte	0x3
	.quad	_ZL13LOG_FILE_NAME
	.uleb128 0x9
	.long	.LASF1654
	.byte	0x4d
	.byte	0xf
	.long	0x32
	.uleb128 0x9
	.byte	0x3
	.quad	_ZL17MAX_LOG_FILE_SIZE
	.uleb128 0xf
	.long	.LASF1655
	.byte	0xb
	.byte	0xe2
	.byte	0xe
	.long	.LASF1655
	.long	0xa8
	.long	0xa5b
	.uleb128 0x1
	.long	0xa8
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x5
	.long	.LASF1656
	.byte	0xc
	.byte	0x74
	.byte	0xc
	.long	0x6a
	.long	0xa71
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x5
	.long	.LASF1657
	.byte	0xc
	.byte	0x71
	.byte	0xc
	.long	0x6a
	.long	0xa87
	.uleb128 0x1
	.long	0x6a
	.byte	0
	.uleb128 0x8
	.long	.LASF1658
	.byte	0xd
	.value	0x15e
	.byte	0xc
	.long	0x6a
	.long	0xaa4
	.uleb128 0x1
	.long	0x2a1
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x5
	.long	.LASF1659
	.byte	0xb
	.byte	0xbb
	.byte	0xe
	.long	0xa8
	.long	0xaba
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0xf
	.long	.LASF1660
	.byte	0xe
	.byte	0x20
	.byte	0x8
	.long	.LASF1661
	.long	0x32
	.long	0xad4
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x14
	.long	.LASF1327
	.value	0x22b
	.long	0xae5
	.uleb128 0x1
	.long	0x4c
	.byte	0
	.uleb128 0x5
	.long	.LASF1662
	.byte	0xd
	.byte	0xb2
	.byte	0xc
	.long	0x6a
	.long	0xafb
	.uleb128 0x1
	.long	0x2a1
	.byte	0
	.uleb128 0xf
	.long	.LASF1663
	.byte	0xe
	.byte	0x1b
	.byte	0x5
	.long	.LASF1664
	.long	0x6a
	.long	0xb15
	.uleb128 0x1
	.long	0x3a1
	.byte	0
	.uleb128 0x5
	.long	.LASF1665
	.byte	0xf
	.byte	0xb7
	.byte	0xe
	.long	0xa8
	.long	0xb2b
	.uleb128 0x1
	.long	0xb2b
	.byte	0
	.uleb128 0x7
	.long	0x36f
	.uleb128 0x5
	.long	.LASF1666
	.byte	0xf
	.byte	0x4c
	.byte	0xf
	.long	0x363
	.long	0xb46
	.uleb128 0x1
	.long	0xb46
	.byte	0
	.uleb128 0x7
	.long	0x363
	.uleb128 0x8
	.long	.LASF1667
	.byte	0xd
	.value	0x14c
	.byte	0xc
	.long	0x6a
	.long	0xb71
	.uleb128 0x1
	.long	0x2a1
	.uleb128 0x1
	.long	0xa8
	.uleb128 0x1
	.long	0x6a
	.uleb128 0x1
	.long	0x32
	.byte	0
	.uleb128 0x8
	.long	.LASF1668
	.byte	0xd
	.value	0x102
	.byte	0xe
	.long	0x2a1
	.long	0xb8d
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x8
	.long	.LASF1669
	.byte	0x10
	.value	0x185
	.byte	0xc
	.long	0x6a
	.long	0xba9
	.uleb128 0x1
	.long	0x29c
	.uleb128 0x1
	.long	0x78
	.byte	0
	.uleb128 0xf
	.long	.LASF1670
	.byte	0xe
	.byte	0x25
	.byte	0x5
	.long	.LASF1671
	.long	0x6a
	.long	0xbc3
	.uleb128 0x1
	.long	0x29c
	.byte	0
	.uleb128 0x2f
	.long	.LASF1703
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x30
	.long	.LASF1704
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xc14
	.uleb128 0x4
	.long	.LASF1672
	.value	0x1e1
	.byte	0x1
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.long	.LASF1673
	.value	0x1e1
	.byte	0x1
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x31
	.long	.LASF1689
	.byte	0x1
	.value	0x1d4
	.byte	0x14
	.long	0x29c
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xc66
	.uleb128 0x32
	.string	"now"
	.byte	0x1
	.value	0x1d6
	.byte	0xa
	.long	0x363
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF1674
	.value	0x1da
	.byte	0x9
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF1675
	.value	0x1dc
	.byte	0x9
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x33
	.long	.LASF1705
	.byte	0x1
	.value	0x1c2
	.byte	0xc
	.long	0x6a
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF1683
	.value	0x18b
	.long	.LASF1684
	.long	0x6a
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xd24
	.uleb128 0x4
	.long	.LASF1676
	.value	0x18b
	.byte	0x1b
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x4
	.long	.LASF1677
	.value	0x18b
	.byte	0x2e
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x4
	.long	.LASF1678
	.value	0x18b
	.byte	0x41
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF1679
	.value	0x18c
	.byte	0x1e
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF1680
	.value	0x18c
	.byte	0x34
	.long	0x29c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.long	.LASF1681
	.value	0x18c
	.byte	0x46
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF1682
	.value	0x19a
	.byte	0x9
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF1674
	.value	0x19f
	.byte	0xf
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF1683
	.value	0x15c
	.long	.LASF1685
	.long	0x6a
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xdc3
	.uleb128 0x4
	.long	.LASF1676
	.value	0x15c
	.byte	0x1b
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x4
	.long	.LASF1677
	.value	0x15c
	.byte	0x2e
	.long	0x3a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x4
	.long	.LASF1678
	.value	0x15c
	.byte	0x41
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF1679
	.value	0x15d
	.byte	0x1e
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF1680
	.value	0x15d
	.byte	0x34
	.long	0x29c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.long	.LASF1681
	.value	0x15d
	.byte	0x46
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF1682
	.value	0x16f
	.byte	0x9
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF1674
	.value	0x174
	.byte	0xf
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF1683
	.value	0x12c
	.long	.LASF1686
	.long	0x6a
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xe62
	.uleb128 0x4
	.long	.LASF1676
	.value	0x12c
	.byte	0x1b
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x4
	.long	.LASF1677
	.value	0x12c
	.byte	0x27
	.long	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.long	.LASF1678
	.value	0x12c
	.byte	0x3a
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x4
	.long	.LASF1679
	.value	0x12d
	.byte	0x1e
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF1680
	.value	0x12d
	.byte	0x34
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF1681
	.value	0x12d
	.byte	0x46
	.long	0x6a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xc
	.long	.LASF1682
	.value	0x140
	.byte	0x9
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF1674
	.value	0x145
	.byte	0xf
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF1683
	.byte	0xfd
	.byte	0x5
	.long	.LASF1687
	.long	0x6a
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xefb
	.uleb128 0xa
	.long	.LASF1676
	.byte	0xfd
	.byte	0x1b
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF1677
	.byte	0xfd
	.byte	0x29
	.long	0x2bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xa
	.long	.LASF1678
	.byte	0xfd
	.byte	0x3c
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.long	.LASF1679
	.byte	0xfe
	.byte	0x1e
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xa
	.long	.LASF1680
	.byte	0xfe
	.byte	0x34
	.long	0x29c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xa
	.long	.LASF1681
	.byte	0xfe
	.byte	0x46
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF1682
	.value	0x110
	.byte	0x9
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF1674
	.value	0x115
	.byte	0xf
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF1683
	.byte	0xcd
	.byte	0x5
	.long	.LASF1688
	.long	0x6a
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0xf92
	.uleb128 0xa
	.long	.LASF1676
	.byte	0xcd
	.byte	0x1b
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF1677
	.byte	0xcd
	.byte	0x2c
	.long	0x350
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xa
	.long	.LASF1678
	.byte	0xcd
	.byte	0x3f
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.long	.LASF1679
	.byte	0xce
	.byte	0x1e
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xa
	.long	.LASF1680
	.byte	0xce
	.byte	0x34
	.long	0x29c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xa
	.long	.LASF1681
	.byte	0xce
	.byte	0x46
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF1682
	.byte	0xe0
	.byte	0x9
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF1674
	.byte	0xe5
	.byte	0xf
	.long	0x29c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x34
	.long	.LASF1690
	.byte	0x1
	.byte	0xac
	.byte	0x7
	.long	0xa8
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0xff1
	.uleb128 0x35
	.string	"now"
	.byte	0x1
	.byte	0xb0
	.byte	0xa
	.long	0x363
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF1674
	.byte	0xb2
	.byte	0x9
	.long	0xa8
	.uleb128 0x17
	.long	.LASF1691
	.byte	0xb8
	.byte	0xa
	.long	0x32
	.uleb128 0x17
	.long	.LASF1692
	.byte	0xbe
	.byte	0x9
	.long	0xa8
	.uleb128 0x36
	.uleb128 0x37
	.string	"i"
	.byte	0x1
	.byte	0xb4
	.byte	0xc
	.long	0x6a
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	.LASF1693
	.byte	0x8b
	.byte	0x7
	.long	.LASF1694
	.long	0x2a1
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x109b
	.uleb128 0x9
	.long	.LASF1695
	.byte	0x8d
	.byte	0x7
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF1696
	.byte	0x8f
	.byte	0x7
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x1056
	.uleb128 0x9
	.long	.LASF1697
	.byte	0x95
	.byte	0x90
	.long	0x363
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x107a
	.uleb128 0x9
	.long	.LASF1697
	.byte	0x9f
	.byte	0x8c
	.long	0x363
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x9
	.long	.LASF1697
	.byte	0xa6
	.byte	0x8c
	.long	0x363
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x38
	.long	.LASF1706
	.byte	0x1
	.byte	0x78
	.byte	0xd
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x39
	.long	.LASF1707
	.byte	0x1
	.byte	0x4f
	.byte	0x11
	.long	0x45
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.long	.LASF1676
	.byte	0x61
	.byte	0xc
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x9
	.long	.LASF1697
	.byte	0x5f
	.byte	0x88
	.long	0x363
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x79
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x3b
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x5
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0
	.long	.LASF2
	.byte	0x5
	.uleb128 0
	.long	.LASF3
	.byte	0x5
	.uleb128 0
	.long	.LASF4
	.byte	0x5
	.uleb128 0
	.long	.LASF5
	.byte	0x5
	.uleb128 0
	.long	.LASF6
	.byte	0x5
	.uleb128 0
	.long	.LASF7
	.byte	0x5
	.uleb128 0
	.long	.LASF8
	.byte	0x5
	.uleb128 0
	.long	.LASF9
	.byte	0x5
	.uleb128 0
	.long	.LASF10
	.byte	0x5
	.uleb128 0
	.long	.LASF11
	.byte	0x5
	.uleb128 0
	.long	.LASF12
	.byte	0x5
	.uleb128 0
	.long	.LASF13
	.byte	0x5
	.uleb128 0
	.long	.LASF14
	.byte	0x5
	.uleb128 0
	.long	.LASF15
	.byte	0x5
	.uleb128 0
	.long	.LASF16
	.byte	0x5
	.uleb128 0
	.long	.LASF17
	.byte	0x5
	.uleb128 0
	.long	.LASF18
	.byte	0x5
	.uleb128 0
	.long	.LASF19
	.byte	0x5
	.uleb128 0
	.long	.LASF20
	.byte	0x5
	.uleb128 0
	.long	.LASF21
	.byte	0x5
	.uleb128 0
	.long	.LASF22
	.byte	0x5
	.uleb128 0
	.long	.LASF23
	.byte	0x5
	.uleb128 0
	.long	.LASF24
	.byte	0x5
	.uleb128 0
	.long	.LASF25
	.byte	0x5
	.uleb128 0
	.long	.LASF26
	.byte	0x5
	.uleb128 0
	.long	.LASF27
	.byte	0x5
	.uleb128 0
	.long	.LASF28
	.byte	0x5
	.uleb128 0
	.long	.LASF29
	.byte	0x5
	.uleb128 0
	.long	.LASF30
	.byte	0x5
	.uleb128 0
	.long	.LASF31
	.byte	0x5
	.uleb128 0
	.long	.LASF32
	.byte	0x5
	.uleb128 0
	.long	.LASF33
	.byte	0x5
	.uleb128 0
	.long	.LASF34
	.byte	0x5
	.uleb128 0
	.long	.LASF35
	.byte	0x5
	.uleb128 0
	.long	.LASF36
	.byte	0x5
	.uleb128 0
	.long	.LASF37
	.byte	0x5
	.uleb128 0
	.long	.LASF38
	.byte	0x5
	.uleb128 0
	.long	.LASF39
	.byte	0x5
	.uleb128 0
	.long	.LASF40
	.byte	0x5
	.uleb128 0
	.long	.LASF41
	.byte	0x5
	.uleb128 0
	.long	.LASF42
	.byte	0x5
	.uleb128 0
	.long	.LASF43
	.byte	0x5
	.uleb128 0
	.long	.LASF44
	.byte	0x5
	.uleb128 0
	.long	.LASF45
	.byte	0x5
	.uleb128 0
	.long	.LASF46
	.byte	0x5
	.uleb128 0
	.long	.LASF47
	.byte	0x5
	.uleb128 0
	.long	.LASF48
	.byte	0x5
	.uleb128 0
	.long	.LASF49
	.byte	0x5
	.uleb128 0
	.long	.LASF50
	.byte	0x5
	.uleb128 0
	.long	.LASF51
	.byte	0x5
	.uleb128 0
	.long	.LASF52
	.byte	0x5
	.uleb128 0
	.long	.LASF53
	.byte	0x5
	.uleb128 0
	.long	.LASF54
	.byte	0x5
	.uleb128 0
	.long	.LASF55
	.byte	0x5
	.uleb128 0
	.long	.LASF56
	.byte	0x5
	.uleb128 0
	.long	.LASF57
	.byte	0x5
	.uleb128 0
	.long	.LASF58
	.byte	0x5
	.uleb128 0
	.long	.LASF59
	.byte	0x5
	.uleb128 0
	.long	.LASF60
	.byte	0x5
	.uleb128 0
	.long	.LASF61
	.byte	0x5
	.uleb128 0
	.long	.LASF62
	.byte	0x5
	.uleb128 0
	.long	.LASF63
	.byte	0x5
	.uleb128 0
	.long	.LASF64
	.byte	0x5
	.uleb128 0
	.long	.LASF65
	.byte	0x5
	.uleb128 0
	.long	.LASF66
	.byte	0x5
	.uleb128 0
	.long	.LASF67
	.byte	0x5
	.uleb128 0
	.long	.LASF68
	.byte	0x5
	.uleb128 0
	.long	.LASF69
	.byte	0x5
	.uleb128 0
	.long	.LASF70
	.byte	0x5
	.uleb128 0
	.long	.LASF71
	.byte	0x5
	.uleb128 0
	.long	.LASF72
	.byte	0x5
	.uleb128 0
	.long	.LASF73
	.byte	0x5
	.uleb128 0
	.long	.LASF74
	.byte	0x5
	.uleb128 0
	.long	.LASF75
	.byte	0x5
	.uleb128 0
	.long	.LASF76
	.byte	0x5
	.uleb128 0
	.long	.LASF77
	.byte	0x5
	.uleb128 0
	.long	.LASF78
	.byte	0x5
	.uleb128 0
	.long	.LASF79
	.byte	0x5
	.uleb128 0
	.long	.LASF80
	.byte	0x5
	.uleb128 0
	.long	.LASF81
	.byte	0x5
	.uleb128 0
	.long	.LASF82
	.byte	0x5
	.uleb128 0
	.long	.LASF83
	.byte	0x5
	.uleb128 0
	.long	.LASF84
	.byte	0x5
	.uleb128 0
	.long	.LASF85
	.byte	0x5
	.uleb128 0
	.long	.LASF86
	.byte	0x5
	.uleb128 0
	.long	.LASF87
	.byte	0x5
	.uleb128 0
	.long	.LASF88
	.byte	0x5
	.uleb128 0
	.long	.LASF89
	.byte	0x5
	.uleb128 0
	.long	.LASF90
	.byte	0x5
	.uleb128 0
	.long	.LASF91
	.byte	0x5
	.uleb128 0
	.long	.LASF92
	.byte	0x5
	.uleb128 0
	.long	.LASF93
	.byte	0x5
	.uleb128 0
	.long	.LASF94
	.byte	0x5
	.uleb128 0
	.long	.LASF95
	.byte	0x5
	.uleb128 0
	.long	.LASF96
	.byte	0x5
	.uleb128 0
	.long	.LASF97
	.byte	0x5
	.uleb128 0
	.long	.LASF98
	.byte	0x5
	.uleb128 0
	.long	.LASF99
	.byte	0x5
	.uleb128 0
	.long	.LASF100
	.byte	0x5
	.uleb128 0
	.long	.LASF101
	.byte	0x5
	.uleb128 0
	.long	.LASF102
	.byte	0x5
	.uleb128 0
	.long	.LASF103
	.byte	0x5
	.uleb128 0
	.long	.LASF104
	.byte	0x5
	.uleb128 0
	.long	.LASF105
	.byte	0x5
	.uleb128 0
	.long	.LASF106
	.byte	0x5
	.uleb128 0
	.long	.LASF107
	.byte	0x5
	.uleb128 0
	.long	.LASF108
	.byte	0x5
	.uleb128 0
	.long	.LASF109
	.byte	0x5
	.uleb128 0
	.long	.LASF110
	.byte	0x5
	.uleb128 0
	.long	.LASF111
	.byte	0x5
	.uleb128 0
	.long	.LASF112
	.byte	0x5
	.uleb128 0
	.long	.LASF113
	.byte	0x5
	.uleb128 0
	.long	.LASF114
	.byte	0x5
	.uleb128 0
	.long	.LASF115
	.byte	0x5
	.uleb128 0
	.long	.LASF116
	.byte	0x5
	.uleb128 0
	.long	.LASF117
	.byte	0x5
	.uleb128 0
	.long	.LASF118
	.byte	0x5
	.uleb128 0
	.long	.LASF119
	.byte	0x5
	.uleb128 0
	.long	.LASF120
	.byte	0x5
	.uleb128 0
	.long	.LASF121
	.byte	0x5
	.uleb128 0
	.long	.LASF122
	.byte	0x5
	.uleb128 0
	.long	.LASF123
	.byte	0x5
	.uleb128 0
	.long	.LASF124
	.byte	0x5
	.uleb128 0
	.long	.LASF125
	.byte	0x5
	.uleb128 0
	.long	.LASF126
	.byte	0x5
	.uleb128 0
	.long	.LASF127
	.byte	0x5
	.uleb128 0
	.long	.LASF128
	.byte	0x5
	.uleb128 0
	.long	.LASF129
	.byte	0x5
	.uleb128 0
	.long	.LASF130
	.byte	0x5
	.uleb128 0
	.long	.LASF131
	.byte	0x5
	.uleb128 0
	.long	.LASF132
	.byte	0x5
	.uleb128 0
	.long	.LASF133
	.byte	0x5
	.uleb128 0
	.long	.LASF134
	.byte	0x5
	.uleb128 0
	.long	.LASF135
	.byte	0x5
	.uleb128 0
	.long	.LASF136
	.byte	0x5
	.uleb128 0
	.long	.LASF137
	.byte	0x5
	.uleb128 0
	.long	.LASF138
	.byte	0x5
	.uleb128 0
	.long	.LASF139
	.byte	0x5
	.uleb128 0
	.long	.LASF140
	.byte	0x5
	.uleb128 0
	.long	.LASF141
	.byte	0x5
	.uleb128 0
	.long	.LASF142
	.byte	0x5
	.uleb128 0
	.long	.LASF143
	.byte	0x5
	.uleb128 0
	.long	.LASF144
	.byte	0x5
	.uleb128 0
	.long	.LASF145
	.byte	0x5
	.uleb128 0
	.long	.LASF146
	.byte	0x5
	.uleb128 0
	.long	.LASF147
	.byte	0x5
	.uleb128 0
	.long	.LASF148
	.byte	0x5
	.uleb128 0
	.long	.LASF149
	.byte	0x5
	.uleb128 0
	.long	.LASF150
	.byte	0x5
	.uleb128 0
	.long	.LASF151
	.byte	0x5
	.uleb128 0
	.long	.LASF152
	.byte	0x5
	.uleb128 0
	.long	.LASF153
	.byte	0x5
	.uleb128 0
	.long	.LASF154
	.byte	0x5
	.uleb128 0
	.long	.LASF155
	.byte	0x5
	.uleb128 0
	.long	.LASF156
	.byte	0x5
	.uleb128 0
	.long	.LASF157
	.byte	0x5
	.uleb128 0
	.long	.LASF158
	.byte	0x5
	.uleb128 0
	.long	.LASF159
	.byte	0x5
	.uleb128 0
	.long	.LASF160
	.byte	0x5
	.uleb128 0
	.long	.LASF161
	.byte	0x5
	.uleb128 0
	.long	.LASF162
	.byte	0x5
	.uleb128 0
	.long	.LASF163
	.byte	0x5
	.uleb128 0
	.long	.LASF164
	.byte	0x5
	.uleb128 0
	.long	.LASF165
	.byte	0x5
	.uleb128 0
	.long	.LASF166
	.byte	0x5
	.uleb128 0
	.long	.LASF167
	.byte	0x5
	.uleb128 0
	.long	.LASF168
	.byte	0x5
	.uleb128 0
	.long	.LASF169
	.byte	0x5
	.uleb128 0
	.long	.LASF170
	.byte	0x5
	.uleb128 0
	.long	.LASF171
	.byte	0x5
	.uleb128 0
	.long	.LASF172
	.byte	0x5
	.uleb128 0
	.long	.LASF173
	.byte	0x5
	.uleb128 0
	.long	.LASF174
	.byte	0x5
	.uleb128 0
	.long	.LASF175
	.byte	0x5
	.uleb128 0
	.long	.LASF176
	.byte	0x5
	.uleb128 0
	.long	.LASF177
	.byte	0x5
	.uleb128 0
	.long	.LASF178
	.byte	0x5
	.uleb128 0
	.long	.LASF179
	.byte	0x5
	.uleb128 0
	.long	.LASF180
	.byte	0x5
	.uleb128 0
	.long	.LASF181
	.byte	0x5
	.uleb128 0
	.long	.LASF182
	.byte	0x5
	.uleb128 0
	.long	.LASF183
	.byte	0x5
	.uleb128 0
	.long	.LASF184
	.byte	0x5
	.uleb128 0
	.long	.LASF185
	.byte	0x5
	.uleb128 0
	.long	.LASF186
	.byte	0x5
	.uleb128 0
	.long	.LASF187
	.byte	0x5
	.uleb128 0
	.long	.LASF188
	.byte	0x5
	.uleb128 0
	.long	.LASF189
	.byte	0x5
	.uleb128 0
	.long	.LASF190
	.byte	0x5
	.uleb128 0
	.long	.LASF191
	.byte	0x5
	.uleb128 0
	.long	.LASF192
	.byte	0x5
	.uleb128 0
	.long	.LASF193
	.byte	0x5
	.uleb128 0
	.long	.LASF194
	.byte	0x5
	.uleb128 0
	.long	.LASF195
	.byte	0x5
	.uleb128 0
	.long	.LASF196
	.byte	0x5
	.uleb128 0
	.long	.LASF197
	.byte	0x5
	.uleb128 0
	.long	.LASF198
	.byte	0x5
	.uleb128 0
	.long	.LASF199
	.byte	0x5
	.uleb128 0
	.long	.LASF200
	.byte	0x5
	.uleb128 0
	.long	.LASF201
	.byte	0x5
	.uleb128 0
	.long	.LASF202
	.byte	0x5
	.uleb128 0
	.long	.LASF203
	.byte	0x5
	.uleb128 0
	.long	.LASF204
	.byte	0x5
	.uleb128 0
	.long	.LASF205
	.byte	0x5
	.uleb128 0
	.long	.LASF206
	.byte	0x5
	.uleb128 0
	.long	.LASF207
	.byte	0x5
	.uleb128 0
	.long	.LASF208
	.byte	0x5
	.uleb128 0
	.long	.LASF209
	.byte	0x5
	.uleb128 0
	.long	.LASF210
	.byte	0x5
	.uleb128 0
	.long	.LASF211
	.byte	0x5
	.uleb128 0
	.long	.LASF212
	.byte	0x5
	.uleb128 0
	.long	.LASF213
	.byte	0x5
	.uleb128 0
	.long	.LASF214
	.byte	0x5
	.uleb128 0
	.long	.LASF215
	.byte	0x5
	.uleb128 0
	.long	.LASF216
	.byte	0x5
	.uleb128 0
	.long	.LASF217
	.byte	0x5
	.uleb128 0
	.long	.LASF218
	.byte	0x5
	.uleb128 0
	.long	.LASF219
	.byte	0x5
	.uleb128 0
	.long	.LASF220
	.byte	0x5
	.uleb128 0
	.long	.LASF221
	.byte	0x5
	.uleb128 0
	.long	.LASF222
	.byte	0x5
	.uleb128 0
	.long	.LASF223
	.byte	0x5
	.uleb128 0
	.long	.LASF224
	.byte	0x5
	.uleb128 0
	.long	.LASF225
	.byte	0x5
	.uleb128 0
	.long	.LASF226
	.byte	0x5
	.uleb128 0
	.long	.LASF227
	.byte	0x5
	.uleb128 0
	.long	.LASF228
	.byte	0x5
	.uleb128 0
	.long	.LASF229
	.byte	0x5
	.uleb128 0
	.long	.LASF230
	.byte	0x5
	.uleb128 0
	.long	.LASF231
	.byte	0x5
	.uleb128 0
	.long	.LASF232
	.byte	0x5
	.uleb128 0
	.long	.LASF233
	.byte	0x5
	.uleb128 0
	.long	.LASF234
	.byte	0x5
	.uleb128 0
	.long	.LASF235
	.byte	0x5
	.uleb128 0
	.long	.LASF236
	.byte	0x5
	.uleb128 0
	.long	.LASF237
	.byte	0x5
	.uleb128 0
	.long	.LASF238
	.byte	0x5
	.uleb128 0
	.long	.LASF239
	.byte	0x5
	.uleb128 0
	.long	.LASF240
	.byte	0x5
	.uleb128 0
	.long	.LASF241
	.byte	0x5
	.uleb128 0
	.long	.LASF242
	.byte	0x5
	.uleb128 0
	.long	.LASF243
	.byte	0x5
	.uleb128 0
	.long	.LASF244
	.byte	0x5
	.uleb128 0
	.long	.LASF245
	.byte	0x5
	.uleb128 0
	.long	.LASF246
	.byte	0x5
	.uleb128 0
	.long	.LASF247
	.byte	0x5
	.uleb128 0
	.long	.LASF248
	.byte	0x5
	.uleb128 0
	.long	.LASF249
	.byte	0x5
	.uleb128 0
	.long	.LASF250
	.byte	0x5
	.uleb128 0
	.long	.LASF251
	.byte	0x5
	.uleb128 0
	.long	.LASF252
	.byte	0x5
	.uleb128 0
	.long	.LASF253
	.byte	0x5
	.uleb128 0
	.long	.LASF254
	.byte	0x5
	.uleb128 0
	.long	.LASF255
	.byte	0x5
	.uleb128 0
	.long	.LASF256
	.byte	0x5
	.uleb128 0
	.long	.LASF257
	.byte	0x5
	.uleb128 0
	.long	.LASF258
	.byte	0x5
	.uleb128 0
	.long	.LASF259
	.byte	0x5
	.uleb128 0
	.long	.LASF260
	.byte	0x5
	.uleb128 0
	.long	.LASF261
	.byte	0x5
	.uleb128 0
	.long	.LASF262
	.byte	0x5
	.uleb128 0
	.long	.LASF263
	.byte	0x5
	.uleb128 0
	.long	.LASF264
	.byte	0x5
	.uleb128 0
	.long	.LASF265
	.byte	0x5
	.uleb128 0
	.long	.LASF266
	.byte	0x5
	.uleb128 0
	.long	.LASF267
	.byte	0x5
	.uleb128 0
	.long	.LASF268
	.byte	0x5
	.uleb128 0
	.long	.LASF269
	.byte	0x5
	.uleb128 0
	.long	.LASF270
	.byte	0x5
	.uleb128 0
	.long	.LASF271
	.byte	0x5
	.uleb128 0
	.long	.LASF272
	.byte	0x5
	.uleb128 0
	.long	.LASF273
	.byte	0x5
	.uleb128 0
	.long	.LASF274
	.byte	0x5
	.uleb128 0
	.long	.LASF275
	.byte	0x5
	.uleb128 0
	.long	.LASF276
	.byte	0x5
	.uleb128 0
	.long	.LASF277
	.byte	0x5
	.uleb128 0
	.long	.LASF278
	.byte	0x5
	.uleb128 0
	.long	.LASF279
	.byte	0x5
	.uleb128 0
	.long	.LASF280
	.byte	0x5
	.uleb128 0
	.long	.LASF281
	.byte	0x5
	.uleb128 0
	.long	.LASF282
	.byte	0x5
	.uleb128 0
	.long	.LASF283
	.byte	0x5
	.uleb128 0
	.long	.LASF284
	.byte	0x5
	.uleb128 0
	.long	.LASF285
	.byte	0x5
	.uleb128 0
	.long	.LASF286
	.byte	0x5
	.uleb128 0
	.long	.LASF287
	.byte	0x5
	.uleb128 0
	.long	.LASF288
	.byte	0x5
	.uleb128 0
	.long	.LASF289
	.byte	0x5
	.uleb128 0
	.long	.LASF290
	.byte	0x5
	.uleb128 0
	.long	.LASF291
	.byte	0x5
	.uleb128 0
	.long	.LASF292
	.byte	0x5
	.uleb128 0
	.long	.LASF293
	.byte	0x5
	.uleb128 0
	.long	.LASF294
	.byte	0x5
	.uleb128 0
	.long	.LASF295
	.byte	0x5
	.uleb128 0
	.long	.LASF296
	.byte	0x5
	.uleb128 0
	.long	.LASF297
	.byte	0x5
	.uleb128 0
	.long	.LASF298
	.byte	0x5
	.uleb128 0
	.long	.LASF299
	.byte	0x5
	.uleb128 0
	.long	.LASF300
	.byte	0x5
	.uleb128 0
	.long	.LASF301
	.byte	0x5
	.uleb128 0
	.long	.LASF302
	.byte	0x5
	.uleb128 0
	.long	.LASF303
	.byte	0x5
	.uleb128 0
	.long	.LASF304
	.byte	0x5
	.uleb128 0
	.long	.LASF305
	.byte	0x5
	.uleb128 0
	.long	.LASF306
	.byte	0x5
	.uleb128 0
	.long	.LASF307
	.byte	0x5
	.uleb128 0
	.long	.LASF308
	.byte	0x5
	.uleb128 0
	.long	.LASF309
	.byte	0x5
	.uleb128 0
	.long	.LASF310
	.byte	0x5
	.uleb128 0
	.long	.LASF311
	.byte	0x5
	.uleb128 0
	.long	.LASF312
	.byte	0x5
	.uleb128 0
	.long	.LASF313
	.byte	0x5
	.uleb128 0
	.long	.LASF314
	.byte	0x5
	.uleb128 0
	.long	.LASF315
	.byte	0x5
	.uleb128 0
	.long	.LASF316
	.byte	0x5
	.uleb128 0
	.long	.LASF317
	.byte	0x5
	.uleb128 0
	.long	.LASF318
	.byte	0x5
	.uleb128 0
	.long	.LASF319
	.byte	0x5
	.uleb128 0
	.long	.LASF320
	.byte	0x5
	.uleb128 0
	.long	.LASF321
	.byte	0x5
	.uleb128 0
	.long	.LASF322
	.byte	0x5
	.uleb128 0
	.long	.LASF323
	.byte	0x5
	.uleb128 0
	.long	.LASF324
	.byte	0x5
	.uleb128 0
	.long	.LASF325
	.byte	0x5
	.uleb128 0
	.long	.LASF326
	.byte	0x5
	.uleb128 0
	.long	.LASF327
	.byte	0x5
	.uleb128 0
	.long	.LASF328
	.byte	0x5
	.uleb128 0
	.long	.LASF329
	.byte	0x5
	.uleb128 0
	.long	.LASF330
	.byte	0x5
	.uleb128 0
	.long	.LASF331
	.byte	0x5
	.uleb128 0
	.long	.LASF332
	.byte	0x5
	.uleb128 0
	.long	.LASF333
	.byte	0x5
	.uleb128 0
	.long	.LASF334
	.byte	0x5
	.uleb128 0
	.long	.LASF335
	.byte	0x5
	.uleb128 0
	.long	.LASF336
	.byte	0x5
	.uleb128 0
	.long	.LASF337
	.byte	0x5
	.uleb128 0
	.long	.LASF338
	.byte	0x5
	.uleb128 0
	.long	.LASF339
	.byte	0x5
	.uleb128 0
	.long	.LASF340
	.byte	0x5
	.uleb128 0
	.long	.LASF341
	.byte	0x5
	.uleb128 0
	.long	.LASF342
	.byte	0x5
	.uleb128 0
	.long	.LASF343
	.byte	0x5
	.uleb128 0
	.long	.LASF344
	.byte	0x5
	.uleb128 0
	.long	.LASF345
	.byte	0x5
	.uleb128 0
	.long	.LASF346
	.byte	0x5
	.uleb128 0
	.long	.LASF347
	.byte	0x5
	.uleb128 0
	.long	.LASF348
	.byte	0x5
	.uleb128 0
	.long	.LASF349
	.byte	0x5
	.uleb128 0
	.long	.LASF350
	.byte	0x5
	.uleb128 0
	.long	.LASF351
	.byte	0x5
	.uleb128 0
	.long	.LASF352
	.byte	0x5
	.uleb128 0
	.long	.LASF353
	.byte	0x5
	.uleb128 0
	.long	.LASF354
	.byte	0x5
	.uleb128 0
	.long	.LASF355
	.byte	0x5
	.uleb128 0
	.long	.LASF356
	.byte	0x5
	.uleb128 0
	.long	.LASF357
	.byte	0x5
	.uleb128 0
	.long	.LASF358
	.byte	0x5
	.uleb128 0
	.long	.LASF359
	.byte	0x5
	.uleb128 0
	.long	.LASF360
	.byte	0x5
	.uleb128 0
	.long	.LASF361
	.byte	0x5
	.uleb128 0
	.long	.LASF362
	.byte	0x5
	.uleb128 0
	.long	.LASF363
	.byte	0x5
	.uleb128 0
	.long	.LASF364
	.byte	0x5
	.uleb128 0
	.long	.LASF365
	.byte	0x5
	.uleb128 0
	.long	.LASF366
	.byte	0x5
	.uleb128 0
	.long	.LASF367
	.byte	0x5
	.uleb128 0
	.long	.LASF368
	.byte	0x5
	.uleb128 0
	.long	.LASF369
	.byte	0x5
	.uleb128 0
	.long	.LASF370
	.byte	0x5
	.uleb128 0
	.long	.LASF371
	.byte	0x5
	.uleb128 0
	.long	.LASF372
	.byte	0x5
	.uleb128 0
	.long	.LASF373
	.byte	0x5
	.uleb128 0
	.long	.LASF374
	.byte	0x5
	.uleb128 0
	.long	.LASF375
	.byte	0x5
	.uleb128 0
	.long	.LASF376
	.byte	0x5
	.uleb128 0
	.long	.LASF377
	.byte	0x5
	.uleb128 0
	.long	.LASF378
	.byte	0x5
	.uleb128 0
	.long	.LASF379
	.byte	0x5
	.uleb128 0
	.long	.LASF380
	.byte	0x5
	.uleb128 0
	.long	.LASF381
	.byte	0x5
	.uleb128 0
	.long	.LASF382
	.byte	0x5
	.uleb128 0
	.long	.LASF383
	.byte	0x5
	.uleb128 0
	.long	.LASF384
	.byte	0x5
	.uleb128 0
	.long	.LASF385
	.byte	0x5
	.uleb128 0
	.long	.LASF386
	.byte	0x5
	.uleb128 0
	.long	.LASF387
	.byte	0x5
	.uleb128 0
	.long	.LASF388
	.byte	0x5
	.uleb128 0
	.long	.LASF389
	.byte	0x5
	.uleb128 0
	.long	.LASF390
	.byte	0x5
	.uleb128 0
	.long	.LASF391
	.byte	0x5
	.uleb128 0
	.long	.LASF392
	.byte	0x5
	.uleb128 0
	.long	.LASF393
	.byte	0x5
	.uleb128 0
	.long	.LASF394
	.byte	0x5
	.uleb128 0
	.long	.LASF395
	.byte	0x5
	.uleb128 0
	.long	.LASF396
	.byte	0x5
	.uleb128 0
	.long	.LASF397
	.byte	0x5
	.uleb128 0
	.long	.LASF398
	.byte	0x5
	.uleb128 0
	.long	.LASF399
	.byte	0x5
	.uleb128 0
	.long	.LASF400
	.byte	0x5
	.uleb128 0
	.long	.LASF401
	.byte	0x5
	.uleb128 0
	.long	.LASF402
	.byte	0x5
	.uleb128 0
	.long	.LASF403
	.byte	0x5
	.uleb128 0
	.long	.LASF404
	.byte	0x5
	.uleb128 0
	.long	.LASF405
	.byte	0x5
	.uleb128 0
	.long	.LASF406
	.byte	0x5
	.uleb128 0
	.long	.LASF407
	.byte	0x5
	.uleb128 0
	.long	.LASF408
	.byte	0x5
	.uleb128 0
	.long	.LASF409
	.byte	0x5
	.uleb128 0
	.long	.LASF410
	.byte	0x5
	.uleb128 0
	.long	.LASF411
	.byte	0x5
	.uleb128 0
	.long	.LASF412
	.byte	0x5
	.uleb128 0
	.long	.LASF413
	.byte	0x5
	.uleb128 0
	.long	.LASF414
	.byte	0x5
	.uleb128 0
	.long	.LASF415
	.byte	0x5
	.uleb128 0
	.long	.LASF416
	.byte	0x5
	.uleb128 0
	.long	.LASF417
	.byte	0x5
	.uleb128 0
	.long	.LASF418
	.byte	0x5
	.uleb128 0
	.long	.LASF419
	.byte	0x5
	.uleb128 0
	.long	.LASF420
	.byte	0x5
	.uleb128 0
	.long	.LASF421
	.byte	0x5
	.uleb128 0
	.long	.LASF422
	.file 19 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x1
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro3
	.file 20 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x14
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF431
	.file 21 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro4
	.file 22 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0x16
	.file 23 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 24 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x18
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF511
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.file 25 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 26 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x15
	.long	.LASF592
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 27 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0x1b
	.file 28 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.byte	0x5
	.uleb128 0x23
	.long	.LASF655
	.file 29 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x18
	.long	.LASF658
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x18
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF511
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 30 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 31 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x1f
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF718
	.byte	0x4
	.file 32 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x20
	.byte	0x5
	.uleb128 0x2
	.long	.LASF719
	.file 33 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x2
	.long	.LASF720
	.byte	0x4
	.byte	0x4
	.file 34 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x22
	.byte	0x5
	.uleb128 0x2
	.long	.LASF721
	.byte	0x4
	.file 35 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x2
	.long	.LASF722
	.byte	0x4
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x2
	.long	.LASF723
	.byte	0x4
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.file 36 "/usr/include/x86_64-linux-gnu/bits/types/cookie_io_functions_t.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x24
	.byte	0x5
	.uleb128 0x13
	.long	.LASF732
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.file 37 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x25
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 38 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x26
	.byte	0x7
	.long	.Ldebug_macro21
	.file 39 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x27
	.byte	0x5
	.uleb128 0x15
	.long	.LASF772
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x15
	.long	.LASF592
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x5
	.uleb128 0x22
	.long	.LASF794
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x8
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro23
	.file 40 "/usr/include/x86_64-linux-gnu/c++/11/bits/os_defines.h"
	.byte	0x3
	.uleb128 0x24a
	.uleb128 0x28
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.file 41 "/usr/include/x86_64-linux-gnu/c++/11/bits/cpu_defines.h"
	.byte	0x3
	.uleb128 0x24d
	.uleb128 0x29
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF865
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.file 42 "/usr/include/c++/11/pstl/pstl_config.h"
	.byte	0x3
	.uleb128 0x309
	.uleb128 0x2a
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x3
	.uleb128 0x4b
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x19
	.long	.LASF430
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1175
	.file 43 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x2b
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.file 44 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x2c
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro34
	.file 45 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h"
	.byte	0x3
	.uleb128 0x111
	.uleb128 0x2d
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1210
	.file 46 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1211
	.byte	0x4
	.byte	0x4
	.file 47 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x18b
	.uleb128 0x2f
	.byte	0x7
	.long	.Ldebug_macro35
	.file 48 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.byte	0x3
	.uleb128 0x7e
	.uleb128 0x30
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1225
	.byte	0x4
	.file 49 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h"
	.byte	0x3
	.uleb128 0x80
	.uleb128 0x31
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1226
	.byte	0x4
	.byte	0x3
	.uleb128 0x81
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1227
	.byte	0x4
	.file 50 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h"
	.byte	0x3
	.uleb128 0x82
	.uleb128 0x32
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1228
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x3
	.uleb128 0x90
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x4
	.file 51 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.byte	0x3
	.uleb128 0x9b
	.uleb128 0x33
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1231
	.byte	0x4
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1232
	.file 52 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0xb0
	.uleb128 0x34
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1233
	.file 53 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x35
	.byte	0x7
	.long	.Ldebug_macro38
	.file 54 "/usr/include/x86_64-linux-gnu/bits/endianness.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro41
	.file 55 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x37
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.file 56 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x38
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1250
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x4
	.file 57 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xb3
	.uleb128 0x39
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1263
	.file 58 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x3a
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.file 59 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x3b
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1268
	.file 60 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x3c
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.byte	0x4
	.file 61 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x3d
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1271
	.byte	0x4
	.file 62 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x3e
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1272
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro47
	.file 63 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0xe3
	.uleb128 0x3f
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1288
	.file 64 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x40
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1289
	.file 65 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1290
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro48
	.byte	0x4
	.file 66 "/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x42
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1302
	.byte	0x4
	.file 67 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x43
	.byte	0x7
	.long	.Ldebug_macro49
	.byte	0x4
	.file 68 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x44
	.byte	0x7
	.long	.Ldebug_macro50
	.byte	0x4
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1309
	.byte	0x4
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1310
	.byte	0x4
	.byte	0x4
	.file 69 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x23e
	.uleb128 0x45
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x4
	.byte	0x5
	.uleb128 0x32f
	.long	.LASF1314
	.file 70 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ff
	.uleb128 0x46
	.byte	0x4
	.byte	0x4
	.byte	0x6
	.uleb128 0x4c
	.long	.LASF1315
	.byte	0x3
	.uleb128 0x4d
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro54
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x3
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro56
	.byte	0x4
	.file 71 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x47
	.byte	0x7
	.long	.Ldebug_macro57
	.file 72 "/usr/include/x86_64-linux-gnu/bits/timex.h"
	.byte	0x3
	.uleb128 0x49
	.uleb128 0x48
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.byte	0x4
	.file 73 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x49
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1411
	.byte	0x4
	.file 74 "/usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x4a
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1412
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro59
	.byte	0x4
	.byte	0x3
	.uleb128 0x4
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro60
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro56
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro62
	.file 75 "/usr/include/strings.h"
	.byte	0x3
	.uleb128 0x1ce
	.uleb128 0x4b
	.byte	0x7
	.long	.Ldebug_macro63
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x4
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1420
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x5
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro64
	.byte	0x4
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1429
	.file 76 "/usr/include/x86_64-linux-gnu/bits/stat.h"
	.byte	0x3
	.uleb128 0x65
	.uleb128 0x4c
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1430
	.file 77 "/usr/include/x86_64-linux-gnu/bits/struct_stat.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x4d
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro66
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro67
	.file 78 "/usr/include/x86_64-linux-gnu/bits/statx.h"
	.byte	0x3
	.uleb128 0x1d1
	.uleb128 0x4e
	.file 79 "/usr/include/linux/stat.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x4f
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1498
	.file 80 "/usr/include/linux/types.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x50
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1499
	.file 81 "/usr/include/x86_64-linux-gnu/asm/types.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x51
	.file 82 "/usr/include/asm-generic/types.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x52
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1500
	.file 83 "/usr/include/asm-generic/int-ll64.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x53
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1501
	.file 84 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x54
	.byte	0x7
	.long	.Ldebug_macro68
	.file 85 "/usr/include/asm-generic/bitsperlong.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x55
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1504
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 86 "/usr/include/linux/posix_types.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x56
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1505
	.file 87 "/usr/include/linux/stddef.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x57
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro69
	.file 88 "/usr/include/x86_64-linux-gnu/asm/posix_types.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x58
	.file 89 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x59
	.byte	0x7
	.long	.Ldebug_macro70
	.file 90 "/usr/include/asm-generic/posix_types.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x5a
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1510
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro71
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro72
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro73
	.file 91 "/usr/include/x86_64-linux-gnu/bits/statx-generic.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x5b
	.file 92 "/usr/include/x86_64-linux-gnu/bits/types/struct_statx_timestamp.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x5c
	.byte	0x4
	.file 93 "/usr/include/x86_64-linux-gnu/bits/types/struct_statx.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x5d
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro74
	.byte	0x4
	.byte	0x3
	.uleb128 0x8
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1554
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro75
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1571
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1572
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1573
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1574
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdcpredef.h.19.88fdbfd5cf6f83ed579effc3e425f09b,comdat
.Ldebug_macro2:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF423
	.byte	0x5
	.uleb128 0x26
	.long	.LASF424
	.byte	0x5
	.uleb128 0x27
	.long	.LASF425
	.byte	0x5
	.uleb128 0x30
	.long	.LASF426
	.byte	0x5
	.uleb128 0x31
	.long	.LASF427
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF428
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.24.5c1b97eef3c86b7a2549420f69f4f128,comdat
.Ldebug_macro3:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF429
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF430
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8bb74df3432ebf32d12aa273dc4e2b55,comdat
.Ldebug_macro4:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF432
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF433
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF434
	.byte	0x6
	.uleb128 0x80
	.long	.LASF435
	.byte	0x6
	.uleb128 0x81
	.long	.LASF436
	.byte	0x6
	.uleb128 0x82
	.long	.LASF437
	.byte	0x6
	.uleb128 0x83
	.long	.LASF438
	.byte	0x6
	.uleb128 0x84
	.long	.LASF439
	.byte	0x6
	.uleb128 0x85
	.long	.LASF440
	.byte	0x6
	.uleb128 0x86
	.long	.LASF441
	.byte	0x6
	.uleb128 0x87
	.long	.LASF442
	.byte	0x6
	.uleb128 0x88
	.long	.LASF443
	.byte	0x6
	.uleb128 0x89
	.long	.LASF444
	.byte	0x6
	.uleb128 0x8a
	.long	.LASF445
	.byte	0x6
	.uleb128 0x8b
	.long	.LASF446
	.byte	0x6
	.uleb128 0x8c
	.long	.LASF447
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF448
	.byte	0x6
	.uleb128 0x8e
	.long	.LASF449
	.byte	0x6
	.uleb128 0x8f
	.long	.LASF450
	.byte	0x6
	.uleb128 0x90
	.long	.LASF451
	.byte	0x6
	.uleb128 0x91
	.long	.LASF452
	.byte	0x6
	.uleb128 0x92
	.long	.LASF453
	.byte	0x6
	.uleb128 0x93
	.long	.LASF454
	.byte	0x6
	.uleb128 0x94
	.long	.LASF455
	.byte	0x6
	.uleb128 0x95
	.long	.LASF456
	.byte	0x6
	.uleb128 0x96
	.long	.LASF457
	.byte	0x6
	.uleb128 0x97
	.long	.LASF458
	.byte	0x6
	.uleb128 0x98
	.long	.LASF459
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF460
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF461
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF462
	.byte	0x5
	.uleb128 0xba
	.long	.LASF463
	.byte	0x6
	.uleb128 0xc9
	.long	.LASF464
	.byte	0x5
	.uleb128 0xca
	.long	.LASF465
	.byte	0x6
	.uleb128 0xcb
	.long	.LASF466
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF467
	.byte	0x6
	.uleb128 0xcd
	.long	.LASF468
	.byte	0x5
	.uleb128 0xce
	.long	.LASF469
	.byte	0x6
	.uleb128 0xcf
	.long	.LASF470
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF471
	.byte	0x6
	.uleb128 0xd1
	.long	.LASF472
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF473
	.byte	0x6
	.uleb128 0xd3
	.long	.LASF474
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF475
	.byte	0x6
	.uleb128 0xd5
	.long	.LASF476
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF477
	.byte	0x6
	.uleb128 0xd7
	.long	.LASF478
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF479
	.byte	0x6
	.uleb128 0xd9
	.long	.LASF480
	.byte	0x5
	.uleb128 0xda
	.long	.LASF481
	.byte	0x6
	.uleb128 0xdb
	.long	.LASF482
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF483
	.byte	0x6
	.uleb128 0xdd
	.long	.LASF484
	.byte	0x5
	.uleb128 0xde
	.long	.LASF485
	.byte	0x6
	.uleb128 0xdf
	.long	.LASF486
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF487
	.byte	0x6
	.uleb128 0xeb
	.long	.LASF482
	.byte	0x5
	.uleb128 0xec
	.long	.LASF483
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF488
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF489
	.byte	0x5
	.uleb128 0x101
	.long	.LASF490
	.byte	0x5
	.uleb128 0x108
	.long	.LASF491
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF489
	.byte	0x5
	.uleb128 0x113
	.long	.LASF492
	.byte	0x5
	.uleb128 0x114
	.long	.LASF490
	.byte	0x6
	.uleb128 0x11f
	.long	.LASF472
	.byte	0x5
	.uleb128 0x120
	.long	.LASF473
	.byte	0x6
	.uleb128 0x121
	.long	.LASF474
	.byte	0x5
	.uleb128 0x122
	.long	.LASF475
	.byte	0x5
	.uleb128 0x145
	.long	.LASF493
	.byte	0x5
	.uleb128 0x149
	.long	.LASF494
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF495
	.byte	0x5
	.uleb128 0x151
	.long	.LASF496
	.byte	0x5
	.uleb128 0x155
	.long	.LASF497
	.byte	0x6
	.uleb128 0x156
	.long	.LASF435
	.byte	0x5
	.uleb128 0x157
	.long	.LASF491
	.byte	0x6
	.uleb128 0x158
	.long	.LASF434
	.byte	0x5
	.uleb128 0x159
	.long	.LASF490
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF498
	.byte	0x6
	.uleb128 0x15e
	.long	.LASF484
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF485
	.byte	0x5
	.uleb128 0x163
	.long	.LASF499
	.byte	0x5
	.uleb128 0x165
	.long	.LASF500
	.byte	0x5
	.uleb128 0x166
	.long	.LASF501
	.byte	0x6
	.uleb128 0x167
	.long	.LASF502
	.byte	0x5
	.uleb128 0x168
	.long	.LASF503
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF498
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF504
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF497
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF505
	.byte	0x6
	.uleb128 0x170
	.long	.LASF435
	.byte	0x5
	.uleb128 0x171
	.long	.LASF491
	.byte	0x6
	.uleb128 0x172
	.long	.LASF434
	.byte	0x5
	.uleb128 0x173
	.long	.LASF490
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF506
	.byte	0x5
	.uleb128 0x181
	.long	.LASF507
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.baf119258a1e53d8dba67ceac44ab6bc,comdat
.Ldebug_macro5:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF508
	.byte	0x5
	.uleb128 0xc
	.long	.LASF509
	.byte	0x5
	.uleb128 0xe
	.long	.LASF510
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.395.4e826f3f46279f8464303ec01a71fb3d,comdat
.Ldebug_macro6:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF512
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF513
	.byte	0x5
	.uleb128 0x193
	.long	.LASF514
	.byte	0x5
	.uleb128 0x197
	.long	.LASF515
	.byte	0x5
	.uleb128 0x1ac
	.long	.LASF516
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF517
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF518
	.byte	0x6
	.uleb128 0x1d8
	.long	.LASF519
	.byte	0x5
	.uleb128 0x1d9
	.long	.LASF520
	.byte	0x5
	.uleb128 0x1dd
	.long	.LASF521
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF522
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF523
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.20.52ecbb817e53465ad9571a856bbd4510,comdat
.Ldebug_macro7:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF524
	.byte	0x2
	.uleb128 0x23
	.string	"__P"
	.byte	0x6
	.uleb128 0x24
	.long	.LASF525
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF526
	.byte	0x5
	.uleb128 0x32
	.long	.LASF527
	.byte	0x5
	.uleb128 0x39
	.long	.LASF528
	.byte	0x5
	.uleb128 0x41
	.long	.LASF529
	.byte	0x5
	.uleb128 0x42
	.long	.LASF530
	.byte	0x5
	.uleb128 0x56
	.long	.LASF531
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF532
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF533
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF534
	.byte	0x5
	.uleb128 0x76
	.long	.LASF535
	.byte	0x5
	.uleb128 0x77
	.long	.LASF536
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF537
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF538
	.byte	0x5
	.uleb128 0x80
	.long	.LASF539
	.byte	0x5
	.uleb128 0x85
	.long	.LASF540
	.byte	0x5
	.uleb128 0x86
	.long	.LASF541
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF542
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF543
	.byte	0x5
	.uleb128 0x97
	.long	.LASF544
	.byte	0x5
	.uleb128 0x98
	.long	.LASF545
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF546
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF547
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF548
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF549
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF550
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF551
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF552
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF553
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF554
	.byte	0x5
	.uleb128 0xde
	.long	.LASF555
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF556
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF557
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF558
	.byte	0x5
	.uleb128 0x103
	.long	.LASF559
	.byte	0x5
	.uleb128 0x104
	.long	.LASF560
	.byte	0x5
	.uleb128 0x119
	.long	.LASF561
	.byte	0x5
	.uleb128 0x121
	.long	.LASF562
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF563
	.byte	0x5
	.uleb128 0x134
	.long	.LASF564
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF565
	.byte	0x5
	.uleb128 0x141
	.long	.LASF566
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF567
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF568
	.byte	0x5
	.uleb128 0x153
	.long	.LASF569
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF570
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF571
	.byte	0x5
	.uleb128 0x174
	.long	.LASF572
	.byte	0x5
	.uleb128 0x180
	.long	.LASF573
	.byte	0x5
	.uleb128 0x186
	.long	.LASF574
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF575
	.byte	0x5
	.uleb128 0x196
	.long	.LASF576
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF577
	.byte	0x6
	.uleb128 0x1a7
	.long	.LASF578
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF579
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF580
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF581
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF582
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF583
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF584
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF585
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF586
	.byte	0x5
	.uleb128 0x1fe
	.long	.LASF587
	.byte	0x5
	.uleb128 0x1ff
	.long	.LASF588
	.byte	0x5
	.uleb128 0x214
	.long	.LASF589
	.byte	0x6
	.uleb128 0x21a
	.long	.LASF590
	.byte	0x5
	.uleb128 0x21e
	.long	.LASF591
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.616.1ac5c2dc2ea17e5a41abdf18793c6a2a,comdat
.Ldebug_macro8:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x268
	.long	.LASF593
	.byte	0x5
	.uleb128 0x269
	.long	.LASF594
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF595
	.byte	0x5
	.uleb128 0x26b
	.long	.LASF596
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF597
	.byte	0x5
	.uleb128 0x26d
	.long	.LASF598
	.byte	0x5
	.uleb128 0x26f
	.long	.LASF599
	.byte	0x5
	.uleb128 0x270
	.long	.LASF600
	.byte	0x5
	.uleb128 0x27b
	.long	.LASF601
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF602
	.byte	0x5
	.uleb128 0x290
	.long	.LASF603
	.byte	0x5
	.uleb128 0x299
	.long	.LASF604
	.byte	0x5
	.uleb128 0x2a1
	.long	.LASF605
	.byte	0x5
	.uleb128 0x2a4
	.long	.LASF606
	.byte	0x5
	.uleb128 0x2b1
	.long	.LASF607
	.byte	0x5
	.uleb128 0x2b3
	.long	.LASF608
	.byte	0x5
	.uleb128 0x2bc
	.long	.LASF609
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.7865f4f7062bab1c535c1f73f43aa9b9,comdat
.Ldebug_macro9:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF610
	.byte	0x5
	.uleb128 0xb
	.long	.LASF611
	.byte	0x5
	.uleb128 0xc
	.long	.LASF612
	.byte	0x5
	.uleb128 0xd
	.long	.LASF613
	.byte	0x5
	.uleb128 0xe
	.long	.LASF614
	.byte	0x5
	.uleb128 0xf
	.long	.LASF615
	.byte	0x5
	.uleb128 0x10
	.long	.LASF616
	.byte	0x5
	.uleb128 0x11
	.long	.LASF617
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libcheaderstart.h.37.2d9ac158e6f2ac2bd2ede1a2a422177c,comdat
.Ldebug_macro10:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x25
	.long	.LASF618
	.byte	0x5
	.uleb128 0x28
	.long	.LASF619
	.byte	0x6
	.uleb128 0x43
	.long	.LASF620
	.byte	0x5
	.uleb128 0x45
	.long	.LASF621
	.byte	0x6
	.uleb128 0x49
	.long	.LASF622
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF623
	.byte	0x6
	.uleb128 0x4f
	.long	.LASF624
	.byte	0x5
	.uleb128 0x51
	.long	.LASF625
	.byte	0x6
	.uleb128 0x5a
	.long	.LASF626
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF627
	.byte	0x6
	.uleb128 0x60
	.long	.LASF628
	.byte	0x5
	.uleb128 0x62
	.long	.LASF629
	.byte	0x6
	.uleb128 0x69
	.long	.LASF630
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF631
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.31.e39a94e203ad4e1d978c0fc68ce016ee,comdat
.Ldebug_macro11:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF632
	.byte	0x5
	.uleb128 0x20
	.long	.LASF633
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.181.8244260f48f94f0aee719a52801015bd,comdat
.Ldebug_macro12:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF634
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF635
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF636
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF637
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF638
	.byte	0x5
	.uleb128 0xba
	.long	.LASF639
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF640
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF641
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF642
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF643
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF644
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF645
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF646
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF647
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF648
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF649
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF650
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF651
	.byte	0x6
	.uleb128 0x186
	.long	.LASF652
	.byte	0x5
	.uleb128 0x188
	.long	.LASF653
	.byte	0x6
	.uleb128 0x191
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro13:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF656
	.byte	0x5
	.uleb128 0x27
	.long	.LASF657
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.109.56eb9ae966b255288cc544f18746a7ff,comdat
.Ldebug_macro14:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF659
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF660
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF661
	.byte	0x5
	.uleb128 0x70
	.long	.LASF662
	.byte	0x5
	.uleb128 0x71
	.long	.LASF663
	.byte	0x5
	.uleb128 0x72
	.long	.LASF664
	.byte	0x5
	.uleb128 0x80
	.long	.LASF665
	.byte	0x5
	.uleb128 0x81
	.long	.LASF666
	.byte	0x5
	.uleb128 0x82
	.long	.LASF667
	.byte	0x5
	.uleb128 0x83
	.long	.LASF668
	.byte	0x5
	.uleb128 0x84
	.long	.LASF669
	.byte	0x5
	.uleb128 0x85
	.long	.LASF670
	.byte	0x5
	.uleb128 0x86
	.long	.LASF671
	.byte	0x5
	.uleb128 0x87
	.long	.LASF672
	.byte	0x5
	.uleb128 0x89
	.long	.LASF673
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.ccf5919b8e01b553263cf8f4ab1d5fde,comdat
.Ldebug_macro15:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF674
	.byte	0x5
	.uleb128 0x22
	.long	.LASF675
	.byte	0x5
	.uleb128 0x23
	.long	.LASF676
	.byte	0x5
	.uleb128 0x26
	.long	.LASF677
	.byte	0x5
	.uleb128 0x27
	.long	.LASF678
	.byte	0x5
	.uleb128 0x28
	.long	.LASF679
	.byte	0x5
	.uleb128 0x29
	.long	.LASF680
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF681
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF682
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF683
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF684
	.byte	0x5
	.uleb128 0x33
	.long	.LASF685
	.byte	0x5
	.uleb128 0x34
	.long	.LASF686
	.byte	0x5
	.uleb128 0x35
	.long	.LASF687
	.byte	0x5
	.uleb128 0x36
	.long	.LASF688
	.byte	0x5
	.uleb128 0x37
	.long	.LASF689
	.byte	0x5
	.uleb128 0x38
	.long	.LASF690
	.byte	0x5
	.uleb128 0x39
	.long	.LASF691
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF692
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF693
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF694
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF695
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF696
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF697
	.byte	0x5
	.uleb128 0x40
	.long	.LASF698
	.byte	0x5
	.uleb128 0x41
	.long	.LASF699
	.byte	0x5
	.uleb128 0x42
	.long	.LASF700
	.byte	0x5
	.uleb128 0x43
	.long	.LASF701
	.byte	0x5
	.uleb128 0x44
	.long	.LASF702
	.byte	0x5
	.uleb128 0x45
	.long	.LASF703
	.byte	0x5
	.uleb128 0x46
	.long	.LASF704
	.byte	0x5
	.uleb128 0x47
	.long	.LASF705
	.byte	0x5
	.uleb128 0x48
	.long	.LASF706
	.byte	0x5
	.uleb128 0x49
	.long	.LASF707
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF708
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF709
	.byte	0x5
	.uleb128 0x51
	.long	.LASF710
	.byte	0x5
	.uleb128 0x54
	.long	.LASF711
	.byte	0x5
	.uleb128 0x57
	.long	.LASF712
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF713
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF714
	.byte	0x5
	.uleb128 0x67
	.long	.LASF715
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time64.h.24.a8166ae916ec910dab0d8987098d42ee,comdat
.Ldebug_macro16:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF716
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF717
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_FILE.h.19.0888ac70396abe1031c03d393554032f,comdat
.Ldebug_macro17:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF724
	.byte	0x5
	.uleb128 0x66
	.long	.LASF725
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF726
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF727
	.byte	0x5
	.uleb128 0x70
	.long	.LASF728
	.byte	0x5
	.uleb128 0x72
	.long	.LASF729
	.byte	0x5
	.uleb128 0x73
	.long	.LASF730
	.byte	0x5
	.uleb128 0x75
	.long	.LASF731
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.53.90a05048924955a6e2e77b4203beef80,comdat
.Ldebug_macro18:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF733
	.byte	0x5
	.uleb128 0x43
	.long	.LASF734
	.byte	0x5
	.uleb128 0x47
	.long	.LASF735
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF736
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF737
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF738
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF739
	.byte	0x5
	.uleb128 0x63
	.long	.LASF740
	.byte	0x5
	.uleb128 0x68
	.long	.LASF741
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF742
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF743
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF744
	.byte	0x5
	.uleb128 0x71
	.long	.LASF745
	.byte	0x5
	.uleb128 0x72
	.long	.LASF746
	.byte	0x5
	.uleb128 0x78
	.long	.LASF747
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.19.86760ef34d2b7513aac6ce30cb73c6f8,comdat
.Ldebug_macro19:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF748
	.byte	0x5
	.uleb128 0x19
	.long	.LASF749
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF750
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF751
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF752
	.byte	0x5
	.uleb128 0x20
	.long	.LASF753
	.byte	0x6
	.uleb128 0x24
	.long	.LASF754
	.byte	0x5
	.uleb128 0x25
	.long	.LASF755
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.138.ba977b5ae4e90303e95ec5db0bd05792,comdat
.Ldebug_macro20:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF756
	.byte	0x5
	.uleb128 0x93
	.long	.LASF757
	.byte	0x5
	.uleb128 0x94
	.long	.LASF758
	.byte	0x5
	.uleb128 0x95
	.long	.LASF759
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF760
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF761
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF762
	.byte	0x6
	.uleb128 0xb4
	.long	.LASF763
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF764
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.floatn.h.20.207623bcb9502202aaae1f368f614a9f,comdat
.Ldebug_macro21:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF765
	.byte	0x5
	.uleb128 0x20
	.long	.LASF766
	.byte	0x5
	.uleb128 0x28
	.long	.LASF767
	.byte	0x5
	.uleb128 0x30
	.long	.LASF768
	.byte	0x5
	.uleb128 0x36
	.long	.LASF769
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF770
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF771
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.floatncommon.h.34.636061892ab0c3d217b3470ad02277d6,comdat
.Ldebug_macro22:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF773
	.byte	0x5
	.uleb128 0x23
	.long	.LASF774
	.byte	0x5
	.uleb128 0x24
	.long	.LASF775
	.byte	0x5
	.uleb128 0x25
	.long	.LASF776
	.byte	0x5
	.uleb128 0x26
	.long	.LASF777
	.byte	0x5
	.uleb128 0x34
	.long	.LASF778
	.byte	0x5
	.uleb128 0x35
	.long	.LASF779
	.byte	0x5
	.uleb128 0x36
	.long	.LASF780
	.byte	0x5
	.uleb128 0x37
	.long	.LASF781
	.byte	0x5
	.uleb128 0x38
	.long	.LASF782
	.byte	0x5
	.uleb128 0x39
	.long	.LASF783
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF784
	.byte	0x5
	.uleb128 0x48
	.long	.LASF785
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF786
	.byte	0x5
	.uleb128 0x66
	.long	.LASF787
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF788
	.byte	0x5
	.uleb128 0x78
	.long	.LASF789
	.byte	0x5
	.uleb128 0x95
	.long	.LASF790
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF791
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF792
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF793
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cconfig.h.31.bdd4a98a0ebe0a39f5e7a2484982efab,comdat
.Ldebug_macro23:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF795
	.byte	0x5
	.uleb128 0x22
	.long	.LASF796
	.byte	0x5
	.uleb128 0x25
	.long	.LASF797
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF798
	.byte	0x5
	.uleb128 0x32
	.long	.LASF799
	.byte	0x5
	.uleb128 0x36
	.long	.LASF800
	.byte	0x5
	.uleb128 0x43
	.long	.LASF801
	.byte	0x5
	.uleb128 0x46
	.long	.LASF802
	.byte	0x5
	.uleb128 0x58
	.long	.LASF803
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF804
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF805
	.byte	0x5
	.uleb128 0x65
	.long	.LASF806
	.byte	0x5
	.uleb128 0x66
	.long	.LASF807
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF808
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF809
	.byte	0x5
	.uleb128 0x78
	.long	.LASF810
	.byte	0x5
	.uleb128 0x79
	.long	.LASF811
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF812
	.byte	0x5
	.uleb128 0x83
	.long	.LASF813
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF814
	.byte	0x5
	.uleb128 0x90
	.long	.LASF815
	.byte	0x5
	.uleb128 0x99
	.long	.LASF816
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF817
	.byte	0x5
	.uleb128 0xab
	.long	.LASF818
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF819
	.byte	0x5
	.uleb128 0xba
	.long	.LASF820
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF821
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF822
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF823
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF824
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF825
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF826
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF827
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF828
	.byte	0x5
	.uleb128 0x120
	.long	.LASF829
	.byte	0x5
	.uleb128 0x128
	.long	.LASF830
	.byte	0x5
	.uleb128 0x134
	.long	.LASF831
	.byte	0x5
	.uleb128 0x135
	.long	.LASF832
	.byte	0x5
	.uleb128 0x136
	.long	.LASF833
	.byte	0x5
	.uleb128 0x137
	.long	.LASF834
	.byte	0x5
	.uleb128 0x140
	.long	.LASF835
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF836
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF837
	.byte	0x5
	.uleb128 0x199
	.long	.LASF838
	.byte	0x5
	.uleb128 0x19a
	.long	.LASF839
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF840
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF841
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF842
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF843
	.byte	0x6
	.uleb128 0x1ab
	.long	.LASF844
	.byte	0x6
	.uleb128 0x1b0
	.long	.LASF845
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF846
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF847
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF848
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF849
	.byte	0x5
	.uleb128 0x1d5
	.long	.LASF850
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF851
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF852
	.byte	0x5
	.uleb128 0x212
	.long	.LASF853
	.byte	0x5
	.uleb128 0x22c
	.long	.LASF854
	.byte	0x5
	.uleb128 0x22f
	.long	.LASF855
	.byte	0x5
	.uleb128 0x233
	.long	.LASF856
	.byte	0x5
	.uleb128 0x234
	.long	.LASF857
	.byte	0x5
	.uleb128 0x236
	.long	.LASF858
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.os_defines.h.31.1a1ede0dcf66054983b5606909a909e3,comdat
.Ldebug_macro24:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF859
	.byte	0x5
	.uleb128 0x25
	.long	.LASF860
	.byte	0x6
	.uleb128 0x2d
	.long	.LASF861
	.byte	0x5
	.uleb128 0x32
	.long	.LASF862
	.byte	0x5
	.uleb128 0x36
	.long	.LASF863
	.byte	0x5
	.uleb128 0x43
	.long	.LASF864
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cconfig.h.594.9634a42c4bf6e714359f4a12582b9fb5,comdat
.Ldebug_macro25:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x252
	.long	.LASF866
	.byte	0x5
	.uleb128 0x259
	.long	.LASF867
	.byte	0x5
	.uleb128 0x261
	.long	.LASF868
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF869
	.byte	0x5
	.uleb128 0x26f
	.long	.LASF870
	.byte	0x5
	.uleb128 0x274
	.long	.LASF871
	.byte	0x5
	.uleb128 0x281
	.long	.LASF872
	.byte	0x5
	.uleb128 0x288
	.long	.LASF873
	.byte	0x2
	.uleb128 0x28b
	.string	"min"
	.byte	0x2
	.uleb128 0x28c
	.string	"max"
	.byte	0x5
	.uleb128 0x292
	.long	.LASF874
	.byte	0x5
	.uleb128 0x295
	.long	.LASF875
	.byte	0x5
	.uleb128 0x298
	.long	.LASF876
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF877
	.byte	0x5
	.uleb128 0x29e
	.long	.LASF878
	.byte	0x5
	.uleb128 0x2c1
	.long	.LASF879
	.byte	0x5
	.uleb128 0x2c9
	.long	.LASF880
	.byte	0x5
	.uleb128 0x2d0
	.long	.LASF881
	.byte	0x5
	.uleb128 0x2d8
	.long	.LASF882
	.byte	0x5
	.uleb128 0x2dd
	.long	.LASF883
	.byte	0x5
	.uleb128 0x2e1
	.long	.LASF884
	.byte	0x5
	.uleb128 0x2e5
	.long	.LASF885
	.byte	0x5
	.uleb128 0x2e9
	.long	.LASF886
	.byte	0x5
	.uleb128 0x2ed
	.long	.LASF887
	.byte	0x6
	.uleb128 0x2f0
	.long	.LASF888
	.byte	0x5
	.uleb128 0x2fd
	.long	.LASF889
	.byte	0x5
	.uleb128 0x303
	.long	.LASF890
	.byte	0x5
	.uleb128 0x306
	.long	.LASF891
	.byte	0x5
	.uleb128 0x307
	.long	.LASF892
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pstl_config.h.11.160effd7011329c1d43041d1565e18a1,comdat
.Ldebug_macro26:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xb
	.long	.LASF893
	.byte	0x5
	.uleb128 0xe
	.long	.LASF894
	.byte	0x5
	.uleb128 0xf
	.long	.LASF895
	.byte	0x5
	.uleb128 0x10
	.long	.LASF896
	.byte	0x5
	.uleb128 0x11
	.long	.LASF897
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF898
	.byte	0x5
	.uleb128 0x24
	.long	.LASF899
	.byte	0x5
	.uleb128 0x27
	.long	.LASF900
	.byte	0x5
	.uleb128 0x28
	.long	.LASF901
	.byte	0x5
	.uleb128 0x29
	.long	.LASF902
	.byte	0x5
	.uleb128 0x30
	.long	.LASF903
	.byte	0x5
	.uleb128 0x31
	.long	.LASF904
	.byte	0x5
	.uleb128 0x36
	.long	.LASF905
	.byte	0x5
	.uleb128 0x40
	.long	.LASF906
	.byte	0x5
	.uleb128 0x41
	.long	.LASF907
	.byte	0x5
	.uleb128 0x42
	.long	.LASF908
	.byte	0x5
	.uleb128 0x50
	.long	.LASF909
	.byte	0x5
	.uleb128 0x58
	.long	.LASF910
	.byte	0x5
	.uleb128 0x59
	.long	.LASF911
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF912
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF913
	.byte	0x5
	.uleb128 0x60
	.long	.LASF914
	.byte	0x5
	.uleb128 0x62
	.long	.LASF915
	.byte	0x5
	.uleb128 0x64
	.long	.LASF916
	.byte	0x5
	.uleb128 0x65
	.long	.LASF917
	.byte	0x5
	.uleb128 0x68
	.long	.LASF918
	.byte	0x5
	.uleb128 0x69
	.long	.LASF919
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF920
	.byte	0x5
	.uleb128 0x71
	.long	.LASF921
	.byte	0x5
	.uleb128 0x76
	.long	.LASF922
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF923
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF924
	.byte	0x5
	.uleb128 0x88
	.long	.LASF925
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF926
	.byte	0x5
	.uleb128 0x95
	.long	.LASF927
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF928
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF929
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF930
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF931
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF932
	.byte	0x5
	.uleb128 0xab
	.long	.LASF933
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cconfig.h.786.7bd9a34459500e75efb0f1ab93a87a35,comdat
.Ldebug_macro27:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x312
	.long	.LASF934
	.byte	0x5
	.uleb128 0x315
	.long	.LASF935
	.byte	0x5
	.uleb128 0x318
	.long	.LASF936
	.byte	0x5
	.uleb128 0x31b
	.long	.LASF937
	.byte	0x5
	.uleb128 0x31e
	.long	.LASF938
	.byte	0x5
	.uleb128 0x321
	.long	.LASF939
	.byte	0x5
	.uleb128 0x324
	.long	.LASF940
	.byte	0x5
	.uleb128 0x327
	.long	.LASF941
	.byte	0x5
	.uleb128 0x32a
	.long	.LASF942
	.byte	0x5
	.uleb128 0x32d
	.long	.LASF943
	.byte	0x5
	.uleb128 0x330
	.long	.LASF944
	.byte	0x5
	.uleb128 0x333
	.long	.LASF945
	.byte	0x5
	.uleb128 0x336
	.long	.LASF946
	.byte	0x5
	.uleb128 0x33c
	.long	.LASF947
	.byte	0x5
	.uleb128 0x33f
	.long	.LASF948
	.byte	0x5
	.uleb128 0x342
	.long	.LASF949
	.byte	0x5
	.uleb128 0x345
	.long	.LASF950
	.byte	0x5
	.uleb128 0x348
	.long	.LASF951
	.byte	0x5
	.uleb128 0x34b
	.long	.LASF952
	.byte	0x5
	.uleb128 0x34e
	.long	.LASF953
	.byte	0x5
	.uleb128 0x351
	.long	.LASF954
	.byte	0x5
	.uleb128 0x354
	.long	.LASF955
	.byte	0x5
	.uleb128 0x357
	.long	.LASF956
	.byte	0x5
	.uleb128 0x35a
	.long	.LASF957
	.byte	0x5
	.uleb128 0x35d
	.long	.LASF958
	.byte	0x5
	.uleb128 0x360
	.long	.LASF959
	.byte	0x5
	.uleb128 0x363
	.long	.LASF960
	.byte	0x5
	.uleb128 0x366
	.long	.LASF961
	.byte	0x5
	.uleb128 0x369
	.long	.LASF962
	.byte	0x5
	.uleb128 0x36c
	.long	.LASF963
	.byte	0x5
	.uleb128 0x36f
	.long	.LASF964
	.byte	0x5
	.uleb128 0x372
	.long	.LASF965
	.byte	0x5
	.uleb128 0x375
	.long	.LASF966
	.byte	0x5
	.uleb128 0x378
	.long	.LASF967
	.byte	0x5
	.uleb128 0x37b
	.long	.LASF968
	.byte	0x5
	.uleb128 0x37e
	.long	.LASF969
	.byte	0x5
	.uleb128 0x381
	.long	.LASF970
	.byte	0x5
	.uleb128 0x384
	.long	.LASF971
	.byte	0x5
	.uleb128 0x387
	.long	.LASF972
	.byte	0x5
	.uleb128 0x390
	.long	.LASF973
	.byte	0x5
	.uleb128 0x393
	.long	.LASF974
	.byte	0x5
	.uleb128 0x396
	.long	.LASF975
	.byte	0x5
	.uleb128 0x399
	.long	.LASF976
	.byte	0x5
	.uleb128 0x39c
	.long	.LASF977
	.byte	0x5
	.uleb128 0x39f
	.long	.LASF978
	.byte	0x5
	.uleb128 0x3a2
	.long	.LASF979
	.byte	0x5
	.uleb128 0x3a5
	.long	.LASF980
	.byte	0x5
	.uleb128 0x3ab
	.long	.LASF981
	.byte	0x5
	.uleb128 0x3ae
	.long	.LASF982
	.byte	0x5
	.uleb128 0x3b4
	.long	.LASF983
	.byte	0x5
	.uleb128 0x3ba
	.long	.LASF984
	.byte	0x5
	.uleb128 0x3bd
	.long	.LASF985
	.byte	0x5
	.uleb128 0x3c3
	.long	.LASF986
	.byte	0x5
	.uleb128 0x3c6
	.long	.LASF987
	.byte	0x5
	.uleb128 0x3c9
	.long	.LASF988
	.byte	0x5
	.uleb128 0x3cc
	.long	.LASF989
	.byte	0x5
	.uleb128 0x3cf
	.long	.LASF990
	.byte	0x5
	.uleb128 0x3d2
	.long	.LASF991
	.byte	0x5
	.uleb128 0x3d5
	.long	.LASF992
	.byte	0x5
	.uleb128 0x3d8
	.long	.LASF993
	.byte	0x5
	.uleb128 0x3db
	.long	.LASF994
	.byte	0x5
	.uleb128 0x3de
	.long	.LASF995
	.byte	0x5
	.uleb128 0x3e1
	.long	.LASF996
	.byte	0x5
	.uleb128 0x3e4
	.long	.LASF997
	.byte	0x5
	.uleb128 0x3e7
	.long	.LASF998
	.byte	0x5
	.uleb128 0x3ea
	.long	.LASF999
	.byte	0x5
	.uleb128 0x3ed
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x3f0
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x3f3
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x3f6
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x3f9
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x3fc
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x3ff
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x408
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x40b
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x40e
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x411
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x414
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x417
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x41d
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x420
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x423
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x42c
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x42f
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x432
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x436
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x439
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x43c
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x442
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x445
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x448
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x44b
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x44e
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x451
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x454
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x457
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x45a
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x45d
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x463
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x466
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x469
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x46c
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x46f
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x472
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x475
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x478
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x47b
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x47e
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x481
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x484
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x487
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x48a
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x48d
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x490
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x494
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x49a
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x49d
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x4a6
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x4a9
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x4ac
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x4af
	.long	.LASF1054
	.byte	0x5
	.uleb128 0x4b2
	.long	.LASF1055
	.byte	0x5
	.uleb128 0x4b5
	.long	.LASF1056
	.byte	0x5
	.uleb128 0x4b8
	.long	.LASF1057
	.byte	0x5
	.uleb128 0x4bb
	.long	.LASF1058
	.byte	0x5
	.uleb128 0x4be
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x4c1
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x4c4
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x4ca
	.long	.LASF1062
	.byte	0x5
	.uleb128 0x4cd
	.long	.LASF1063
	.byte	0x5
	.uleb128 0x4d0
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x4d3
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x4d6
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x4d9
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x4dc
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x4df
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x4e2
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x4e5
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x4e8
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x4eb
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x4f1
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x4f4
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x4f7
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x4fa
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x4fd
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x500
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x503
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x509
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x5d2
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x5d5
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x5d9
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x5df
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x5e2
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x5e5
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x5e8
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x5eb
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x5ee
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x600
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x607
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x610
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x614
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x618
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x61c
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x620
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x625
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x629
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x62d
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x631
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x635
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x638
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x63f
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x642
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x645
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x64d
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x659
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x65f
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x662
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x665
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x668
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x66e
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x678
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x67c
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x681
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x685
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x689
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x68d
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x691
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x695
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x699
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x6a0
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x6a3
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x6a7
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x6ab
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x6ae
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x6b1
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x6b4
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x6b7
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x6ba
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x6bd
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x6c0
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x6c3
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x6c6
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x6c9
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x6cf
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x6d2
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x6d6
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x6d9
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x6dd
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x6e0
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x6e3
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x6e6
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x6ec
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x6f2
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x6f8
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x6fb
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x6ff
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x702
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x705
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x708
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x70b
	.long	.LASF1153
	.byte	0x5
	.uleb128 0x70e
	.long	.LASF1154
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cstdlib.44.52c5efdfb0f3c176bd11e611a0b94959,comdat
.Ldebug_macro28:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1156
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libcheaderstart.h.31.b7a4729c1073310331157d0d7c0b7649,comdat
.Ldebug_macro29:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF431
	.byte	0x6
	.uleb128 0x25
	.long	.LASF618
	.byte	0x5
	.uleb128 0x28
	.long	.LASF619
	.byte	0x6
	.uleb128 0x43
	.long	.LASF620
	.byte	0x5
	.uleb128 0x45
	.long	.LASF621
	.byte	0x6
	.uleb128 0x49
	.long	.LASF622
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF623
	.byte	0x6
	.uleb128 0x4f
	.long	.LASF624
	.byte	0x5
	.uleb128 0x51
	.long	.LASF625
	.byte	0x6
	.uleb128 0x5a
	.long	.LASF626
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF627
	.byte	0x6
	.uleb128 0x60
	.long	.LASF628
	.byte	0x5
	.uleb128 0x62
	.long	.LASF629
	.byte	0x6
	.uleb128 0x69
	.long	.LASF630
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF631
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.29.dde59e751a3b6c4506ba901b60a85c87,comdat
.Ldebug_macro30:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF632
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF633
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.c59b93f8e3fae4d77e6ea68790a74825,comdat
.Ldebug_macro31:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF651
	.byte	0x5
	.uleb128 0x104
	.long	.LASF1158
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1159
	.byte	0x5
	.uleb128 0x106
	.long	.LASF1160
	.byte	0x5
	.uleb128 0x107
	.long	.LASF1161
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1162
	.byte	0x5
	.uleb128 0x109
	.long	.LASF1163
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF1164
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1165
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1166
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF1167
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1168
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF1169
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1170
	.byte	0x5
	.uleb128 0x111
	.long	.LASF1171
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1172
	.byte	0x6
	.uleb128 0x11f
	.long	.LASF1173
	.byte	0x6
	.uleb128 0x154
	.long	.LASF1174
	.byte	0x6
	.uleb128 0x186
	.long	.LASF652
	.byte	0x5
	.uleb128 0x188
	.long	.LASF653
	.byte	0x6
	.uleb128 0x191
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.33c1a56564084888d0719c1519fd9fc3,comdat
.Ldebug_macro32:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1178
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1184
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro33:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1196
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.44.fc9d051d38577d71bf2818359e56065c,comdat
.Ldebug_macro34:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1209
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.af7f911dde3e35bc76811e3bbb474dfc,comdat
.Ldebug_macro35:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1224
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.135.9eeb6b52c2522ad7aff16ad95342972e,comdat
.Ldebug_macro36:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF632
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.0adce5c8c1fd8096aaff50981b3d1f0f,comdat
.Ldebug_macro37:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF651
	.byte	0x6
	.uleb128 0x191
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.20.efabd1018df5d7b4052c27dc6bdd5ce5,comdat
.Ldebug_macro38:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1237
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endianness.h.2.2c6a211f7909f3af5e9e9cfa3b6b63c8,comdat
.Ldebug_macro39:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1239
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.40.9e5d395adda2f4eb53ae69b69b664084,comdat
.Ldebug_macro40:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1241
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.27.4c4f94262c4eaee2982fe00ed1b4f173,comdat
.Ldebug_macro41:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1245
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.24.5363c019348146aada5aeadf51456576,comdat
.Ldebug_macro42:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1249
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.39.30a606dbd99b6c3df61c1f06dbdabd4e,comdat
.Ldebug_macro43:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1262
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.25.df647f04fce2d846f134ede6a14ddf91,comdat
.Ldebug_macro44:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1267
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.__sigset_t.h.2.6b1ab6ff3d7b8fd9c0c42b0d80afbd80,comdat
.Ldebug_macro45:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x4
	.long	.LASF1270
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.52.4f882364bb7424384ae71496b52638dc,comdat
.Ldebug_macro46:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x34
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1283
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.186.489a4ed8f2d29cd358843490f54ddea5,comdat
.Ldebug_macro47:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1284
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF1285
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1286
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF1287
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypesarch.h.25.6063cba99664c916e22d3a912bcc348a,comdat
.Ldebug_macro48:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1301
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_mutex.h.20.ed51f515172b9be99e450ba83eb5dd99,comdat
.Ldebug_macro49:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1305
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_rwlock.h.21.0254880f2904e3833fb8ae683e0f0330,comdat
.Ldebug_macro50:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1308
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro51:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x17
	.long	.LASF632
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro52:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1313
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.std_abs.h.31.4587ba001d85390d152353c24c92c0c8,comdat
.Ldebug_macro53:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1156
	.byte	0x6
	.uleb128 0x2a
	.long	.LASF1315
	.byte	0x2
	.uleb128 0x2c
	.string	"abs"
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cstdlib.80.27624e0a6399c87156de13aacc7f184d,comdat
.Ldebug_macro54:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x50
	.long	.LASF1317
	.byte	0x6
	.uleb128 0x52
	.long	.LASF1318
	.byte	0x6
	.uleb128 0x54
	.long	.LASF1319
	.byte	0x6
	.uleb128 0x57
	.long	.LASF1320
	.byte	0x6
	.uleb128 0x5a
	.long	.LASF1321
	.byte	0x6
	.uleb128 0x5b
	.long	.LASF1322
	.byte	0x6
	.uleb128 0x5c
	.long	.LASF1323
	.byte	0x6
	.uleb128 0x5d
	.long	.LASF1324
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF1325
	.byte	0x2
	.uleb128 0x5f
	.string	"div"
	.byte	0x6
	.uleb128 0x60
	.long	.LASF1326
	.byte	0x6
	.uleb128 0x61
	.long	.LASF1327
	.byte	0x6
	.uleb128 0x62
	.long	.LASF1328
	.byte	0x6
	.uleb128 0x63
	.long	.LASF1329
	.byte	0x6
	.uleb128 0x64
	.long	.LASF1330
	.byte	0x6
	.uleb128 0x65
	.long	.LASF1331
	.byte	0x6
	.uleb128 0x66
	.long	.LASF1332
	.byte	0x6
	.uleb128 0x67
	.long	.LASF1333
	.byte	0x6
	.uleb128 0x68
	.long	.LASF1334
	.byte	0x6
	.uleb128 0x69
	.long	.LASF1335
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF1336
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF1337
	.byte	0x6
	.uleb128 0x70
	.long	.LASF1338
	.byte	0x6
	.uleb128 0x71
	.long	.LASF1339
	.byte	0x6
	.uleb128 0x72
	.long	.LASF1340
	.byte	0x6
	.uleb128 0x73
	.long	.LASF1341
	.byte	0x6
	.uleb128 0x74
	.long	.LASF1342
	.byte	0x6
	.uleb128 0x75
	.long	.LASF1343
	.byte	0x6
	.uleb128 0x76
	.long	.LASF1344
	.byte	0x6
	.uleb128 0x77
	.long	.LASF1345
	.byte	0x6
	.uleb128 0xba
	.long	.LASF1346
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF1347
	.byte	0x6
	.uleb128 0xbc
	.long	.LASF1348
	.byte	0x6
	.uleb128 0xbd
	.long	.LASF1349
	.byte	0x6
	.uleb128 0xbe
	.long	.LASF1350
	.byte	0x6
	.uleb128 0xbf
	.long	.LASF1351
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF1352
	.byte	0x6
	.uleb128 0xc1
	.long	.LASF1353
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.23.18ede267f3a48794bef4705df80339de,comdat
.Ldebug_macro55:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF632
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF633
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.ed8a89f5766bdf01a772bd7dfbc9d665,comdat
.Ldebug_macro56:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF651
	.byte	0x6
	.uleb128 0x186
	.long	.LASF652
	.byte	0x5
	.uleb128 0x188
	.long	.LASF653
	.byte	0x6
	.uleb128 0x191
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.24.2a1e1114b014e13763222c5cd6400760,comdat
.Ldebug_macro57:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.timex.h.19.68c3118fc57dd4af71155e57fb45153a,comdat
.Ldebug_macro58:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1369
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1372
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1373
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1374
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1375
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1376
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1377
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1378
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1379
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1380
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1381
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1382
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1383
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1384
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1386
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1387
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1388
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1395
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1397
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1405
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1406
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1407
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1409
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1410
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.65.ad8b7cdf304665ee800a89090a0d61aa,comdat
.Ldebug_macro59:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1413
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1414
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.93403f89af7dba8212345449bb14b09d,comdat
.Ldebug_macro60:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x19
	.long	.LASF430
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.31.e39a94e203ad4e1d978c0fc68ce016ee,comdat
.Ldebug_macro61:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF632
	.byte	0x5
	.uleb128 0x20
	.long	.LASF633
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.38.5e57f557920b43aac91880039d9f0c7a,comdat
.Ldebug_macro62:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1416
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF1417
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1418
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.strings.h.19.a259f126920b1bb5ef76bc62b3984a3c,comdat
.Ldebug_macro63:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x16
	.long	.LASF632
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ctype.h.23.61a99fb2d9a53286fbe40801035355a7,comdat
.Ldebug_macro64:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1426
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF1427
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1428
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_stat.h.24.58804b9fde232cb81d58c44500307576,comdat
.Ldebug_macro65:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1433
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1434
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1435
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1436
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1437
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stat.h.29.cab33b67e546bcdba0ebb7d142404f85,comdat
.Ldebug_macro66:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1438
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1439
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1440
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1441
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1442
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1443
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1445
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1446
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1447
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1448
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1449
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1450
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1451
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1452
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1453
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1454
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1455
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1456
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stat.h.104.75fb58194ba4379fc75175a5977edd6b,comdat
.Ldebug_macro67:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1457
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1458
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1459
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1460
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1461
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1462
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1463
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1464
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF1465
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1466
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1467
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1468
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1469
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1470
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1471
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1472
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1473
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1474
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1475
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1476
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1477
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1478
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1479
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1480
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1481
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1482
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1483
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1484
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1485
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1486
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1487
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1488
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1489
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1490
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1491
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1492
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1493
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF1494
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1495
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1496
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1497
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.bitsperlong.h.3.81201f16c5ebf9ebeb0f369d7d7d8e27,comdat
.Ldebug_macro68:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1502
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1503
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_types.h.22.ce27b629270cbb91230af7498cb5994b,comdat
.Ldebug_macro69:
	.value	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x16
	.long	.LASF1506
	.byte	0x5
	.uleb128 0x17
	.long	.LASF715
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_types_64.h.3.c35937438f2f85070758d4696b933189,comdat
.Ldebug_macro70:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1507
	.byte	0x5
	.uleb128 0xd
	.long	.LASF1508
	.byte	0x5
	.uleb128 0x10
	.long	.LASF1509
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.20.b2306ee43436b7c16de336cc9caa87b1,comdat
.Ldebug_macro71:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1511
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1512
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1513
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1514
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1515
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stat.h.141.ff07f77ae6ad8f082daba1911a20f651,comdat
.Ldebug_macro72:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1516
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1517
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1518
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1519
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1520
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1521
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1522
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1523
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1524
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1525
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1526
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1527
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1528
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1529
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1530
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1531
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1532
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1533
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1534
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1535
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1536
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1537
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1538
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1539
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1540
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.statx.h.33.790099d4164393bf7e0ab7a0f95e4477,comdat
.Ldebug_macro73:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1541
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1542
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.logging.h.8.ee0130c4e17ced28a12661fa45869526,comdat
.Ldebug_macro74:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x8
	.long	.LASF1543
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1544
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1545
	.byte	0x5
	.uleb128 0xe
	.long	.LASF1546
	.byte	0x5
	.uleb128 0x10
	.long	.LASF1547
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1548
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1549
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1550
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1551
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1552
	.byte	0x6
	.uleb128 0x75
	.long	.LASF1553
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.39.6567780cc989e4ed3f8eae7393be847a,comdat
.Ldebug_macro75:
	.value	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1555
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1556
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1557
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1558
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1559
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1560
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1561
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1562
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1563
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1564
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1565
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1566
	.byte	0x6
	.uleb128 0x9b
	.long	.LASF1567
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF651
	.byte	0x6
	.uleb128 0x154
	.long	.LASF1174
	.byte	0x6
	.uleb128 0x186
	.long	.LASF652
	.byte	0x5
	.uleb128 0x188
	.long	.LASF653
	.byte	0x6
	.uleb128 0x191
	.long	.LASF654
	.byte	0x5
	.uleb128 0x196
	.long	.LASF1568
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1569
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF1570
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1510:
	.string	"__ASM_GENERIC_POSIX_TYPES_H "
.LASF1204:
	.string	"__ldiv_t_defined 1"
.LASF1393:
	.string	"MOD_NANO ADJ_NANO"
.LASF1439:
	.string	"__S_IFDIR 0040000"
.LASF341:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF1609:
	.string	"_offset"
.LASF1142:
	.string	"_GLIBCXX_USE_REALPATH 1"
.LASF129:
	.string	"__cpp_aligned_new 201606L"
.LASF170:
	.string	"__UINT16_MAX__ 0xffff"
.LASF771:
	.string	"__CFLOAT128 __cfloat128"
.LASF912:
	.string	"_PSTL_PRAGMA_SIMD_EXCLUSIVE_SCAN(PRM) "
.LASF858:
	.string	"_GLIBCXX_USE_ALLOCATOR_NEW 1"
.LASF1297:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF984:
	.string	"_GLIBCXX_HAVE_ISINFF 1"
.LASF422:
	.string	"_DEBUG 1"
.LASF1616:
	.string	"_unused2"
.LASF982:
	.string	"_GLIBCXX_HAVE_INT64_T_LONG 1"
.LASF793:
	.string	"__CFLOAT64X _Complex long double"
.LASF264:
	.string	"__FLT32_DIG__ 6"
.LASF1167:
	.string	"_WCHAR_T_DEFINED "
.LASF1602:
	.string	"_fileno"
.LASF819:
	.string	"_GLIBCXX17_INLINE inline"
.LASF1377:
	.string	"ADJ_SETOFFSET 0x0100"
.LASF526:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF1241:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF487:
	.string	"_DYNAMIC_STACK_SIZE_SOURCE 1"
.LASF903:
	.string	"_PSTL_HIDE_FROM_ABI_PUSH "
.LASF1434:
	.string	"st_ctime st_ctim.tv_sec"
.LASF1519:
	.string	"STATX_UID 0x00000008U"
.LASF559:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF750:
	.string	"TMP_MAX 238328"
.LASF1573:
	.string	"END_LOG do { fprintf(LOG_FILE, SEPARATOR SEPARATOR \"\\n\\n\"); fprintf(LOG_FILE, SEPARATOR \"  END  \" SEPARATOR \"\\n\\n\"); fprintf(LOG_FILE, SEPARATOR SEPARATOR \"\\n\"); } while (0)"
.LASF492:
	.string	"__USE_ISOCXX11 1"
.LASF279:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF430:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF219:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF990:
	.string	"_GLIBCXX_HAVE_LDEXPF 1"
.LASF867:
	.string	"_GLIBCXX_WEAK_DEFINITION "
.LASF963:
	.string	"_GLIBCXX_HAVE_FCNTL_H 1"
.LASF512:
	.string	"__USE_MISC 1"
.LASF895:
	.string	"_PSTL_VERSION_MAJOR (_PSTL_VERSION / 1000)"
.LASF842:
	.string	"_GLIBCXX_BEGIN_NAMESPACE_ALGO "
.LASF276:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF184:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF1221:
	.string	"__pid_t_defined "
.LASF1234:
	.string	"_BITS_ENDIAN_H 1"
.LASF901:
	.string	"_PSTL_STRING(x) _PSTL_STRING_AUX(x)"
.LASF583:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF351:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF1018:
	.string	"_GLIBCXX_HAVE_POSIX_MEMALIGN 1"
.LASF282:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF1432:
	.string	"st_atime st_atim.tv_sec"
.LASF1181:
	.string	"WNOWAIT 0x01000000"
.LASF399:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF146:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF1669:
	.string	"mkdir"
.LASF45:
	.string	"__WCHAR_TYPE__ int"
.LASF968:
	.string	"_GLIBCXX_HAVE_FLOAT_H 1"
.LASF1631:
	.string	"7lldiv_t"
.LASF2:
	.string	"__STDC__ 1"
.LASF1436:
	.string	"_STATBUF_ST_RDEV "
.LASF538:
	.string	"__STRING(x) #x"
.LASF1152:
	.string	"_GLIBCXX_X86_RDRAND 1"
.LASF594:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF202:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF358:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF1128:
	.string	"_GLIBCXX_USE_FCHMODAT 1"
.LASF1279:
	.string	"NFDBITS __NFDBITS"
.LASF530:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF1362:
	.string	"CLOCK_REALTIME_COARSE 5"
.LASF1503:
	.string	"__BITS_PER_LONG 64"
.LASF235:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF576:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF849:
	.string	"_GLIBCXX_NAMESPACE_LDBL_OR_CXX11 _GLIBCXX_NAMESPACE_CXX11"
.LASF931:
	.string	"_PSTL_PRAGMA_MESSAGE_POLICIES(x) "
.LASF547:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF837:
	.string	"_GLIBCXX_END_NAMESPACE_VERSION "
.LASF725:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF517:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF1607:
	.string	"_shortbuf"
.LASF419:
	.string	"__ELF__ 1"
.LASF925:
	.string	"_PSTL_PRAGMA_DECLARE_REDUCTION(NAME,OP) _PSTL_PRAGMA(omp declare reduction(NAME:OP : omp_out(omp_in)) initializer(omp_priv = omp_orig))"
.LASF1032:
	.string	"_GLIBCXX_HAVE_SOCKATMARK 1"
.LASF453:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF989:
	.string	"_GLIBCXX_HAVE_LC_MESSAGES 1"
.LASF1420:
	.string	"__CORRECT_ISO_CPP_STRINGS_H_PROTO "
.LASF830:
	.string	"_GLIBCXX_USE_CXX11_ABI 1"
.LASF1159:
	.string	"__WCHAR_T__ "
.LASF1657:
	.string	"isgraph"
.LASF1175:
	.string	"_STDLIB_H 1"
.LASF1482:
	.string	"S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)"
.LASF816:
	.string	"_GLIBCXX14_CONSTEXPR constexpr"
.LASF586:
	.string	"__restrict_arr "
.LASF656:
	.string	"__need___va_list"
.LASF859:
	.string	"_GLIBCXX_OS_DEFINES 1"
.LASF98:
	.string	"__cpp_inheriting_constructors 201511L"
.LASF1131:
	.string	"_GLIBCXX_USE_INT128 1"
.LASF149:
	.string	"__SHRT_WIDTH__ 16"
.LASF368:
	.string	"__STRICT_ANSI__ 1"
.LASF726:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF1064:
	.string	"_GLIBCXX_HAVE_TANHF 1"
.LASF664:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF243:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF956:
	.string	"_GLIBCXX_HAVE_ENDIAN_H 1"
.LASF227:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF298:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF143:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF545:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF872:
	.string	"_GLIBCXX_FAST_MATH 0"
.LASF715:
	.string	"__FD_SETSIZE 1024"
.LASF673:
	.string	"__STD_TYPE typedef"
.LASF972:
	.string	"_GLIBCXX_HAVE_FMODL 1"
.LASF1634:
	.string	"time_t"
.LASF959:
	.string	"_GLIBCXX_HAVE_EXPF 1"
.LASF130:
	.string	"__STDCPP_DEFAULT_NEW_ALIGNMENT__ 16"
.LASF1588:
	.string	"_flags"
.LASF1019:
	.string	"_GLIBCXX_HAVE_POSIX_SEMAPHORE 1"
.LASF876:
	.string	"_GLIBCXX_USE_C99_STDIO _GLIBCXX11_USE_C99_STDIO"
.LASF1048:
	.string	"_GLIBCXX_HAVE_SYMVER_SYMBOL_RENAMING_RUNTIME_SUPPORT 1"
.LASF748:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF1325:
	.string	"calloc"
.LASF1379:
	.string	"ADJ_NANO 0x2000"
.LASF873:
	.string	"__N(msgid) (msgid)"
.LASF1220:
	.string	"__uid_t_defined "
.LASF847:
	.string	"_GLIBCXX_BEGIN_NAMESPACE_LDBL "
.LASF1488:
	.string	"S_IXGRP (S_IXUSR >> 3)"
.LASF662:
	.string	"__U32_TYPE unsigned int"
.LASF724:
	.string	"__struct_FILE_defined 1"
.LASF762:
	.string	"RENAME_WHITEOUT (1 << 2)"
.LASF731:
	.string	"_IO_USER_LOCK 0x8000"
.LASF1486:
	.string	"S_IRGRP (S_IRUSR >> 3)"
.LASF677:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF178:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF1341:
	.string	"strtol"
.LASF742:
	.string	"SEEK_SET 0"
.LASF606:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF451:
	.string	"__USE_MISC"
.LASF204:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF1137:
	.string	"_GLIBCXX_USE_PTHREAD_COND_CLOCKWAIT 1"
.LASF1705:
	.string	"openNewLogFile"
.LASF809:
	.string	"_GLIBCXX17_DEPRECATED_SUGGEST(ALT) _GLIBCXX_DEPRECATED_SUGGEST(ALT)"
.LASF733:
	.string	"_VA_LIST_DEFINED "
.LASF357:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF1219:
	.string	"__nlink_t_defined "
.LASF138:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1056:
	.string	"_GLIBCXX_HAVE_SYS_STATVFS_H 1"
.LASF1158:
	.string	"__wchar_t__ "
.LASF274:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF1608:
	.string	"_lock"
.LASF442:
	.string	"__USE_XOPEN_EXTENDED"
.LASF1683:
	.string	"loggingPrint"
.LASF1670:
	.string	"isFileExists"
.LASF595:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF749:
	.string	"L_tmpnam 20"
.LASF682:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF63:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF167:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF304:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF846:
	.string	"_GLIBCXX_NAMESPACE_LDBL "
.LASF374:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF940:
	.string	"_GLIBCXX_HAVE_AS_SYMVER_DIRECTIVE 1"
.LASF74:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF978:
	.string	"_GLIBCXX_HAVE_HYPOTF 1"
.LASF1322:
	.string	"atoi"
.LASF711:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF1323:
	.string	"atol"
.LASF24:
	.string	"__SIZEOF_INT__ 4"
.LASF555:
	.string	"__glibc_c99_flexarr_available 1"
.LASF1543:
	.string	"LOGGING_H_ "
.LASF316:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF1046:
	.string	"_GLIBCXX_HAVE_STRXFRM_L 1"
.LASF1559:
	.string	"_T_PTRDIFF_ "
.LASF551:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF760:
	.string	"RENAME_NOREPLACE (1 << 0)"
.LASF1090:
	.string	"_GLIBCXX_PACKAGE__GLIBCXX_VERSION \"version-unused\""
.LASF51:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF645:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF33:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF1156:
	.string	"_GLIBCXX_INCLUDE_NEXT_C_HEADERS "
.LASF1494:
	.string	"ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)"
.LASF196:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF951:
	.string	"_GLIBCXX_HAVE_COSHF 1"
.LASF188:
	.string	"__UINT16_C(c) c"
.LASF386:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF1263:
	.string	"_SYS_SELECT_H 1"
.LASF767:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF17:
	.string	"__pic__ 2"
.LASF528:
	.string	"__glibc_has_extension(ext) 0"
.LASF1274:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1517:
	.string	"STATX_MODE 0x00000002U"
.LASF1544:
	.string	"LOG_INFO(EXPRESSION) #EXPRESSION, __FILE__, __func__, __LINE__"
.LASF20:
	.string	"__PIE__ 2"
.LASF120:
	.string	"__cpp_aggregate_bases 201603L"
.LASF1005:
	.string	"_GLIBCXX_HAVE_LOGF 1"
.LASF828:
	.string	"_GLIBCXX_EXTERN_TEMPLATE 1"
.LASF1211:
	.string	"_BITS_TYPES___LOCALE_T_H 1"
.LASF1271:
	.string	"__timeval_defined 1"
.LASF384:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF1003:
	.string	"_GLIBCXX_HAVE_LOG10F 1"
.LASF433:
	.string	"__USE_ISOC11"
.LASF892:
	.string	"_PSTL_ASSERT_MSG(_Condition,_Message) __glibcxx_assert(_Condition)"
.LASF839:
	.string	"_GLIBCXX_BEGIN_NAMESPACE_CONTAINER "
.LASF1512:
	.string	"__bitwise __bitwise__"
.LASF77:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF1430:
	.string	"_BITS_STAT_H 1"
.LASF1248:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >> 8) | (((x) & 0x0000ff00u) << 8) | (((x) & 0x000000ffu) << 24))"
.LASF605:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF147:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF110:
	.string	"__cpp_namespace_attributes 201411L"
.LASF1492:
	.string	"S_IXOTH (S_IXGRP >> 3)"
.LASF318:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF578:
	.string	"__always_inline"
.LASF1364:
	.string	"CLOCK_BOOTTIME 7"
.LASF773:
	.string	"__HAVE_FLOAT16 0"
.LASF879:
	.string	"_GLIBCXX_USE_FLOAT128 1"
.LASF1490:
	.string	"S_IROTH (S_IRGRP >> 3)"
.LASF507:
	.string	"__USE_LARGEFILE64 1"
.LASF884:
	.string	"_GLIBCXX_HAVE_BUILTIN_IS_AGGREGATE 1"
.LASF266:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF981:
	.string	"_GLIBCXX_HAVE_INT64_T 1"
.LASF297:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF5:
	.string	"__STDC_UTF_32__ 1"
.LASF176:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF1493:
	.string	"S_IRWXO (S_IRWXG >> 3)"
.LASF999:
	.string	"_GLIBCXX_HAVE_LINUX_FUTEX 1"
.LASF76:
	.string	"__INTPTR_TYPE__ long int"
.LASF862:
	.string	"_GLIBCXX_NO_OBSOLETE_ISINF_ISNAN_DYNAMIC __GLIBC_PREREQ(2,23)"
.LASF1629:
	.string	"6ldiv_t"
.LASF823:
	.string	"_GLIBCXX_THROW(_EXC) "
.LASF1317:
	.string	"abort"
.LASF1134:
	.string	"_GLIBCXX_USE_LSTAT 1"
.LASF1594:
	.string	"_IO_write_end"
.LASF822:
	.string	"_GLIBCXX_USE_NOEXCEPT noexcept"
.LASF193:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF57:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF938:
	.string	"_GLIBCXX_HAVE_ASINF 1"
.LASF692:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1250:
	.string	"_BITS_UINTN_IDENTITY_H 1"
.LASF561:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF854:
	.string	"_GLIBCXX_SYNCHRONIZATION_HAPPENS_BEFORE(A) "
.LASF638:
	.string	"_T_SIZE_ "
.LASF944:
	.string	"_GLIBCXX_HAVE_ATANL 1"
.LASF1345:
	.string	"wctomb"
.LASF324:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF533:
	.string	"__NTH(fct) __LEAF_ATTR fct __THROW"
.LASF1267:
	.string	"__FD_ISSET(d,s) ((__FDS_BITS (s)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF426:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF591:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF501:
	.string	"__USE_UNIX98 1"
.LASF1104:
	.string	"_GLIBCXX_FULLY_DYNAMIC_STRING 0"
.LASF1372:
	.string	"ADJ_MAXERROR 0x0004"
.LASF172:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF174:
	.string	"__INT8_C(c) c"
.LASF1327:
	.string	"free"
.LASF611:
	.string	"__stub_chflags "
.LASF598:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF124:
	.string	"__cpp_structured_bindings 201606L"
.LASF986:
	.string	"_GLIBCXX_HAVE_ISNANF 1"
.LASF1422:
	.string	"_ISbit(bit) ((bit) < 8 ? ((1 << (bit)) << 8) : ((1 << (bit)) >> 8))"
.LASF720:
	.string	"____mbstate_t_defined 1"
.LASF1192:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF218:
	.string	"__FLT_MAX_EXP__ 128"
.LASF12:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF1380:
	.string	"ADJ_TICK 0x4000"
.LASF85:
	.string	"__cpp_runtime_arrays 198712L"
.LASF615:
	.string	"__stub_setlogin "
.LASF777:
	.string	"__HAVE_FLOAT128X 0"
.LASF1590:
	.string	"_IO_read_end"
.LASF466:
	.string	"_ISOC99_SOURCE"
.LASF1697:
	.string	"LOG_TIME_TEMP"
.LASF845:
	.string	"_GLIBCXX_LONG_DOUBLE_ALT128_COMPAT"
.LASF335:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF263:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF617:
	.string	"__stub_stty "
.LASF1661:
	.string	"_Z11getFileSizePKc"
.LASF852:
	.string	"__glibcxx_constexpr_assert(cond) if (__builtin_is_constant_evaluated() && !bool(cond)) __builtin_unreachable()"
.LASF300:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF342:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF1099:
	.string	"_GLIBCXX98_USE_C99_MATH 1"
.LASF1084:
	.string	"LT_OBJDIR \".libs/\""
.LASF158:
	.string	"__INTMAX_C(c) c ## L"
.LASF1668:
	.string	"fopen"
.LASF175:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF1672:
	.string	"__initialize_p"
.LASF79:
	.string	"__DEPRECATED 1"
.LASF135:
	.string	"__cpp_exceptions 199711L"
.LASF1659:
	.string	"strdup"
.LASF1087:
	.string	"_GLIBCXX_PACKAGE_STRING \"package-unused version-unused\""
.LASF1189:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF209:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF200:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF835:
	.string	"_GLIBCXX_INLINE_VERSION 0"
.LASF1643:
	.string	"__gnu_cxx"
.LASF964:
	.string	"_GLIBCXX_HAVE_FENV_H 1"
.LASF769:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF1053:
	.string	"_GLIBCXX_HAVE_SYS_SDT_H 1"
.LASF550:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF365:
	.string	"__USER_LABEL_PREFIX__ "
.LASF532:
	.string	"__THROWNL __THROW"
.LASF727:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF1022:
	.string	"_GLIBCXX_HAVE_QUICK_EXIT 1"
.LASF961:
	.string	"_GLIBCXX_HAVE_FABSF 1"
.LASF646:
	.string	"_SIZE_T_DECLARED "
.LASF516:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF1373:
	.string	"ADJ_ESTERROR 0x0008"
.LASF252:
	.string	"__DECIMAL_DIG__ 21"
.LASF619:
	.string	"__GLIBC_USE_LIB_EXT2 1"
.LASF674:
	.string	"_BITS_TYPESIZES_H 1"
.LASF1622:
	.string	"__float128"
.LASF471:
	.string	"_ISOC2X_SOURCE 1"
.LASF747:
	.string	"P_tmpdir \"/tmp\""
.LASF1140:
	.string	"_GLIBCXX_USE_PTHREAD_RWLOCK_T 1"
.LASF1396:
	.string	"STA_PPSTIME 0x0004"
.LASF1424:
	.string	"__toascii(c) ((c) & 0x7f)"
.LASF571:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF1214:
	.string	"__ino_t_defined "
.LASF372:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF1245:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF1160:
	.string	"_WCHAR_T "
.LASF1423:
	.string	"__isascii(c) (((c) & ~0x7f) == 0)"
.LASF1316:
	.string	"_GLIBCXX_BITS_STD_ABS_H "
.LASF630:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF955:
	.string	"_GLIBCXX_HAVE_DLFCN_H 1"
.LASF1348:
	.string	"lldiv"
.LASF1447:
	.string	"__S_TYPEISSEM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF265:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF1238:
	.string	"_BITS_ENDIANNESS_H 1"
.LASF1312:
	.string	"alloca"
.LASF1534:
	.string	"STATX_ATTR_APPEND 0x00000020"
.LASF1209:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF1431:
	.string	"_BITS_STRUCT_STAT_H 1"
.LASF868:
	.string	"_GLIBCXX_USE_WEAK_REF __GXX_WEAK__"
.LASF1565:
	.string	"_GCC_PTRDIFF_T "
.LASF322:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF1465:
	.string	"__S_ISTYPE(mode,mask) (((mode) & __S_IFMT) == (mask))"
.LASF1026:
	.string	"_GLIBCXX_HAVE_SINCOSF 1"
.LASF78:
	.string	"__GXX_WEAK__ 1"
.LASF217:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF1624:
	.string	"double"
.LASF1049:
	.string	"_GLIBCXX_HAVE_SYS_IOCTL_H 1"
.LASF112:
	.string	"__cpp_nested_namespace_definitions 201411L"
.LASF199:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF1391:
	.string	"MOD_TAI ADJ_TAI"
.LASF230:
	.string	"__DBL_MANT_DIG__ 53"
.LASF1357:
	.string	"CLOCK_REALTIME 0"
.LASF1020:
	.string	"_GLIBCXX_HAVE_POWF 1"
.LASF1151:
	.string	"_GLIBCXX_VERBOSE 1"
.LASF401:
	.string	"__k8 1"
.LASF493:
	.string	"__USE_POSIX 1"
.LASF1025:
	.string	"_GLIBCXX_HAVE_SINCOS 1"
.LASF437:
	.string	"__USE_POSIX"
.LASF993:
	.string	"_GLIBCXX_HAVE_LIMIT_AS 1"
.LASF1170:
	.string	"__INT_WCHAR_T_H "
.LASF1217:
	.string	"__gid_t_defined "
.LASF255:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF348:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF205:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF81:
	.string	"__cpp_rtti 199711L"
.LASF1154:
	.string	"_GTHREAD_USE_MUTEX_TIMEDLOCK 1"
.LASF1319:
	.string	"atexit"
.LASF602:
	.string	"__glibc_macro_warning(message) __glibc_macro_warning1 (GCC warning message)"
.LASF490:
	.string	"__USE_ISOC99 1"
.LASF1264:
	.string	"__FD_ZERO(s) do { unsigned int __i; fd_set *__arr = (s); for (__i = 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__i) __FDS_BITS (__arr)[__i] = 0; } while (0)"
.LASF472:
	.string	"_POSIX_SOURCE"
.LASF1692:
	.string	"newLogFileName"
.LASF319:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF144:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF224:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF896:
	.string	"_PSTL_VERSION_MINOR ((_PSTL_VERSION % 1000) / 10)"
.LASF1258:
	.string	"le32toh(x) __uint32_identity (x)"
.LASF936:
	.string	"_GLIBCXX_HAVE_ALIGNED_ALLOC 1"
.LASF330:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF1202:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (status)"
.LASF382:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF413:
	.string	"__CET__ 3"
.LASF191:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF620:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF1601:
	.string	"_chain"
.LASF588:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF186:
	.string	"__UINT8_C(c) c"
.LASF113:
	.string	"__cpp_fold_expressions 201603L"
.LASF270:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF1133:
	.string	"_GLIBCXX_USE_LONG_LONG 1"
.LASF626:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF1038:
	.string	"_GLIBCXX_HAVE_STDLIB_H 1"
.LASF1359:
	.string	"CLOCK_PROCESS_CPUTIME_ID 2"
.LASF47:
	.string	"__INTMAX_TYPE__ long int"
.LASF1476:
	.string	"S_ISUID __S_ISUID"
.LASF392:
	.string	"__amd64 1"
.LASF1331:
	.string	"malloc"
.LASF1119:
	.string	"_GLIBCXX_USE_C99_INTTYPES_TR1 1"
.LASF1577:
	.string	"unsigned char"
.LASF228:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF1355:
	.string	"_BITS_TIME_H 1"
.LASF908:
	.string	"_PSTL_PRAGMA_SIMD_REDUCTION(PRM) _PSTL_PRAGMA(omp simd reduction(PRM))"
.LASF34:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF1566:
	.string	"_PTRDIFF_T_DECLARED "
.LASF1218:
	.string	"__mode_t_defined "
.LASF1124:
	.string	"_GLIBCXX_USE_CLOCK_REALTIME 1"
.LASF1700:
	.string	"_IO_lock_t"
.LASF934:
	.string	"_GLIBCXX_HAVE_ACOSF 1"
.LASF215:
	.string	"__FLT_DIG__ 6"
.LASF1400:
	.string	"STA_UNSYNC 0x0040"
.LASF1451:
	.string	"__S_ISVTX 01000"
.LASF1115:
	.string	"_GLIBCXX_USE_C99 1"
.LASF1346:
	.string	"_Exit"
.LASF234:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF1437:
	.string	"_STATBUF_ST_NSEC "
.LASF435:
	.string	"__USE_ISOC95"
.LASF1516:
	.string	"STATX_TYPE 0x00000001U"
.LASF434:
	.string	"__USE_ISOC99"
.LASF187:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF1169:
	.string	"___int_wchar_t_h "
.LASF1504:
	.string	"__ASM_GENERIC_BITS_PER_LONG "
.LASF315:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF133:
	.string	"__STDCPP_THREADS__ 1"
.LASF162:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1515:
	.string	"__aligned_le64 __le64 __attribute__((aligned(8)))"
.LASF31:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF361:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF920:
	.string	"_PSTL_UDR_PRESENT 1"
.LASF1231:
	.string	"_BITS_STDINT_INTN_H 1"
.LASF395:
	.string	"__x86_64__ 1"
.LASF1558:
	.string	"_PTRDIFF_T "
.LASF479:
	.string	"_XOPEN_SOURCE_EXTENDED 1"
.LASF599:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF155:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF1243:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF444:
	.string	"__USE_XOPEN2K"
.LASF440:
	.string	"__USE_POSIX199506"
.LASF121:
	.string	"__cpp_deduction_guides 201703L"
.LASF1647:
	.string	"ERROR"
.LASF1549:
	.string	"logMessage(message) loggingPrint(MESSAGE , message , LOG_INFO(message))"
.LASF786:
	.string	"__f32(x) x ##f"
.LASF534:
	.string	"__NTHNL(fct) fct __THROW"
.LASF1024:
	.string	"_GLIBCXX_HAVE_SETENV 1"
.LASF1446:
	.string	"__S_TYPEISMQ(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF1261:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF1067:
	.string	"_GLIBCXX_HAVE_TGMATH_H 1"
.LASF840:
	.string	"_GLIBCXX_END_NAMESPACE_CONTAINER "
.LASF67:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1673:
	.string	"__priority"
.LASF577:
	.string	"__wur "
.LASF1310:
	.string	"__have_pthread_attr_t 1"
.LASF236:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF26:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF1706:
	.string	"destroyLog"
.LASF1191:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF332:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF310:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF269:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF1583:
	.string	"__mode_t"
.LASF1399:
	.string	"STA_DEL 0x0020"
.LASF799:
	.string	"_GLIBCXX_CONST __attribute__ ((__const__))"
.LASF1043:
	.string	"_GLIBCXX_HAVE_STRTOF 1"
.LASF1225:
	.string	"__clock_t_defined 1"
.LASF116:
	.string	"__cpp_constexpr 201603L"
.LASF483:
	.string	"_DEFAULT_SOURCE 1"
.LASF1166:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1097:
	.string	"_GLIBCXX11_USE_C99_WCHAR 1"
.LASF684:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF46:
	.string	"__WINT_TYPE__ unsigned int"
.LASF164:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF913:
	.string	"_PSTL_CPP17_EXECUTION_POLICIES_PRESENT (_MSC_VER >= 1912)"
.LASF237:
	.string	"__DBL_MAX__ double(1.79769313486231570814527423731704357e+308L)"
.LASF166:
	.string	"__INT16_MAX__ 0x7fff"
.LASF593:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF214:
	.string	"__FLT_MANT_DIG__ 24"
.LASF1194:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF544:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF666:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF1105:
	.string	"_GLIBCXX_HAS_GTHREADS 1"
.LASF745:
	.string	"SEEK_DATA 3"
.LASF293:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF1502:
	.string	"__ASM_X86_BITSPERLONG_H "
.LASF1138:
	.string	"_GLIBCXX_USE_PTHREAD_MUTEX_CLOCKLOCK 1"
.LASF653:
	.string	"NULL __null"
.LASF1701:
	.string	"LogLevel"
.LASF1079:
	.string	"_GLIBCXX_HAVE_WCSTOF 1"
.LASF447:
	.string	"__USE_XOPEN2K8XSI"
.LASF1536:
	.string	"STATX_ATTR_ENCRYPTED 0x00000800"
.LASF1353:
	.string	"strtold"
.LASF107:
	.string	"__cpp_digit_separators 201309L"
.LASF1499:
	.string	"_LINUX_TYPES_H "
.LASF1350:
	.string	"strtoll"
.LASF1474:
	.string	"S_TYPEISSEM(buf) __S_TYPEISSEM(buf)"
.LASF481:
	.string	"_LARGEFILE64_SOURCE 1"
.LASF156:
	.string	"__SIZE_WIDTH__ 64"
.LASF655:
	.string	"__need___va_list "
.LASF805:
	.string	"_GLIBCXX_DEPRECATED_SUGGEST(ALT) __attribute__ ((__deprecated__ (\"use '\" ALT \"' instead\")))"
.LASF778:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF1610:
	.string	"_codecvt"
.LASF511:
	.string	"__TIMESIZE __WORDSIZE"
.LASF173:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF1593:
	.string	"_IO_write_ptr"
.LASF216:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF1336:
	.string	"quick_exit"
.LASF337:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF744:
	.string	"SEEK_END 2"
.LASF770:
	.string	"__f128(x) x ##q"
.LASF37:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1269:
	.string	"____sigset_t_defined "
.LASF1233:
	.string	"_ENDIAN_H 1"
.LASF213:
	.string	"__FLT_RADIX__ 2"
.LASF180:
	.string	"__INT32_C(c) c"
.LASF601:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF262:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF312:
	.string	"__FLT32X_DIG__ 15"
.LASF1511:
	.string	"__bitwise__ "
.LASF1001:
	.string	"_GLIBCXX_HAVE_LINUX_TYPES_H 1"
.LASF814:
	.string	"_GLIBCXX_CONSTEXPR constexpr"
.LASF454:
	.string	"__USE_GNU"
.LASF211:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF1497:
	.string	"S_BLKSIZE 512"
.LASF82:
	.string	"__GXX_EXPERIMENTAL_CXX0X__ 1"
.LASF803:
	.string	"_GLIBCXX_USE_DEPRECATED 1"
.LASF117:
	.string	"__cpp_if_constexpr 201606L"
.LASF359:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF1326:
	.string	"exit"
.LASF780:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF302:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF831:
	.string	"_GLIBCXX_NAMESPACE_CXX11 __cxx11::"
.LASF1537:
	.string	"STATX_ATTR_AUTOMOUNT 0x00001000"
.LASF1681:
	.string	"line"
.LASF349:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF456:
	.string	"__KERNEL_STRICT_NAMES"
.LASF1649:
	.string	"MESSAGE"
.LASF48:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF855:
	.string	"_GLIBCXX_SYNCHRONIZATION_HAPPENS_AFTER(A) "
.LASF672:
	.string	"__U64_TYPE unsigned long int"
.LASF311:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF716:
	.string	"_BITS_TIME64_H 1"
.LASF1301:
	.string	"__ONCE_ALIGNMENT "
.LASF72:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF1050:
	.string	"_GLIBCXX_HAVE_SYS_IPC_H 1"
.LASF50:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF696:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF150:
	.string	"__INT_WIDTH__ 32"
.LASF563:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF1060:
	.string	"_GLIBCXX_HAVE_SYS_TYPES_H 1"
.LASF59:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF306:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF825:
	.string	"_GLIBCXX_THROW_OR_ABORT(_EXC) (throw (_EXC))"
.LASF1185:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF1691:
	.string	"size"
.LASF763:
	.string	"__attr_dealloc_fclose"
.LASF449:
	.string	"__USE_LARGEFILE64"
.LASF278:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF1232:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF1076:
	.string	"_GLIBCXX_HAVE_VSWSCANF 1"
.LASF579:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF1455:
	.string	"UTIME_NOW ((1l << 30) - 1l)"
.LASF23:
	.string	"__LP64__ 1"
.LASF514:
	.string	"__USE_DYNAMIC_STACK_SIZE 1"
.LASF832:
	.string	"_GLIBCXX_BEGIN_NAMESPACE_CXX11 namespace __cxx11 {"
.LASF660:
	.string	"__U16_TYPE unsigned short int"
.LASF1533:
	.string	"STATX_ATTR_IMMUTABLE 0x00000010"
.LASF1255:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF900:
	.string	"_PSTL_STRING_AUX(x) #x"
.LASF574:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF1406:
	.string	"STA_CLOCKERR 0x1000"
.LASF1083:
	.string	"_GLIBCXX_ICONV_CONST "
.LASF1496:
	.string	"DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)"
.LASF1392:
	.string	"MOD_MICRO ADJ_MICRO"
.LASF942:
	.string	"_GLIBCXX_HAVE_ATAN2L 1"
.LASF258:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF411:
	.string	"__SEG_FS 1"
.LASF564:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF317:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF1646:
	.string	"FATAL"
.LASF376:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1143:
	.string	"_GLIBCXX_USE_SCHED_YIELD 1"
.LASF53:
	.string	"__INT16_TYPE__ short int"
.LASF296:
	.string	"__FLT128_DIG__ 33"
.LASF460:
	.string	"__KERNEL_STRICT_NAMES "
.LASF958:
	.string	"_GLIBCXX_HAVE_EXECINFO_H 1"
.LASF723:
	.string	"__FILE_defined 1"
.LASF239:
	.string	"__DBL_MIN__ double(2.22507385850720138309023271733240406e-308L)"
.LASF775:
	.string	"__HAVE_FLOAT64 1"
.LASF1277:
	.string	"__FDS_BITS(set) ((set)->fds_bits)"
.LASF829:
	.string	"_GLIBCXX_USE_DUAL_ABI 1"
.LASF647:
	.string	"___int_size_t_h "
.LASF407:
	.string	"__FXSR__ 1"
.LASF66:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF1528:
	.string	"STATX_BTIME 0x00000800U"
.LASF643:
	.string	"_SIZE_T_DEFINED_ "
.LASF1376:
	.string	"ADJ_TAI 0x0080"
.LASF1582:
	.string	"size_t"
.LASF994:
	.string	"_GLIBCXX_HAVE_LIMIT_DATA 1"
.LASF380:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF1244:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF1369:
	.string	"_BITS_TIMEX_H 1"
.LASF761:
	.string	"RENAME_EXCHANGE (1 << 1)"
.LASF1428:
	.string	"__exctype_l(name) extern int name (int, locale_t) __THROW"
.LASF1525:
	.string	"STATX_SIZE 0x00000200U"
.LASF1106:
	.string	"_GLIBCXX_HOSTED 1"
.LASF698:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF967:
	.string	"_GLIBCXX_HAVE_FINITEL 1"
.LASF145:
	.string	"__WINT_MIN__ 0U"
.LASF1626:
	.string	"quot"
.LASF612:
	.string	"__stub_fchflags "
.LASF752:
	.string	"L_ctermid 9"
.LASF1687:
	.string	"_Z12loggingPrintjdPKcS0_S0_i"
.LASF1572:
	.ascii	"START_LOG do "
	.string	"{ fprintf(LOG_FILE, SEPARATOR SEPARATOR \"\\n\"); time_t LOG_TIME_TEMP = 0; time(&LOG_TIME_TEMP); fprintf(LOG_FILE, \"%s\", ctime(&LOG_TIME_TEMP)); fprintf(LOG_FILE, SEPARATOR \" START \" SEPARATOR \"\\n\\n\"); fprintf(LOG_FILE, SEPARATOR SEPARATOR \"\\n\"); } while (0)"
.LASF1329:
	.string	"labs"
.LASF652:
	.string	"NULL"
.LASF1698:
	.string	"GNU C++17 11.2.0 -mtune=generic -march=x86-64 -ggdb3 -O0 -std=c++17 -fcheck-new -fsized-deallocation -fstack-protector -fstrict-overflow -fno-omit-frame-pointer -fPIE -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection"
.LASF253:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF1302:
	.string	"_BITS_ATOMIC_WIDE_COUNTER_H "
.LASF1546:
	.string	"LOG_FILE_PREFIX \"log\""
.LASF463:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF89:
	.string	"__cpp_lambdas 200907L"
.LASF441:
	.string	"__USE_XOPEN"
.LASF393:
	.string	"__amd64__ 1"
.LASF482:
	.string	"_DEFAULT_SOURCE"
.LASF907:
	.string	"_PSTL_PRAGMA_DECLARE_SIMD _PSTL_PRAGMA(omp declare simd)"
.LASF1153:
	.string	"_GLIBCXX_X86_RDSEED 1"
.LASF937:
	.string	"_GLIBCXX_HAVE_ARPA_INET_H 1"
.LASF1216:
	.string	"__dev_t_defined "
.LASF509:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF387:
	.string	"__SSP__ 1"
.LASF1254:
	.string	"le16toh(x) __uint16_identity (x)"
.LASF1171:
	.string	"_GCC_WCHAR_T "
.LASF1674:
	.string	"dataString"
.LASF841:
	.string	"_GLIBCXX_STD_A std"
.LASF1509:
	.string	"__kernel_old_dev_t __kernel_old_dev_t"
.LASF134:
	.string	"__EXCEPTIONS 1"
.LASF94:
	.string	"__cpp_variadic_templates 200704L"
.LASF919:
	.string	"_PSTL_MONOTONIC_PRESENT (__INTEL_COMPILER >= 1800)"
.LASF1196:
	.string	"__WCOREFLAG 0x80"
.LASF668:
	.string	"__UWORD_TYPE unsigned long int"
.LASF233:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF1597:
	.string	"_IO_save_base"
.LASF1136:
	.string	"_GLIBCXX_USE_NLS 1"
.LASF632:
	.string	"__need_size_t "
.LASF15:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF1413:
	.string	"TIME_UTC 1"
.LASF125:
	.string	"__cpp_variadic_using 201611L"
.LASF1303:
	.string	"_THREAD_MUTEX_INTERNAL_H 1"
.LASF808:
	.string	"_GLIBCXX17_DEPRECATED [[__deprecated__]]"
.LASF248:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF1226:
	.string	"__clockid_t_defined 1"
.LASF1173:
	.string	"_BSD_WCHAR_T_"
.LASF137:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF385:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF1058:
	.string	"_GLIBCXX_HAVE_SYS_SYSINFO_H 1"
.LASF597:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF641:
	.string	"_SIZE_T_ "
.LASF703:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF1013:
	.string	"_GLIBCXX_HAVE_NETDB_H 1"
.LASF88:
	.string	"__cpp_user_defined_literals 200809L"
.LASF1280:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF104:
	.string	"__cpp_decltype_auto 201304L"
.LASF1102:
	.string	"_GLIBCXX98_USE_C99_WCHAR 1"
.LASF651:
	.string	"__need_size_t"
.LASF1028:
	.string	"_GLIBCXX_HAVE_SINF 1"
.LASF1695:
	.string	"isNameCorrect"
.LASF1247:
	.string	"__bswap_constant_16(x) ((__uint16_t) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF504:
	.string	"__USE_XOPEN2K8XSI 1"
.LASF806:
	.string	"_GLIBCXX11_DEPRECATED _GLIBCXX_DEPRECATED"
.LASF1514:
	.string	"__aligned_be64 __be64 __attribute__((aligned(8)))"
.LASF1633:
	.string	"lldiv_t"
.LASF1411:
	.string	"__struct_tm_defined 1"
.LASF1332:
	.string	"mblen"
.LASF360:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1467:
	.string	"S_ISCHR(mode) __S_ISTYPE((mode), __S_IFCHR)"
.LASF467:
	.string	"_ISOC99_SOURCE 1"
.LASF55:
	.string	"__INT64_TYPE__ long int"
.LASF350:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF1070:
	.string	"_GLIBCXX_HAVE_TRUNCATE 1"
.LASF995:
	.string	"_GLIBCXX_HAVE_LIMIT_FSIZE 1"
.LASF1145:
	.string	"_GLIBCXX_USE_SENDFILE 1"
.LASF997:
	.string	"_GLIBCXX_HAVE_LIMIT_VMEM 0"
.LASF1368:
	.string	"TIMER_ABSTIME 1"
.LASF1485:
	.string	"S_IEXEC S_IXUSR"
.LASF1075:
	.string	"_GLIBCXX_HAVE_VFWSCANF 1"
.LASF1072:
	.string	"_GLIBCXX_HAVE_UNISTD_H 1"
.LASF443:
	.string	"__USE_UNIX98"
.LASF1614:
	.string	"__pad5"
.LASF918:
	.string	"_PSTL_EARLYEXIT_PRESENT (__INTEL_COMPILER >= 1800)"
.LASF1611:
	.string	"_wide_data"
.LASF505:
	.string	"__USE_XOPEN2KXSI 1"
.LASF537:
	.string	"__CONCAT(x,y) x ## y"
.LASF238:
	.string	"__DBL_NORM_MAX__ double(1.79769313486231570814527423731704357e+308L)"
.LASF1199:
	.string	"WSTOPSIG(status) __WSTOPSIG (status)"
.LASF939:
	.string	"_GLIBCXX_HAVE_ASINL 1"
.LASF1538:
	.string	"STATX_ATTR_MOUNT_ROOT 0x00002000"
.LASF148:
	.string	"__SCHAR_WIDTH__ 8"
.LASF613:
	.string	"__stub_gtty "
.LASF1500:
	.string	"_ASM_GENERIC_TYPES_H "
.LASF36:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF710:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF1266:
	.string	"__FD_CLR(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] &= ~__FD_MASK(d)))"
.LASF1120:
	.string	"_GLIBCXX_USE_C99_INTTYPES_WCHAR_T_TR1 1"
.LASF1270:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF818:
	.string	"_GLIBCXX20_CONSTEXPR "
.LASF772:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF1334:
	.string	"mbtowc"
.LASF1141:
	.string	"_GLIBCXX_USE_RANDOM_TR1 1"
.LASF1478:
	.string	"S_ISVTX __S_ISVTX"
.LASF1236:
	.string	"__BIG_ENDIAN 4321"
.LASF406:
	.string	"__SSE2__ 1"
.LASF804:
	.string	"_GLIBCXX_DEPRECATED __attribute__ ((__deprecated__))"
.LASF861:
	.string	"_GLIBCXX_HAVE_GETS"
.LASF154:
	.string	"__WINT_WIDTH__ 32"
.LASF91:
	.string	"__cpp_attributes 200809L"
.LASF712:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF1387:
	.string	"MOD_STATUS ADJ_STATUS"
.LASF1644:
	.string	"_ZSt3divll"
.LASF891:
	.string	"_PSTL_ASSERT(_Condition) __glibcxx_assert(_Condition)"
.LASF880:
	.string	"_GLIBCXX_FLOAT_IS_IEEE_BINARY32 1"
.LASF1034:
	.string	"_GLIBCXX_HAVE_SQRTL 1"
.LASF914:
	.string	"_PSTL_CPP14_2RANGE_MISMATCH_EQUAL_PRESENT (_MSC_VER >= 1900 || __cplusplus >= 201300L || __cpp_lib_robust_nonmodifying_seq_ops == 201304)"
.LASF1507:
	.string	"_ASM_X86_POSIX_TYPES_64_H "
.LASF1286:
	.string	"__fsblkcnt_t_defined "
.LASF1054:
	.string	"_GLIBCXX_HAVE_SYS_SEM_H 1"
.LASF161:
	.string	"__INTMAX_WIDTH__ 64"
.LASF1242:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF657:
	.string	"__GNUC_VA_LIST "
.LASF1513:
	.string	"__aligned_u64 __u64 __attribute__((aligned(8)))"
.LASF899:
	.string	"_PSTL_PRAGMA(x) _Pragma(#x)"
.LASF515:
	.string	"__USE_GNU 1"
.LASF1094:
	.string	"_GLIBCXX11_USE_C99_MATH 1"
.LASF1529:
	.string	"STATX_MNT_ID 0x00001000U"
.LASF1677:
	.string	"value"
.LASF1287:
	.string	"__fsfilcnt_t_defined "
.LASF1227:
	.string	"__time_t_defined 1"
.LASF1176:
	.string	"WNOHANG 1"
.LASF119:
	.string	"__cpp_inline_variables 201606L"
.LASF1296:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF11:
	.string	"__ATOMIC_RELAXED 0"
.LASF159:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF1483:
	.string	"S_IREAD S_IRUSR"
.LASF1040:
	.string	"_GLIBCXX_HAVE_STRERROR_R 1"
.LASF427:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF108:
	.string	"__cpp_unicode_characters 201411L"
.LASF519:
	.string	"__GNU_LIBRARY__"
.LASF1363:
	.string	"CLOCK_MONOTONIC_COARSE 6"
.LASF513:
	.string	"__USE_ATFILE 1"
.LASF56:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF739:
	.string	"_IONBF 2"
.LASF980:
	.string	"_GLIBCXX_HAVE_ICONV 1"
.LASF1460:
	.string	"S_IFBLK __S_IFBLK"
.LASF1080:
	.string	"_GLIBCXX_HAVE_WCTYPE_H 1"
.LASF833:
	.string	"_GLIBCXX_END_NAMESPACE_CXX11 }"
.LASF922:
	.string	"_PSTL_PRAGMA_SIMD_EARLYEXIT "
.LASF208:
	.string	"__GCC_IEC_559 2"
.LASF869:
	.string	"_GLIBCXX_TXN_SAFE "
.LASF1658:
	.string	"fprintf"
.LASF1702:
	.string	"decltype(nullptr)"
.LASF974:
	.string	"_GLIBCXX_HAVE_FREXPL 1"
.LASF464:
	.string	"_ISOC95_SOURCE"
.LASF1118:
	.string	"_GLIBCXX_USE_C99_FENV_TR1 1"
.LASF1178:
	.string	"WSTOPPED 2"
.LASF1690:
	.string	"getNewLogFileName"
.LASF1125:
	.string	"_GLIBCXX_USE_DECIMAL_FLOAT 1"
.LASF1284:
	.string	"__blksize_t_defined "
.LASF1662:
	.string	"fclose"
.LASF1342:
	.string	"strtoul"
.LASF1179:
	.string	"WEXITED 4"
.LASF195:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF889:
	.string	"_GLIBCXX_USE_TBB_PAR_BACKEND __has_include(<tbb/tbb.h>)"
.LASF1085:
	.string	"_GLIBCXX_PACKAGE_BUGREPORT \"\""
.LASF525:
	.string	"__PMT"
.LASF1172:
	.string	"_WCHAR_T_DECLARED "
.LASF14:
	.string	"__ATOMIC_RELEASE 3"
.LASF168:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF1630:
	.string	"ldiv_t"
.LASF1300:
	.string	"__LOCK_ALIGNMENT "
.LASF1101:
	.string	"_GLIBCXX98_USE_C99_STDLIB 1"
.LASF408:
	.string	"__SSE_MATH__ 1"
.LASF7:
	.string	"__GNUC__ 11"
.LASF198:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF334:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF1188:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF423:
	.string	"_STDC_PREDEF_H 1"
.LASF1508:
	.string	"__kernel_old_uid_t __kernel_old_uid_t"
.LASF181:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF212:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF1344:
	.string	"wcstombs"
.LASF245:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF1547:
	.string	"LOG_FILE_SUFFIX \"txt\""
.LASF390:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF1574:
	.ascii	"NEW_LOG_FILE do"
	.string	" { fprintf(LOG_FILE, SEPARATOR SEPARATOR \"\\n\"); time_t LOG_TIME_TEMP = 0; time(&LOG_TIME_TEMP); fprintf(LOG_FILE, \"%s\", ctime(&LOG_TIME_TEMP)); fprintf(LOG_FILE, SEPARATOR \"NEWFILE\" SEPARATOR \"\\n\\n\"); fprintf(LOG_FILE, SEPARATOR SEPARATOR \"\\n\"); } while(0)"
.LASF1086:
	.string	"_GLIBCXX_PACKAGE_NAME \"package-unused\""
.LASF768:
	.string	"__HAVE_FLOAT64X 1"
.LASF1684:
	.string	"_Z12loggingPrintjPKcS0_S0_S0_i"
.LASF111:
	.string	"__cpp_enumerator_attributes 201411L"
.LASF734:
	.string	"__off_t_defined "
.LASF139:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF584:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF824:
	.string	"_GLIBCXX_NOTHROW _GLIBCXX_USE_NOEXCEPT"
.LASF60:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF136:
	.string	"__GXX_ABI_VERSION 1016"
.LASF827:
	.string	"_GLIBCXX_NOEXCEPT_QUAL noexcept (_NE)"
.LASF510:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF1180:
	.string	"WCONTINUED 8"
.LASF307:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF663:
	.string	"__SLONGWORD_TYPE long int"
.LASF546:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF294:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF256:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF389:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF1545:
	.string	"LOG_DIRECTORY \".log/\""
.LASF906:
	.string	"_PSTL_PRAGMA_SIMD _PSTL_PRAGMA(omp simd)"
.LASF210:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF1410:
	.string	"STA_RONLY (STA_PPSSIGNAL | STA_PPSJITTER | STA_PPSWANDER | STA_PPSERROR | STA_CLOCKERR | STA_NANO | STA_MODE | STA_CLK)"
.LASF521:
	.string	"__GLIBC__ 2"
.LASF165:
	.string	"__INT8_MAX__ 0x7f"
.LASF932:
	.string	"_PSTL_CPP11_STD_ROTATE_BROKEN ((__GLIBCXX__ && __GLIBCXX__ < 20150716) || (_MSC_VER && _MSC_VER < 1800))"
.LASF1365:
	.string	"CLOCK_REALTIME_ALARM 8"
.LASF1164:
	.string	"_WCHAR_T_ "
.LASF13:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF1023:
	.string	"_GLIBCXX_HAVE_READLINK 1"
.LASF848:
	.string	"_GLIBCXX_END_NAMESPACE_LDBL "
.LASF1584:
	.string	"__off_t"
.LASF1129:
	.string	"_GLIBCXX_USE_GETTIMEOFDAY 1"
.LASF1654:
	.string	"MAX_LOG_FILE_SIZE"
.LASF1466:
	.string	"S_ISDIR(mode) __S_ISTYPE((mode), __S_IFDIR)"
.LASF535:
	.string	"__P(args) args"
.LASF1389:
	.string	"MOD_CLKB ADJ_TICK"
.LASF1016:
	.string	"_GLIBCXX_HAVE_POLL 1"
.LASF784:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF1081:
	.string	"_GLIBCXX_HAVE_WRITEV 1"
.LASF118:
	.string	"__cpp_capture_star_this 201603L"
.LASF1109:
	.string	"_GLIBCXX_STDIO_EOF -1"
.LASF637:
	.string	"_SYS_SIZE_T_H "
.LASF688:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1135:
	.string	"_GLIBCXX_USE_NANOSLEEP 1"
.LASF1229:
	.string	"__useconds_t_defined "
.LASF1002:
	.string	"_GLIBCXX_HAVE_LOCALE_H 1"
.LASF1147:
	.string	"_GLIBCXX_USE_TMPNAM 1"
.LASF1676:
	.string	"level"
.LASF286:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF1416:
	.string	"__CORRECT_ISO_CPP_STRING_H_PROTO "
.LASF1045:
	.string	"_GLIBCXX_HAVE_STRUCT_DIRENT_D_TYPE 1"
.LASF394:
	.string	"__x86_64 1"
.LASF1680:
	.string	"functionName"
.LASF1401:
	.string	"STA_FREQHOLD 0x0080"
.LASF791:
	.string	"__CFLOAT64 _Complex double"
.LASF1299:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF1111:
	.string	"_GLIBCXX_STDIO_SEEK_END 2"
.LASF1678:
	.string	"name"
.LASF455:
	.string	"__USE_FORTIFY_LEVEL"
.LASF1468:
	.string	"S_ISBLK(mode) __S_ISTYPE((mode), __S_IFBLK)"
.LASF114:
	.string	"__cpp_nontype_template_args 201411L"
.LASF1671:
	.string	"_Z12isFileExistsPKc"
.LASF1599:
	.string	"_IO_save_end"
.LASF1230:
	.string	"__suseconds_t_defined "
.LASF699:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF1289:
	.string	"_THREAD_SHARED_TYPES_H 1"
.LASF1057:
	.string	"_GLIBCXX_HAVE_SYS_STAT_H 1"
.LASF1281:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF1339:
	.string	"srand"
.LASF446:
	.string	"__USE_XOPEN2K8"
.LASF1006:
	.string	"_GLIBCXX_HAVE_LOGL 1"
.LASF429:
	.string	"_STDIO_H 1"
.LASF977:
	.string	"_GLIBCXX_HAVE_HYPOT 1"
.LASF1265:
	.string	"__FD_SET(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] |= __FD_MASK(d)))"
.LASF700:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF654:
	.string	"__need_NULL"
.LASF853:
	.string	"__glibcxx_assert(cond) do { __glibcxx_constexpr_assert(cond); } while (false)"
.LASF459:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF916:
	.string	"_PSTL_CPP14_INTEGER_SEQUENCE_PRESENT (_MSC_VER >= 1900 || __cplusplus >= 201402L)"
.LASF448:
	.string	"__USE_LARGEFILE"
.LASF344:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF1484:
	.string	"S_IWRITE S_IWUSR"
.LASF1586:
	.string	"__time_t"
.LASF1375:
	.string	"ADJ_TIMECONST 0x0020"
.LASF369:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF975:
	.string	"_GLIBCXX_HAVE_GETIPINFO 1"
.LASF542:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF495:
	.string	"__USE_POSIX199309 1"
.LASF58:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF870:
	.string	"_GLIBCXX_TXN_SAFE_DYN "
.LASF1036:
	.string	"_GLIBCXX_HAVE_STDBOOL_H 1"
.LASF566:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF328:
	.string	"__FLT64X_DIG__ 18"
.LASF140:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF1613:
	.string	"_freeres_buf"
.LASF1358:
	.string	"CLOCK_MONOTONIC 1"
.LASF721:
	.string	"_____fpos64_t_defined 1"
.LASF468:
	.string	"_ISOC11_SOURCE"
.LASF1682:
	.string	"filePtr"
.LASF251:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF1532:
	.string	"STATX_ATTR_COMPRESSED 0x00000004"
.LASF1246:
	.string	"_BITS_BYTESWAP_H 1"
.LASF128:
	.string	"__cpp_sized_deallocation 201309L"
.LASF355:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF751:
	.string	"FILENAME_MAX 4096"
.LASF945:
	.string	"_GLIBCXX_HAVE_ATOMIC_LOCK_POLICY 1"
.LASF123:
	.string	"__cpp_template_auto 201606L"
.LASF1664:
	.string	"_Z16isPointerCorrectPKv"
.LASF1415:
	.string	"_STRING_H 1"
.LASF345:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF685:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF326:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF949:
	.string	"_GLIBCXX_HAVE_COMPLEX_H 1"
.LASF1343:
	.string	"system"
.LASF1041:
	.string	"_GLIBCXX_HAVE_STRINGS_H 1"
.LASF1606:
	.string	"_vtable_offset"
.LASF421:
	.string	"_GNU_SOURCE 1"
.LASF305:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF388:
	.string	"__SIZEOF_INT128__ 16"
.LASF1578:
	.string	"short unsigned int"
.LASF1117:
	.string	"_GLIBCXX_USE_C99_CTYPE_TR1 1"
.LASF1579:
	.string	"signed char"
.LASF875:
	.string	"_GLIBCXX_USE_C99_COMPLEX _GLIBCXX11_USE_C99_COMPLEX"
.LASF877:
	.string	"_GLIBCXX_USE_C99_STDLIB _GLIBCXX11_USE_C99_STDLIB"
.LASF1435:
	.string	"_STATBUF_ST_BLKSIZE "
.LASF397:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF634:
	.string	"__size_t__ "
.LASF497:
	.string	"__USE_XOPEN2K 1"
.LASF1126:
	.string	"_GLIBCXX_USE_DEV_RANDOM 1"
.LASF1518:
	.string	"STATX_NLINK 0x00000004U"
.LASF1093:
	.string	"_GLIBCXX11_USE_C99_COMPLEX 1"
.LASF1168:
	.string	"_WCHAR_T_H "
.LASF340:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF1383:
	.string	"MOD_OFFSET ADJ_OFFSET"
.LASF567:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF1127:
	.string	"_GLIBCXX_USE_FCHMOD 1"
.LASF32:
	.string	"__CHAR_BIT__ 8"
.LASF478:
	.string	"_XOPEN_SOURCE_EXTENDED"
.LASF1257:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF1249:
	.ascii	"__bswap_constant_64(x) ((((x) & 0xff00000000000000ull) >> 56"
	.ascii	") | (((x) & 0x00ff000000"
	.string	"000000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56))"
.LASF1505:
	.string	"_LINUX_POSIX_TYPES_H "
.LASF741:
	.string	"EOF (-1)"
.LASF631:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT 1"
.LASF1394:
	.string	"STA_PLL 0x0001"
.LASF1570:
	.string	"_GXX_NULLPTR_T "
.LASF610:
	.string	"__stub___compat_bdflush "
.LASF1044:
	.string	"_GLIBCXX_HAVE_STRTOLD 1"
.LASF1501:
	.string	"_ASM_GENERIC_INT_LL64_H "
.LASF1309:
	.string	"__ONCE_FLAG_INIT { 0 }"
.LASF432:
	.string	"_FEATURES_H 1"
.LASF338:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF642:
	.string	"_BSD_SIZE_T_ "
.LASF585:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF1655:
	.string	"strchr"
.LASF569:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF794:
	.string	"_GLIBCXX_STDLIB_H 1"
.LASF54:
	.string	"__INT32_TYPE__ int"
.LASF1288:
	.string	"_BITS_PTHREADTYPES_COMMON_H 1"
.LASF80:
	.string	"__GXX_RTTI 1"
.LASF1113:
	.string	"_GLIBCXX_SYMVER_GNU 1"
.LASF540:
	.string	"__BEGIN_DECLS extern \"C\" {"
.LASF960:
	.string	"_GLIBCXX_HAVE_EXPL 1"
.LASF1642:
	.string	"wchar_t"
.LASF531:
	.string	"__THROW noexcept (true)"
.LASF383:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF1283:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF1448:
	.string	"__S_TYPEISSHM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF1548:
	.string	"logValue(value) loggingPrint(VALUE , value , LOG_INFO(value))"
.LASF1591:
	.string	"_IO_read_base"
.LASF1200:
	.string	"WIFEXITED(status) __WIFEXITED (status)"
.LASF686:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1459:
	.string	"S_IFCHR __S_IFCHR"
.LASF776:
	.string	"__HAVE_FLOAT32X 1"
.LASF1008:
	.string	"_GLIBCXX_HAVE_MEMALIGN 1"
.LASF268:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF1315:
	.string	"_GLIBCXX_INCLUDE_NEXT_C_HEADERS"
.LASF289:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF1481:
	.string	"S_IXUSR __S_IEXEC"
.LASF1414:
	.string	"__isleap(year) ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))"
.LASF352:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF1621:
	.string	"__unknown__"
.LASF1596:
	.string	"_IO_buf_end"
.LASF477:
	.string	"_XOPEN_SOURCE 700"
.LASF93:
	.string	"__cpp_rvalue_references 200610L"
.LASF798:
	.string	"_GLIBCXX_PURE __attribute__ ((__pure__))"
.LASF416:
	.string	"__linux__ 1"
.LASF1550:
	.string	"logWarning(warning) logggingPrint(WARNING, #warning , LOG_INFO(warning))"
.LASF102:
	.string	"__cpp_init_captures 201304L"
.LASF1456:
	.string	"UTIME_OMIT ((1l << 30) - 2l)"
.LASF259:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF1694:
	.string	"_Z10getLogFilev"
.LASF1333:
	.string	"mbstowcs"
.LASF1557:
	.string	"_ANSI_STDDEF_H "
.LASF1148:
	.string	"_GLIBCXX_USE_UTIME 1"
.LASF851:
	.string	"_GLIBCXX_END_NAMESPACE_LDBL_OR_CXX11 _GLIBCXX_END_NAMESPACE_CXX11"
.LASF1553:
	.string	"LOG_INFO"
.LASF529:
	.string	"__LEAF , __leaf__"
.LASF1403:
	.string	"STA_PPSJITTER 0x0200"
.LASF1116:
	.string	"_GLIBCXX_USE_C99_COMPLEX_TR1 1"
.LASF800:
	.string	"_GLIBCXX_NORETURN __attribute__ ((__noreturn__))"
.LASF887:
	.string	"_GLIBCXX_HAVE_BUILTIN_LAUNDER 1"
.LASF1091:
	.string	"STDC_HEADERS 1"
.LASF379:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF190:
	.string	"__UINT32_C(c) c ## U"
.LASF283:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF197:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF1374:
	.string	"ADJ_STATUS 0x0010"
.LASF1464:
	.string	"S_IFSOCK __S_IFSOCK"
.LASF364:
	.string	"__REGISTER_PREFIX__ "
.LASF1059:
	.string	"_GLIBCXX_HAVE_SYS_TIME_H 1"
.LASF1615:
	.string	"_mode"
.LASF985:
	.string	"_GLIBCXX_HAVE_ISINFL 1"
.LASF1592:
	.string	"_IO_write_base"
.LASF812:
	.string	"_GLIBCXX_ABI_TAG_CXX11 __attribute ((__abi_tag__ (\"cxx11\")))"
.LASF746:
	.string	"SEEK_HOLE 4"
.LASF553:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF470:
	.string	"_ISOC2X_SOURCE"
.LASF1139:
	.string	"_GLIBCXX_USE_PTHREAD_RWLOCK_CLOCKLOCK 1"
.LASF680:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF743:
	.string	"SEEK_CUR 1"
.LASF1252:
	.string	"htole16(x) __uint16_identity (x)"
.LASF18:
	.string	"__PIC__ 2"
.LASF679:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF1069:
	.string	"_GLIBCXX_HAVE_TLS 1"
.LASF1012:
	.string	"_GLIBCXX_HAVE_MODFL 1"
.LASF971:
	.string	"_GLIBCXX_HAVE_FMODF 1"
.LASF1443:
	.string	"__S_IFIFO 0010000"
.LASF991:
	.string	"_GLIBCXX_HAVE_LDEXPL 1"
.LASF604:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF1037:
	.string	"_GLIBCXX_HAVE_STDINT_H 1"
.LASF539:
	.string	"__ptr_t void *"
.LASF755:
	.string	"FOPEN_MAX 16"
.LASF1047:
	.string	"_GLIBCXX_HAVE_SYMLINK 1"
.LASF1110:
	.string	"_GLIBCXX_STDIO_SEEK_CUR 1"
.LASF1144:
	.string	"_GLIBCXX_USE_SC_NPROCESSORS_ONLN 1"
.LASF1029:
	.string	"_GLIBCXX_HAVE_SINHF 1"
.LASF1660:
	.string	"getFileSize"
.LASF669:
	.string	"__SLONG32_TYPE int"
.LASF10:
	.string	"__VERSION__ \"11.2.0\""
.LASF1666:
	.string	"time"
.LASF6:
	.string	"__STDC_HOSTED__ 1"
.LASF1000:
	.string	"_GLIBCXX_HAVE_LINUX_RANDOM_H 1"
.LASF356:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF70:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF1567:
	.string	"__need_ptrdiff_t"
.LASF1388:
	.string	"MOD_TIMECONST ADJ_TIMECONST"
.LASF1096:
	.string	"_GLIBCXX11_USE_C99_STDLIB 1"
.LASF396:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF179:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF267:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF436:
	.string	"__USE_ISOCXX11"
.LASF99:
	.string	"__cpp_ref_qualifiers 200710L"
.LASF1581:
	.string	"long int"
.LASF1418:
	.string	"strndupa(s,n) (__extension__ ({ const char *__old = (s); size_t __len = strnlen (__old, (n)); char *__new = (char *) __builtin_alloca (__len + 1); __new[__len] = '\\0'; (char *) memcpy (__new, __old, __len); }))"
.LASF729:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF242:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF171:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF284:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF1652:
	.string	"LOG_LEVEL"
.LASF603:
	.string	"__HAVE_GENERIC_SELECTION 0"
.LASF462:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF1487:
	.string	"S_IWGRP (S_IWUSR >> 3)"
.LASF375:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF930:
	.string	"_PSTL_PRAGMA_MESSAGE(x) "
.LASF1618:
	.string	"_IO_marker"
.LASF878:
	.string	"_GLIBCXX_USE_C99_WCHAR _GLIBCXX11_USE_C99_WCHAR"
.LASF1498:
	.string	"_LINUX_STAT_H "
.LASF366:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF757:
	.string	"stdin stdin"
.LASF1088:
	.string	"_GLIBCXX_PACKAGE_TARNAME \"libstdc++\""
.LASF1082:
	.string	"_GLIBCXX_HAVE___CXA_THREAD_ATEXIT_IMPL 1"
.LASF321:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF1293:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF536:
	.string	"__PMT(args) args"
.LASF1562:
	.string	"_PTRDIFF_T_ "
.LASF153:
	.string	"__WCHAR_WIDTH__ 32"
.LASF1395:
	.string	"STA_PPSFREQ 0x0002"
.LASF754:
	.string	"FOPEN_MAX"
.LASF288:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF1228:
	.string	"__timer_t_defined 1"
.LASF1689:
	.string	"getDataString"
.LASF1561:
	.string	"__PTRDIFF_T "
.LASF1524:
	.string	"STATX_INO 0x00000100U"
.LASF1272:
	.string	"_STRUCT_TIMESPEC 1"
.LASF425:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF1208:
	.string	"EXIT_SUCCESS 0"
.LASF1321:
	.string	"atof"
.LASF1656:
	.string	"isspace"
.LASF1653:
	.string	"LOG_FILE_NAME"
.LASF1381:
	.string	"ADJ_OFFSET_SINGLESHOT 0x8001"
.LASF142:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF87:
	.string	"__cpp_unicode_literals 200710L"
.LASF702:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF275:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF926:
	.string	"_PSTL_PRAGMA_VECTOR_UNALIGNED "
.LASF524:
	.string	"_SYS_CDEFS_H 1"
.LASF1623:
	.string	"float"
.LASF758:
	.string	"stdout stdout"
.LASF871:
	.string	"_GLIBCXX_USE_STD_SPEC_FUNCS 1"
.LASF1108:
	.string	"_GLIBCXX_RES_LIMITS 1"
.LASF1051:
	.string	"_GLIBCXX_HAVE_SYS_PARAM_H 1"
.LASF1065:
	.string	"_GLIBCXX_HAVE_TANHL 1"
.LASF1305:
	.string	"__PTHREAD_MUTEX_INITIALIZER(__kind) 0, 0, 0, 0, __kind, 0, 0, { 0, 0 }"
.LASF1017:
	.string	"_GLIBCXX_HAVE_POLL_H 1"
.LASF84:
	.string	"__cpp_hex_float 201603L"
.LASF1409:
	.string	"STA_CLK 0x8000"
.LASF640:
	.string	"__SIZE_T "
.LASF707:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF109:
	.string	"__cpp_static_assert 201411L"
.LASF1475:
	.string	"S_TYPEISSHM(buf) __S_TYPEISSHM(buf)"
.LASF1619:
	.string	"_IO_codecvt"
.LASF954:
	.string	"_GLIBCXX_HAVE_DIRENT_H 1"
.LASF247:
	.string	"__LDBL_DIG__ 18"
.LASF378:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF948:
	.string	"_GLIBCXX_HAVE_CEILL 1"
.LASF1011:
	.string	"_GLIBCXX_HAVE_MODFF 1"
.LASF883:
	.string	"_GLIBCXX_HAVE_BUILTIN_HAS_UNIQ_OBJ_REP 1"
.LASF1340:
	.string	"strtod"
.LASF1352:
	.string	"strtof"
.LASF690:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF400:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF706:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF39:
	.string	"__SIZEOF_POINTER__ 8"
.LASF910:
	.string	"_PSTL_PRAGMA_SIMD_SCAN(PRM) "
.LASF1402:
	.string	"STA_PPSSIGNAL 0x0100"
.LASF303:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF1625:
	.string	"long double"
.LASF894:
	.string	"_PSTL_VERSION 12000"
.LASF1444:
	.string	"__S_IFLNK 0120000"
.LASF639:
	.string	"_T_SIZE "
.LASF327:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF1275:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF1450:
	.string	"__S_ISGID 02000"
.LASF1470:
	.string	"S_ISFIFO(mode) __S_ISTYPE((mode), __S_IFIFO)"
.LASF494:
	.string	"__USE_POSIX2 1"
.LASF732:
	.string	"__cookie_io_functions_t_defined 1"
.LASF1010:
	.string	"_GLIBCXX_HAVE_MODF 1"
.LASF756:
	.string	"_PRINTF_NAN_LEN_MAX 4"
.LASF560:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF1354:
	.string	"_TIME_H 1"
.LASF554:
	.string	"__flexarr []"
.LASF461:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF885:
	.string	"_GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED 1"
.LASF658:
	.string	"_BITS_TYPES_H 1"
.LASF292:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF1314:
	.string	"__COMPAR_FN_T "
.LASF1253:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF998:
	.string	"_GLIBCXX_HAVE_LINK 1"
.LASF915:
	.string	"_PSTL_CPP14_MAKE_REVERSE_ITERATOR_PRESENT (_MSC_VER >= 1900 || __cplusplus >= 201402L || __cpp_lib_make_reverse_iterator == 201402)"
.LASF556:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF141:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF623:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 1"
.LASF810:
	.string	"_GLIBCXX20_DEPRECATED(MSG) "
.LASF331:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF1161:
	.string	"_T_WCHAR_ "
.LASF402:
	.string	"__k8__ 1"
.LASF41:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF1477:
	.string	"S_ISGID __S_ISGID"
.LASF1520:
	.string	"STATX_GID 0x00000010U"
.LASF474:
	.string	"_POSIX_C_SOURCE"
.LASF1552:
	.string	"logFatal(expression) loggingPrint(FATAL, #expression, LOG_INFO(expression))"
.LASF1471:
	.string	"S_ISLNK(mode) __S_ISTYPE((mode), __S_IFLNK)"
.LASF1130:
	.string	"_GLIBCXX_USE_GET_NPROCS 1"
.LASF1206:
	.string	"RAND_MAX 2147483647"
.LASF3:
	.string	"__cplusplus 201703L"
.LASF787:
	.string	"__f64(x) x"
.LASF923:
	.string	"_PSTL_PRAGMA_SIMD_ORDERED_MONOTONIC(PRM) "
.LASF661:
	.string	"__S32_TYPE int"
.LASF1527:
	.string	"STATX_BASIC_STATS 0x000007ffU"
.LASF207:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF1360:
	.string	"CLOCK_THREAD_CPUTIME_ID 3"
.LASF381:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF241:
	.string	"__DBL_DENORM_MIN__ double(4.94065645841246544176568792868221372e-324L)"
.LASF1077:
	.string	"_GLIBCXX_HAVE_VWSCANF 1"
.LASF500:
	.string	"__USE_XOPEN_EXTENDED 1"
.LASF857:
	.string	"_GLIBCXX_END_EXTERN_C }"
.LASF221:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF96:
	.string	"__cpp_delegating_constructors 200604L"
.LASF152:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF881:
	.string	"_GLIBCXX_DOUBLE_IS_IEEE_BINARY64 1"
.LASF1587:
	.string	"char"
.LASF1294:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF1648:
	.string	"WARNING"
.LASF1458:
	.string	"S_IFDIR __S_IFDIR"
.LASF681:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF979:
	.string	"_GLIBCXX_HAVE_HYPOTL 1"
.LASF616:
	.string	"__stub_sigreturn "
.LASF665:
	.string	"__SQUAD_TYPE long int"
.LASF779:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF115:
	.string	"__cpp_range_based_for 201603L"
.LASF1273:
	.string	"__NFDBITS"
.LASF624:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF65:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF1704:
	.string	"__static_initialization_and_destruction_0"
.LASF864:
	.string	"_GLIBCXX_GTHREAD_USE_WEAK 0"
.LASF261:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF659:
	.string	"__S16_TYPE short int"
.LASF1457:
	.string	"S_IFMT __S_IFMT"
.LASF367:
	.string	"__NO_INLINE__ 1"
.LASF290:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF1095:
	.string	"_GLIBCXX11_USE_C99_STDIO 1"
.LASF1177:
	.string	"WUNTRACED 2"
.LASF1595:
	.string	"_IO_buf_base"
.LASF1260:
	.string	"htole64(x) __uint64_identity (x)"
.LASF475:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF573:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF952:
	.string	"_GLIBCXX_HAVE_COSHL 1"
.LASF105:
	.string	"__cpp_aggregate_nsdmi 201304L"
.LASF1639:
	.string	"_ZSt3absd"
.LASF1637:
	.string	"_ZSt3abse"
.LASF1638:
	.string	"_ZSt3absf"
.LASF1338:
	.string	"realloc"
.LASF126:
	.string	"__cpp_guaranteed_copy_elision 201606L"
.LASF1641:
	.string	"_ZSt3absl"
.LASF1155:
	.string	"_GLIBCXX_CSTDLIB 1"
.LASF580:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1398:
	.string	"STA_INS 0x0010"
.LASF1640:
	.string	"_ZSt3absx"
.LASF888:
	.string	"_GLIBCXX_HAS_BUILTIN"
.LASF693:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF644:
	.string	"_SIZE_T_DEFINED "
.LASF257:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF648:
	.string	"_GCC_SIZE_T "
.LASF821:
	.string	"_GLIBCXX_NOEXCEPT_IF(...) noexcept(__VA_ARGS__)"
.LASF486:
	.string	"_DYNAMIC_STACK_SIZE_SOURCE"
.LASF718:
	.string	"__STD_TYPE"
.LASF929:
	.string	"_PSTL_PRAGMA_MESSAGE_IMPL(x) _PSTL_PRAGMA(message(_PSTL_STRING_CONCAT(_PSTL_PRAGMA_LOCATION, x)))"
.LASF704:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF676:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF670:
	.string	"__ULONG32_TYPE unsigned int"
.LASF774:
	.string	"__HAVE_FLOAT32 1"
.LASF1699:
	.string	"_IO_FILE"
.LASF71:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF650:
	.string	"__size_t "
.LASF633:
	.string	"__need_NULL "
.LASF1620:
	.string	"_IO_wide_data"
.LASF1685:
	.string	"_Z12loggingPrintjPKvPKcS2_S2_i"
.LASF976:
	.string	"_GLIBCXX_HAVE_GETS 1"
.LASF25:
	.string	"__SIZEOF_LONG__ 8"
.LASF246:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF1473:
	.string	"S_TYPEISMQ(buf) __S_TYPEISMQ(buf)"
.LASF1696:
	.string	"isFileFull"
.LASF1495:
	.string	"ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)"
.LASF75:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF206:
	.string	"__INTPTR_WIDTH__ 64"
.LASF35:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF414:
	.string	"__gnu_linux__ 1"
.LASF1042:
	.string	"_GLIBCXX_HAVE_STRING_H 1"
.LASF1308:
	.string	"__PTHREAD_RWLOCK_INITIALIZER(__flags) 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, __flags"
.LASF1452:
	.string	"__S_IREAD 0400"
.LASF1367:
	.string	"CLOCK_TAI 11"
.LASF370:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF339:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF1349:
	.string	"atoll"
.LASF163:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF850:
	.string	"_GLIBCXX_BEGIN_NAMESPACE_LDBL_OR_CXX11 _GLIBCXX_BEGIN_NAMESPACE_CXX11"
.LASF897:
	.string	"_PSTL_VERSION_PATCH (_PSTL_VERSION % 10)"
.LASF607:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF933:
	.string	"_PSTL_ICC_18_OMP_SIMD_BROKEN (__INTEL_COMPILER == 1800)"
.LASF950:
	.string	"_GLIBCXX_HAVE_COSF 1"
.LASF1268:
	.string	"__sigset_t_defined 1"
.LASF1463:
	.string	"S_IFLNK __S_IFLNK"
.LASF1103:
	.string	"_GLIBCXX_ATOMIC_BUILTINS 1"
.LASF596:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF581:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF1324:
	.string	"bsearch"
.LASF1174:
	.string	"__need_wchar_t"
.LASF220:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF1560:
	.string	"_T_PTRDIFF "
.LASF527:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
.LASF506:
	.string	"__USE_LARGEFILE 1"
.LASF229:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF801:
	.string	"_GLIBCXX_HAVE_ATTRIBUTE_VISIBILITY 1"
.LASF299:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF1290:
	.string	"_BITS_PTHREADTYPES_ARCH_H 1"
.LASF856:
	.string	"_GLIBCXX_BEGIN_EXTERN_C extern \"C\" {"
.LASF1146:
	.string	"_GLIBCXX_USE_ST_MTIM 1"
.LASF480:
	.string	"_LARGEFILE64_SOURCE"
.LASF415:
	.string	"__linux 1"
.LASF1425:
	.string	"__exctype(name) extern int name (int) __THROW"
.LASF523:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF1361:
	.string	"CLOCK_MONOTONIC_RAW 4"
.LASF987:
	.string	"_GLIBCXX_HAVE_ISNANL 1"
.LASF1035:
	.string	"_GLIBCXX_HAVE_STDALIGN_H 1"
.LASF21:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF609:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF782:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF947:
	.string	"_GLIBCXX_HAVE_CEILF 1"
.LASF19:
	.string	"__pie__ 2"
.LASF1222:
	.string	"__id_t_defined "
.LASF271:
	.string	"__FLT32_NORM_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF935:
	.string	"_GLIBCXX_HAVE_ACOSL 1"
.LASF943:
	.string	"_GLIBCXX_HAVE_ATANF 1"
.LASF1306:
	.string	"_RWLOCK_INTERNAL_H "
.LASF1193:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF106:
	.string	"__cpp_variable_templates 201304L"
.LASF1412:
	.string	"__itimerspec_defined 1"
.LASF1426:
	.string	"__tobody(c,f,a,args) (__extension__ ({ int __res; if (sizeof (c) > 1) { if (__builtin_constant_p (c)) { int __c = (c); __res = __c < -128 || __c > 255 ? __c : (a)[__c]; } else __res = f args; } else __res = (a)[(int) (c)]; __res; }))"
.LASF182:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF1535:
	.string	"STATX_ATTR_NODUMP 0x00000040"
.LASF465:
	.string	"_ISOC95_SOURCE 1"
.LASF541:
	.string	"__END_DECLS }"
.LASF489:
	.string	"__USE_ISOC11 1"
.LASF1062:
	.string	"_GLIBCXX_HAVE_S_ISREG 1"
.LASF1521:
	.string	"STATX_ATIME 0x00000020U"
.LASF826:
	.string	"_GLIBCXX_NOEXCEPT_PARM , bool _NE"
.LASF1223:
	.string	"__daddr_t_defined "
.LASF582:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF1397:
	.string	"STA_FLL 0x0008"
.LASF1600:
	.string	"_markers"
.LASF992:
	.string	"_GLIBCXX_HAVE_LIBINTL_H 1"
.LASF1183:
	.string	"__WALL 0x40000000"
.LASF1440:
	.string	"__S_IFCHR 0020000"
.LASF543:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF1384:
	.string	"MOD_FREQUENCY ADJ_FREQUENCY"
.LASF333:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF1239:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF1259:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF458:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF280:
	.string	"__FLT64_DIG__ 15"
.LASF1530:
	.string	"STATX__RESERVED 0x80000000U"
.LASF373:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF354:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF502:
	.string	"_LARGEFILE_SOURCE"
.LASF1295:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF941:
	.string	"_GLIBCXX_HAVE_ATAN2F 1"
.LASF970:
	.string	"_GLIBCXX_HAVE_FLOORL 1"
.LASF1291:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF450:
	.string	"__USE_FILE_OFFSET64"
.LASF1523:
	.string	"STATX_CTIME 0x00000080U"
.LASF1195:
	.string	"__W_CONTINUED 0xffff"
.LASF1330:
	.string	"ldiv"
.LASF962:
	.string	"_GLIBCXX_HAVE_FABSL 1"
.LASF1679:
	.string	"fileName"
.LASF893:
	.string	"_PSTL_CONFIG_H "
.LASF759:
	.string	"stderr stderr"
.LASF38:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF917:
	.string	"_PSTL_CPP14_VARIABLE_TEMPLATES_PRESENT (!__INTEL_COMPILER || __INTEL_COMPILER >= 1700) && (_MSC_FULL_VER >= 190023918 || __cplusplus >= 201402L)"
.LASF1212:
	.string	"_SYS_TYPES_H 1"
.LASF476:
	.string	"_XOPEN_SOURCE"
.LASF1256:
	.string	"htole32(x) __uint32_identity (x)"
.LASF1390:
	.string	"MOD_CLKA ADJ_OFFSET_SINGLESHOT"
.LASF797:
	.string	"__GLIBCXX__ 20220324"
.LASF100:
	.string	"__cpp_alias_templates 200704L"
.LASF691:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF1237:
	.string	"__PDP_ENDIAN 3412"
.LASF966:
	.string	"_GLIBCXX_HAVE_FINITEF 1"
.LASF1442:
	.string	"__S_IFREG 0100000"
.LASF817:
	.string	"_GLIBCXX17_CONSTEXPR constexpr"
.LASF988:
	.string	"_GLIBCXX_HAVE_ISWBLANK 1"
.LASF29:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF1693:
	.string	"getLogFile"
.LASF1107:
	.string	"_GLIBCXX_MANGLE_SIZE_T m"
.LASF701:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF813:
	.string	"_GLIBCXX_NODISCARD [[__nodiscard__]]"
.LASF485:
	.string	"_ATFILE_SOURCE 1"
.LASF1235:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1149:
	.string	"_GLIBCXX_USE_UTIMENSAT 1"
.LASF1009:
	.string	"_GLIBCXX_HAVE_MEMORY_H 1"
.LASF272:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF1165:
	.string	"_BSD_WCHAR_T_ "
.LASF921:
	.string	"_PSTL_UDS_PRESENT (__INTEL_COMPILER >= 1900 && __INTEL_COMPILER_BUILD_DATE >= 20180626)"
.LASF764:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF1205:
	.string	"__lldiv_t_defined 1"
.LASF1555:
	.string	"_STDDEF_H "
.LASF568:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF1568:
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
.LASF1298:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF730:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF1027:
	.string	"_GLIBCXX_HAVE_SINCOSL 1"
.LASF1335:
	.string	"qsort"
.LASF431:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF287:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF1190:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF438:
	.string	"__USE_POSIX2"
.LASF1215:
	.string	"__ino64_t_defined "
.LASF1100:
	.string	"_GLIBCXX98_USE_C99_STDIO 1"
.LASF1707:
	.string	"initLog"
.LASF1347:
	.string	"llabs"
.LASF1489:
	.string	"S_IRWXG (S_IRWXU >> 3)"
.LASF1021:
	.string	"_GLIBCXX_HAVE_POWL 1"
.LASF953:
	.string	"_GLIBCXX_HAVE_COSL 1"
.LASF1068:
	.string	"_GLIBCXX_HAVE_TIMESPEC_GET 1"
.LASF1112:
	.string	"_GLIBCXX_SYMVER 1"
.LASF403:
	.string	"__code_model_small__ 1"
.LASF790:
	.string	"__CFLOAT32 _Complex float"
.LASF667:
	.string	"__SWORD_TYPE long int"
.LASF1157:
	.string	"__need_wchar_t "
.LASF445:
	.string	"__USE_XOPEN2KXSI"
.LASF1030:
	.string	"_GLIBCXX_HAVE_SINHL 1"
.LASF1449:
	.string	"__S_ISUID 04000"
.LASF890:
	.string	"_PSTL_PAR_BACKEND_SERIAL "
.LASF1285:
	.string	"__blkcnt_t_defined "
.LASF795:
	.string	"_GLIBCXX_CXX_CONFIG_H 1"
.LASF1182:
	.string	"__WNOTHREAD 0x20000000"
.LASF753:
	.string	"L_cuserid 9"
.LASF649:
	.string	"_SIZET_ "
.LASF52:
	.string	"__INT8_TYPE__ signed char"
.LASF996:
	.string	"_GLIBCXX_HAVE_LIMIT_RSS 1"
.LASF409:
	.string	"__SSE2_MATH__ 1"
.LASF371:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF946:
	.string	"_GLIBCXX_HAVE_AT_QUICK_EXIT 1"
.LASF404:
	.string	"__MMX__ 1"
.LASF709:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF1556:
	.string	"_STDDEF_H_ "
.LASF717:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF90:
	.string	"__cpp_decltype 200707L"
.LASF738:
	.string	"_IOLBF 1"
.LASF811:
	.string	"_GLIBCXX20_DEPRECATED_SUGGEST(ALT) "
.LASF1686:
	.string	"_Z12loggingPrintjcPKcS0_S0_i"
.LASF1541:
	.string	"__statx_timestamp_defined 1"
.LASF549:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF281:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF131:
	.string	"__cpp_template_template_args 201611L"
.LASF1386:
	.string	"MOD_ESTERROR ADJ_ESTERROR"
.LASF1688:
	.string	"_Z12loggingPrintjxPKcS0_S0_i"
.LASF735:
	.string	"__off64_t_defined "
.LASF713:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF1292:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF1311:
	.string	"_ALLOCA_H 1"
.LASF1407:
	.string	"STA_NANO 0x2000"
.LASF1184:
	.string	"__WCLONE 0x80000000"
.LASF1162:
	.string	"_T_WCHAR "
.LASF1539:
	.string	"STATX_ATTR_VERITY 0x00100000"
.LASF785:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 0"
.LASF719:
	.string	"_____fpos_t_defined 1"
.LASF1628:
	.string	"5div_t"
.LASF68:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF1627:
	.string	"div_t"
.LASF439:
	.string	"__USE_POSIX199309"
.LASF412:
	.string	"__SEG_GS 1"
.LASF1320:
	.string	"at_quick_exit"
.LASF1015:
	.string	"_GLIBCXX_HAVE_NETINET_TCP_H 1"
.LASF965:
	.string	"_GLIBCXX_HAVE_FINITE 1"
.LASF313:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF1563:
	.string	"_BSD_PTRDIFF_T_ "
.LASF1163:
	.string	"__WCHAR_T "
.LASF927:
	.string	"_PSTL_USE_NONTEMPORAL_STORES_IF_ALLOWED "
.LASF1441:
	.string	"__S_IFBLK 0060000"
.LASF1213:
	.string	"__u_char_defined "
.LASF424:
	.string	"__STDC_IEC_559__ 1"
.LASF1356:
	.string	"CLOCKS_PER_SEC ((__clock_t) 1000000)"
.LASF1276:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF398:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF353:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF1371:
	.string	"ADJ_FREQUENCY 0x0002"
.LASF177:
	.string	"__INT16_C(c) c"
.LASF1366:
	.string	"CLOCK_BOOTTIME_ALARM 9"
.LASF928:
	.string	"_PSTL_PRAGMA_LOCATION \" [Parallel STL message]: \""
.LASF1004:
	.string	"_GLIBCXX_HAVE_LOG10L 1"
.LASF781:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF865:
	.string	"_GLIBCXX_CPU_DEFINES 1"
.LASF488:
	.string	"__GLIBC_USE_ISOC2X 1"
.LASF308:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF1635:
	.string	"long long unsigned int"
.LASF27:
	.string	"__SIZEOF_SHORT__ 2"
.LASF42:
	.string	"__GNUG__ 11"
.LASF714:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF1033:
	.string	"_GLIBCXX_HAVE_SQRTF 1"
.LASF73:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF1605:
	.string	"_cur_column"
.LASF151:
	.string	"__LONG_WIDTH__ 64"
.LASF1462:
	.string	"S_IFIFO __S_IFIFO"
.LASF169:
	.string	"__UINT8_MAX__ 0xff"
.LASF1150:
	.string	"_GLIBCXX_USE_WCHAR_T 1"
.LASF1636:
	.string	"__compar_fn_t"
.LASF1585:
	.string	"__off64_t"
.LASF1506:
	.string	"__FD_SETSIZE"
.LASF766:
	.string	"__HAVE_FLOAT128 1"
.LASF420:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF627:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 1"
.LASF1074:
	.string	"_GLIBCXX_HAVE_UTIME_H 1"
.LASF201:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF1121:
	.string	"_GLIBCXX_USE_C99_MATH_TR1 1"
.LASF295:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF558:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __THROWNL __asm__ (__ASMNAME (#alias))"
.LASF240:
	.string	"__DBL_EPSILON__ double(2.22044604925031308084726333618164062e-16L)"
.LASF1073:
	.string	"_GLIBCXX_HAVE_USELOCALE 1"
.LASF189:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF346:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF1469:
	.string	"S_ISREG(mode) __S_ISTYPE((mode), __S_IFREG)"
.LASF765:
	.string	"_BITS_FLOATN_H "
.LASF285:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF122:
	.string	"__cpp_noexcept_function_type 201510L"
.LASF834:
	.string	"_GLIBCXX_DEFAULT_ABI_TAG _GLIBCXX_ABI_TAG_CXX11"
.LASF836:
	.string	"_GLIBCXX_BEGIN_NAMESPACE_VERSION "
.LASF1132:
	.string	"_GLIBCXX_USE_LFS 1"
.LASF1061:
	.string	"_GLIBCXX_HAVE_SYS_UIO_H 1"
.LASF496:
	.string	"__USE_POSIX199506 1"
.LASF1385:
	.string	"MOD_MAXERROR ADJ_MAXERROR"
.LASF273:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF192:
	.string	"__UINT64_C(c) c ## UL"
.LASF16:
	.string	"__ATOMIC_CONSUME 1"
.LASF590:
	.string	"__attribute_copy__"
.LASF614:
	.string	"__stub_revoke "
.LASF61:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF587:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF678:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF1186:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF1703:
	.string	"_GLOBAL__sub_I__Z10getLogFilev"
.LASF1007:
	.string	"_GLIBCXX_HAVE_MBSTATE_T 1"
.LASF815:
	.string	"_GLIBCXX_USE_CONSTEXPR constexpr"
.LASF1417:
	.string	"strdupa(s) (__extension__ ({ const char *__old = (s); size_t __len = strlen (__old) + 1; char *__new = (char *) __builtin_alloca (__len); (char *) memcpy (__new, __old, __len); }))"
.LASF1598:
	.string	"_IO_backup_base"
.LASF498:
	.string	"__USE_XOPEN2K8 1"
.LASF689:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF973:
	.string	"_GLIBCXX_HAVE_FREXPF 1"
.LASF1114:
	.string	"_GLIBCXX_USE_C11_UCHAR_CXX11 1"
.LASF377:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF902:
	.string	"_PSTL_STRING_CONCAT(x,y) x #y"
.LASF1589:
	.string	"_IO_read_ptr"
.LASF62:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF621:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 1"
.LASF740:
	.string	"BUFSIZ 8192"
.LASF1063:
	.string	"_GLIBCXX_HAVE_TANF 1"
.LASF391:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF866:
	.string	"_GLIBCXX_PSEUDO_VISIBILITY(V) "
.LASF1066:
	.string	"_GLIBCXX_HAVE_TANL 1"
.LASF844:
	.string	"_GLIBCXX_LONG_DOUBLE_COMPAT"
.LASF508:
	.string	"__WORDSIZE 64"
.LASF1203:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (status)"
.LASF708:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF1419:
	.string	"_STRINGS_H 1"
.LASF807:
	.string	"_GLIBCXX11_DEPRECATED_SUGGEST(ALT) _GLIBCXX_DEPRECATED_SUGGEST(ALT)"
.LASF132:
	.string	"__cpp_threadsafe_static_init 200806L"
.LASF736:
	.string	"__ssize_t_defined "
.LASF325:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF1378:
	.string	"ADJ_MICRO 0x1000"
.LASF40:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF484:
	.string	"_ATFILE_SOURCE"
.LASF1071:
	.string	"_GLIBCXX_HAVE_UCHAR_H 1"
.LASF1328:
	.string	"getenv"
.LASF1612:
	.string	"_freeres_list"
.LASF722:
	.string	"____FILE_defined 1"
.LASF796:
	.string	"_GLIBCXX_RELEASE 11"
.LASF608:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF232:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF518:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF1282:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF1078:
	.string	"_GLIBCXX_HAVE_WCHAR_H 1"
.LASF628:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF783:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF886:
	.string	"_GLIBCXX_HAVE_BUILTIN_IS_SAME 1"
.LASF1337:
	.string	"rand"
.LASF1480:
	.string	"S_IWUSR __S_IWRITE"
.LASF1617:
	.string	"FILE"
.LASF562:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF1408:
	.string	"STA_MODE 0x4000"
.LASF1052:
	.string	"_GLIBCXX_HAVE_SYS_RESOURCE_H 1"
.LASF473:
	.string	"_POSIX_SOURCE 1"
.LASF1092:
	.string	"_GLIBCXX_DARWIN_USE_64_BIT_INODE 1"
.LASF1453:
	.string	"__S_IWRITE 0200"
.LASF1370:
	.string	"ADJ_OFFSET 0x0001"
.LASF1491:
	.string	"S_IWOTH (S_IWGRP >> 3)"
.LASF1313:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF347:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF1604:
	.string	"_old_offset"
.LASF1382:
	.string	"ADJ_OFFSET_SS_READ 0xa001"
.LASF1564:
	.string	"___int_ptrdiff_t_h "
.LASF1663:
	.string	"isPointerCorrect"
.LASF469:
	.string	"_ISOC11_SOURCE 1"
.LASF309:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF589:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF705:
	.string	"__TIMER_T_TYPE void *"
.LASF1318:
	.string	"aligned_alloc"
.LASF1427:
	.string	"__isctype_l(c,type,locale) ((locale)->__ctype_b[(int) (c)] & (unsigned short int) type)"
.LASF1526:
	.string	"STATX_BLOCKS 0x00000400U"
.LASF1123:
	.string	"_GLIBCXX_USE_CLOCK_MONOTONIC 1"
.LASF323:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF969:
	.string	"_GLIBCXX_HAVE_FLOORF 1"
.LASF1251:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF905:
	.string	"_PSTL_GCC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)"
.LASF277:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF520:
	.string	"__GNU_LIBRARY__ 6"
.LASF1224:
	.string	"__key_t_defined "
.LASF1632:
	.string	"long long int"
.LASF695:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF1603:
	.string	"_flags2"
.LASF1207:
	.string	"EXIT_FAILURE 1"
.LASF1405:
	.string	"STA_PPSERROR 0x0800"
.LASF1650:
	.string	"VALUE"
.LASF1197:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (status)"
.LASF127:
	.string	"__cpp_nontype_template_parameter_auto 201606L"
.LASF363:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF1531:
	.string	"STATX_ALL 0x00000fffU"
.LASF860:
	.string	"__NO_CTYPE 1"
.LASF1055:
	.string	"_GLIBCXX_HAVE_SYS_SOCKET_H 1"
.LASF1404:
	.string	"STA_PPSWANDER 0x0400"
.LASF728:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF882:
	.string	"_GLIBCXX_HAS_BUILTIN(B) __has_builtin(B)"
.LASF157:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF1304:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF1461:
	.string	"S_IFREG __S_IFREG"
.LASF92:
	.string	"__cpp_rvalue_reference 200610L"
.LASF1187:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF570:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF336:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF909:
	.string	"_PSTL_PRAGMA_FORCEINLINE "
.LASF1429:
	.string	"_SYS_STAT_H 1"
.LASF983:
	.string	"_GLIBCXX_HAVE_INTTYPES_H 1"
.LASF405:
	.string	"__SSE__ 1"
.LASF244:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF343:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF452:
	.string	"__USE_ATFILE"
.LASF820:
	.string	"_GLIBCXX_NOEXCEPT noexcept"
.LASF1651:
	.string	"LOG_FILE"
.LASF225:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF1433:
	.string	"st_mtime st_mtim.tv_sec"
.LASF314:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF1554:
	.string	"SYSTEMLIKE_H_ "
.LASF1307:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF417:
	.string	"__unix 1"
.LASF592:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF622:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF260:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF1198:
	.string	"WTERMSIG(status) __WTERMSIG (status)"
.LASF1645:
	.string	"_ZN9__gnu_cxx3divExx"
.LASF572:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF1575:
	.string	"long unsigned int"
.LASF1454:
	.string	"__S_IEXEC 0100"
.LASF737:
	.string	"_IOFBF 0"
.LASF457:
	.string	"__GLIBC_USE_ISOC2X"
.LASF625:
	.string	"__GLIBC_USE_IEC_60559_EXT 1"
.LASF222:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF1421:
	.string	"_CTYPE_H 1"
.LASF697:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF329:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF548:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF30:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF69:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF1210:
	.string	"_BITS_TYPES_LOCALE_T_H 1"
.LASF557:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __THROW __asm__ (__ASMNAME (#alias))"
.LASF1551:
	.string	"logError(expression) loggingPrint(ERROR , #expression, LOG_INFO(expression))"
.LASF904:
	.string	"_PSTL_HIDE_FROM_ABI_POP "
.LASF694:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1445:
	.string	"__S_IFSOCK 0140000"
.LASF291:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF301:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF226:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF687:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF802:
	.string	"_GLIBCXX_VISIBILITY(V) __attribute__ ((__visibility__ (#V)))"
.LASF101:
	.string	"__cpp_return_type_deduction 201304L"
.LASF1351:
	.string	"strtoull"
.LASF1569:
	.string	"_GCC_MAX_ALIGN_T "
.LASF254:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF898:
	.string	"_PSTL_USAGE_WARNINGS 0"
.LASF28:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF924:
	.string	"_PSTL_PRAGMA_SIMD_ORDERED_MONOTONIC_2ARGS(PRM1,PRM2) "
.LASF362:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF635:
	.string	"__SIZE_T__ "
.LASF95:
	.string	"__cpp_initializer_lists 200806L"
.LASF1089:
	.string	"_GLIBCXX_PACKAGE_URL \"\""
.LASF64:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF683:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF428:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF249:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF552:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF1667:
	.string	"setvbuf"
.LASF103:
	.string	"__cpp_generic_lambdas 201304L"
.LASF1472:
	.string	"S_ISSOCK(mode) __S_ISTYPE((mode), __S_IFSOCK)"
.LASF49:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF788:
	.string	"__f32x(x) x"
.LASF499:
	.string	"__USE_XOPEN 1"
.LASF1576:
	.string	"unsigned int"
.LASF1571:
	.string	"SEPARATOR \"=============================================\""
.LASF789:
	.string	"__f64x(x) x ##l"
.LASF1262:
	.string	"le64toh(x) __uint64_identity (x)"
.LASF1031:
	.string	"_GLIBCXX_HAVE_SINL 1"
.LASF1540:
	.string	"STATX_ATTR_DAX 0x00200000"
.LASF565:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF1438:
	.string	"__S_IFMT 0170000"
.LASF629:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 1"
.LASF575:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF1240:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF1542:
	.string	"__statx_defined 1"
.LASF1665:
	.string	"ctime"
.LASF223:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF418:
	.string	"__unix__ 1"
.LASF1098:
	.string	"_GLIBCXX98_USE_C99_COMPLEX 1"
.LASF675:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF1522:
	.string	"STATX_MTIME 0x00000040U"
.LASF911:
	.string	"_PSTL_PRAGMA_SIMD_INCLUSIVE_SCAN(PRM) "
.LASF43:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF250:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF600:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF1580:
	.string	"short int"
.LASF410:
	.string	"__MMX_WITH_SSE__ 1"
.LASF957:
	.string	"_GLIBCXX_HAVE_EXCEPTION_PTR_SINCE_GCC46 1"
.LASF8:
	.string	"__GNUC_MINOR__ 2"
.LASF4:
	.string	"__STDC_UTF_16__ 1"
.LASF97:
	.string	"__cpp_nsdmi 200809L"
.LASF22:
	.string	"_LP64 1"
.LASF1122:
	.string	"_GLIBCXX_USE_C99_STDINT_TR1 1"
.LASF86:
	.string	"__cpp_raw_strings 200710L"
.LASF792:
	.string	"__CFLOAT32X _Complex double"
.LASF671:
	.string	"__S64_TYPE long int"
.LASF636:
	.string	"_SIZE_T "
.LASF1278:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF203:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF83:
	.string	"__cpp_binary_literals 201304L"
.LASF503:
	.string	"_LARGEFILE_SOURCE 1"
.LASF194:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF160:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF863:
	.string	"_GLIBCXX_NATIVE_THREAD_ID pthread_self()"
.LASF44:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF1039:
	.string	"_GLIBCXX_HAVE_STRERROR_L 1"
.LASF185:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF1201:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (status)"
.LASF1675:
	.string	"newLine"
.LASF491:
	.string	"__USE_ISOC95 1"
.LASF843:
	.string	"_GLIBCXX_END_NAMESPACE_ALGO "
.LASF522:
	.string	"__GLIBC_MINOR__ 35"
.LASF320:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF183:
	.string	"__INT64_C(c) c ## L"
.LASF838:
	.string	"_GLIBCXX_STD_C std"
.LASF1014:
	.string	"_GLIBCXX_HAVE_NETINET_IN_H 1"
.LASF874:
	.string	"_GLIBCXX_USE_C99_MATH _GLIBCXX11_USE_C99_MATH"
.LASF618:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF9:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF231:
	.string	"__DBL_DIG__ 15"
.LASF1479:
	.string	"S_IRUSR __S_IREAD"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/tnvc/Documents/assembler/assembler"
.LASF0:
	.string	"../src/logging/logging.cpp"
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
