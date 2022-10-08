	.file	"coloroutput.cpp"
	.text
.Ltext0:
	.file 0 "/home/tnvc/Documents/assembler/assembler" "../src/utils/coloroutput.cpp"
	.section	.rodata
	.align 4
	.type	_ZL12COLORS_COUNT, @object
	.size	_ZL12COLORS_COUNT, 4
_ZL12COLORS_COUNT:
	.long	15
	.align 4
	.type	_ZL12STYLES_COUNT, @object
	.size	_ZL12STYLES_COUNT, 4
_ZL12STYLES_COUNT:
	.long	8
	.globl	FOREGROUND_COLOR_CODES
.LC0:
	.string	"\033[30m"
.LC1:
	.string	"\033[31m"
.LC2:
	.string	"\033[32m"
.LC3:
	.string	"\033[33m"
.LC4:
	.string	"\033[34m"
.LC5:
	.string	"\033[35m"
.LC6:
	.string	"\033[36m"
.LC7:
	.string	"\033[37m"
.LC8:
	.string	"\033[90m"
.LC9:
	.string	"\033[91m"
.LC10:
	.string	"\033[92m"
.LC11:
	.string	"\033[93m"
.LC12:
	.string	"\033[94m"
.LC13:
	.string	"\033[95m"
.LC14:
	.string	"\033[96m"
.LC15:
	.string	"\033[97m"
	.section	.data.rel.local,"aw"
	.align 32
	.type	FOREGROUND_COLOR_CODES, @object
	.size	FOREGROUND_COLOR_CODES, 128
FOREGROUND_COLOR_CODES:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.globl	BACKGROUND_COLOR_CODES
	.section	.rodata
.LC16:
	.string	"\033[40m"
.LC17:
	.string	"\033[41m"
.LC18:
	.string	"\033[42m"
.LC19:
	.string	"\033[43m"
.LC20:
	.string	"\033[44m"
.LC21:
	.string	"\033[45m"
.LC22:
	.string	"\033[46m"
.LC23:
	.string	"\033[47m"
.LC24:
	.string	"\033[100m"
.LC25:
	.string	"\033[101m"
.LC26:
	.string	"\033[102m"
.LC27:
	.string	"\033[103m"
.LC28:
	.string	"\033[104m"
.LC29:
	.string	"\033[105m"
.LC30:
	.string	"\033[106m"
.LC31:
	.string	"\033[107m"
	.section	.data.rel.local
	.align 32
	.type	BACKGROUND_COLOR_CODES, @object
	.size	BACKGROUND_COLOR_CODES, 128
BACKGROUND_COLOR_CODES:
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.globl	FONT_STYLE_CODES
	.section	.rodata
.LC32:
	.string	"\033[0m"
.LC33:
	.string	"\033[1m"
.LC34:
	.string	"\033[2m"
.LC35:
	.string	"\033[3m"
.LC36:
	.string	"\033[4m"
.LC37:
	.string	"\033[5m"
.LC38:
	.string	"\033[7m"
.LC39:
	.string	"\033[21m"
	.section	.data.rel.local
	.align 32
	.type	FONT_STYLE_CODES, @object
	.size	FONT_STYLE_CODES, 64
FONT_STYLE_CODES:
	.quad	.LC32
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	.LC36
	.quad	.LC37
	.quad	.LC38
	.quad	.LC39
	.text
	.globl	_Z18setForegroundColori
	.type	_Z18setForegroundColori, @function
_Z18setForegroundColori:
.LFB0:
	.file 1 "../src/utils/coloroutput.cpp"
	.loc 1 57 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 58 3
	cmpl	$0, -4(%rbp)
	js	.L5
	.loc 1 58 17 discriminator 1
	cmpl	$15, -4(%rbp)
	jg	.L5
	.loc 1 61 9
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	FOREGROUND_COLOR_CODES(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L1
.L5:
	.loc 1 59 5
	nop
.L1:
	.loc 1 62 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z18setForegroundColori, .-_Z18setForegroundColori
	.globl	_Z18setBackgroundColori
	.type	_Z18setBackgroundColori, @function
_Z18setBackgroundColori:
.LFB1:
	.loc 1 65 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 66 3
	cmpl	$0, -4(%rbp)
	js	.L10
	.loc 1 66 17 discriminator 1
	cmpl	$15, -4(%rbp)
	jg	.L10
	.loc 1 69 9
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	BACKGROUND_COLOR_CODES(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L10:
	.loc 1 67 5
	nop
.L6:
	.loc 1 70 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z18setBackgroundColori, .-_Z18setBackgroundColori
	.globl	_Z12setFontStylei
	.type	_Z12setFontStylei, @function
_Z12setFontStylei:
.LFB2:
	.loc 1 73 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 74 3
	cmpl	$0, -4(%rbp)
	js	.L15
	.loc 1 74 17 discriminator 1
	cmpl	$8, -4(%rbp)
	jg	.L15
	.loc 1 77 9
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	FONT_STYLE_CODES(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L11
.L15:
	.loc 1 75 5
	nop
.L11:
	.loc 1 78 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z12setFontStylei, .-_Z12setFontStylei
	.globl	_Z12resetConsolev
	.type	_Z12resetConsolev, @function
_Z12resetConsolev:
.LFB3:
	.loc 1 81 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 82 9
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 83 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z12resetConsolev, .-_Z12resetConsolev
.Letext0:
	.file 2 "../include/utils/coloroutput.h"
	.file 3 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1e6
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x9
	.long	.LASF819
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF795
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF796
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF797
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF798
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF799
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF800
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	0x5c
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF801
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF802
	.uleb128 0x4
	.long	0x6f
	.uleb128 0xb
	.byte	0x8
	.long	0x76
	.uleb128 0x1
	.byte	0x20
	.byte	0x3
	.long	.LASF803
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF804
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.long	.LASF805
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF806
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF807
	.uleb128 0x5
	.long	.LASF808
	.byte	0x22
	.long	0x63
	.uleb128 0x9
	.byte	0x3
	.quad	_ZL12COLORS_COUNT
	.uleb128 0x5
	.long	.LASF809
	.byte	0x23
	.long	0x63
	.uleb128 0x9
	.byte	0x3
	.quad	_ZL12STYLES_COUNT
	.uleb128 0x6
	.long	0x7b
	.long	0xdc
	.uleb128 0x7
	.long	0x32
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.long	.LASF810
	.byte	0x6
	.long	0xcc
	.uleb128 0x9
	.byte	0x3
	.quad	FOREGROUND_COLOR_CODES
	.uleb128 0x2
	.long	.LASF811
	.byte	0x19
	.long	0xcc
	.uleb128 0x9
	.byte	0x3
	.quad	BACKGROUND_COLOR_CODES
	.uleb128 0x6
	.long	0x7b
	.long	0x114
	.uleb128 0x7
	.long	0x32
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF812
	.byte	0x2d
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	FONT_STYLE_CODES
	.uleb128 0xc
	.long	.LASF820
	.byte	0x3
	.value	0x164
	.byte	0xc
	.long	0x5c
	.long	0x140
	.uleb128 0xd
	.long	0x7b
	.uleb128 0xe
	.byte	0
	.uleb128 0xf
	.long	.LASF821
	.byte	0x1
	.byte	0x50
	.byte	0x6
	.long	.LASF822
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF813
	.byte	0x48
	.long	.LASF815
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x18d
	.uleb128 0x3
	.long	.LASF817
	.byte	0x48
	.byte	0x17
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x8
	.long	.LASF814
	.byte	0x40
	.long	.LASF816
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x1bc
	.uleb128 0x3
	.long	.LASF818
	.byte	0x40
	.byte	0x1d
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x10
	.long	.LASF823
	.byte	0x1
	.byte	0x38
	.byte	0x6
	.long	.LASF824
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.long	.LASF818
	.byte	0x38
	.byte	0x1d
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x6e
	.uleb128 0xe
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x10
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
	.file 4 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro3
	.file 5 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF431
	.file 6 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro4
	.file 7 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0x7
	.file 8 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 9 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x9
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x8
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
	.file 10 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 11 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x15
	.long	.LASF592
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 12 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0xc
	.file 13 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xd
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
	.file 14 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.byte	0x5
	.uleb128 0x23
	.long	.LASF655
	.file 15 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.file 16 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x18
	.long	.LASF658
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x9
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF511
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 17 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 18 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF718
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x2
	.long	.LASF719
	.file 20 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x2
	.long	.LASF720
	.byte	0x4
	.byte	0x4
	.file 21 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x2
	.long	.LASF721
	.byte	0x4
	.file 22 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x2
	.long	.LASF722
	.byte	0x4
	.file 23 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x17
	.byte	0x5
	.uleb128 0x2
	.long	.LASF723
	.byte	0x4
	.file 24 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.file 25 "/usr/include/x86_64-linux-gnu/bits/types/cookie_io_functions_t.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x13
	.long	.LASF732
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.file 26 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 27 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro21
	.file 28 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x1c
	.byte	0x5
	.uleb128 0x15
	.long	.LASF772
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xb
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
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x2
	.long	.LASF794
	.byte	0x4
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF737:
	.string	"_IOFBF 0"
.LASF478:
	.string	"_XOPEN_SOURCE_EXTENDED"
.LASF673:
	.string	"__STD_TYPE typedef"
.LASF94:
	.string	"__cpp_variadic_templates 200704L"
.LASF298:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF362:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF767:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF58:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF377:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF171:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF775:
	.string	"__HAVE_FLOAT64 1"
.LASF67:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF711:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF613:
	.string	"__stub_gtty "
.LASF292:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF740:
	.string	"BUFSIZ 8192"
.LASF3:
	.string	"__cplusplus 201703L"
.LASF749:
	.string	"L_tmpnam 20"
.LASF156:
	.string	"__SIZE_WIDTH__ 64"
.LASF361:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF532:
	.string	"__THROWNL __THROW"
.LASF23:
	.string	"__LP64__ 1"
.LASF616:
	.string	"__stub_sigreturn "
.LASF816:
	.string	"_Z18setBackgroundColori"
.LASF557:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __THROW __asm__ (__ASMNAME (#alias))"
.LASF285:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF107:
	.string	"__cpp_digit_separators 201309L"
.LASF16:
	.string	"__ATOMIC_CONSUME 1"
.LASF459:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF452:
	.string	"__USE_ATFILE"
.LASF482:
	.string	"_DEFAULT_SOURCE"
.LASF554:
	.string	"__flexarr []"
.LASF310:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF745:
	.string	"SEEK_DATA 3"
.LASF519:
	.string	"__GNU_LIBRARY__"
.LASF202:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF235:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF809:
	.string	"STYLES_COUNT"
.LASF500:
	.string	"__USE_XOPEN_EXTENDED 1"
.LASF346:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF199:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF515:
	.string	"__USE_GNU 1"
.LASF36:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF788:
	.string	"__f32x(x) x"
.LASF352:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF226:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF52:
	.string	"__INT8_TYPE__ signed char"
.LASF108:
	.string	"__cpp_unicode_characters 201411L"
.LASF10:
	.string	"__VERSION__ \"11.2.0\""
.LASF102:
	.string	"__cpp_init_captures 201304L"
.LASF269:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF549:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF4:
	.string	"__STDC_UTF_16__ 1"
.LASF43:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF792:
	.string	"__CFLOAT32X _Complex double"
.LASF822:
	.string	"_Z12resetConsolev"
.LASF130:
	.string	"__STDCPP_DEFAULT_NEW_ALIGNMENT__ 16"
.LASF186:
	.string	"__UINT8_C(c) c"
.LASF53:
	.string	"__INT16_TYPE__ short int"
.LASF653:
	.string	"NULL __null"
.LASF414:
	.string	"__gnu_linux__ 1"
.LASF568:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF369:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF6:
	.string	"__STDC_HOSTED__ 1"
.LASF718:
	.string	"__STD_TYPE"
.LASF394:
	.string	"__x86_64 1"
.LASF535:
	.string	"__P(args) args"
.LASF241:
	.string	"__DBL_DENORM_MIN__ double(4.94065645841246544176568792868221372e-324L)"
.LASF635:
	.string	"__SIZE_T__ "
.LASF272:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF655:
	.string	"__need___va_list "
.LASF168:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF824:
	.string	"_Z18setForegroundColori"
.LASF222:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF265:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF246:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF407:
	.string	"__FXSR__ 1"
.LASF774:
	.string	"__HAVE_FLOAT32 1"
.LASF282:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF650:
	.string	"__size_t "
.LASF712:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF268:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF670:
	.string	"__ULONG32_TYPE unsigned int"
.LASF523:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF556:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF639:
	.string	"_T_SIZE "
.LASF35:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF360:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF413:
	.string	"__CET__ 3"
.LASF309:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF434:
	.string	"__USE_ISOC99"
.LASF450:
	.string	"__USE_FILE_OFFSET64"
.LASF281:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF437:
	.string	"__USE_POSIX"
.LASF33:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF348:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF746:
	.string	"SEEK_HOLE 4"
.LASF652:
	.string	"NULL"
.LASF716:
	.string	"_BITS_TIME64_H 1"
.LASF332:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF753:
	.string	"L_cuserid 9"
.LASF819:
	.string	"GNU C++17 11.2.0 -mtune=generic -march=x86-64 -ggdb3 -O0 -std=c++17 -fcheck-new -fsized-deallocation -fstack-protector -fstrict-overflow -fno-omit-frame-pointer -fPIE -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection"
.LASF612:
	.string	"__stub_fchflags "
.LASF240:
	.string	"__DBL_EPSILON__ double(2.22044604925031308084726333618164062e-16L)"
.LASF383:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF47:
	.string	"__INTMAX_TYPE__ long int"
.LASF695:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF778:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF815:
	.string	"_Z12setFontStylei"
.LASF303:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF79:
	.string	"__DEPRECATED 1"
.LASF254:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF461:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF441:
	.string	"__USE_XOPEN"
.LASF201:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF163:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF324:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF578:
	.string	"__always_inline"
.LASF637:
	.string	"_SYS_SIZE_T_H "
.LASF791:
	.string	"__CFLOAT64 _Complex double"
.LASF64:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF457:
	.string	"__GLIBC_USE_ISOC2X"
.LASF398:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF521:
	.string	"__GLIBC__ 2"
.LASF468:
	.string	"_ISOC11_SOURCE"
.LASF781:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF801:
	.string	"long int"
.LASF511:
	.string	"__TIMESIZE __WORDSIZE"
.LASF630:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF317:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF325:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF462:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF498:
	.string	"__USE_XOPEN2K8 1"
.LASF704:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF492:
	.string	"__USE_ISOCXX11 1"
.LASF358:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF85:
	.string	"__cpp_runtime_arrays 198712L"
.LASF634:
	.string	"__size_t__ "
.LASF297:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF719:
	.string	"_____fpos_t_defined 1"
.LASF75:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF417:
	.string	"__unix 1"
.LASF60:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF39:
	.string	"__SIZEOF_POINTER__ 8"
.LASF373:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF715:
	.string	"__FD_SETSIZE 1024"
.LASF339:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF735:
	.string	"__off64_t_defined "
.LASF700:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF267:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF755:
	.string	"FOPEN_MAX 16"
.LASF74:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF694:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF41:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF575:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF314:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF646:
	.string	"_SIZE_T_DECLARED "
.LASF537:
	.string	"__CONCAT(x,y) x ## y"
.LASF758:
	.string	"stdout stdout"
.LASF599:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF204:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF245:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF218:
	.string	"__FLT_MAX_EXP__ 128"
.LASF424:
	.string	"__STDC_IEC_559__ 1"
.LASF25:
	.string	"__SIZEOF_LONG__ 8"
.LASF564:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF686:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF29:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF181:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF251:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF109:
	.string	"__cpp_static_assert 201411L"
.LASF430:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF423:
	.string	"_STDC_PREDEF_H 1"
.LASF132:
	.string	"__cpp_threadsafe_static_init 200806L"
.LASF20:
	.string	"__PIE__ 2"
.LASF290:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF354:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF512:
	.string	"__USE_MISC 1"
.LASF697:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF619:
	.string	"__GLIBC_USE_LIB_EXT2 1"
.LASF680:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF217:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF287:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF518:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF220:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF528:
	.string	"__glibc_has_extension(ext) 0"
.LASF799:
	.string	"signed char"
.LASF117:
	.string	"__cpp_if_constexpr 201606L"
.LASF83:
	.string	"__cpp_binary_literals 201304L"
.LASF660:
	.string	"__U16_TYPE unsigned short int"
.LASF274:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF539:
	.string	"__ptr_t void *"
.LASF366:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF228:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF709:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF675:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF592:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF155:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF187:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF529:
	.string	"__LEAF , __leaf__"
.LASF277:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF541:
	.string	"__END_DECLS }"
.LASF691:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF322:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF119:
	.string	"__cpp_inline_variables 201606L"
.LASF284:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF196:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF693:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF647:
	.string	"___int_size_t_h "
.LASF5:
	.string	"__STDC_UTF_32__ 1"
.LASF490:
	.string	"__USE_ISOC99 1"
.LASF273:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF219:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF536:
	.string	"__PMT(args) args"
.LASF420:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF359:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF91:
	.string	"__cpp_attributes 200809L"
.LASF329:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF506:
	.string	"__USE_LARGEFILE 1"
.LASF170:
	.string	"__UINT16_MAX__ 0xffff"
.LASF190:
	.string	"__UINT32_C(c) c ## U"
.LASF732:
	.string	"__cookie_io_functions_t_defined 1"
.LASF99:
	.string	"__cpp_ref_qualifiers 200710L"
.LASF158:
	.string	"__INTMAX_C(c) c ## L"
.LASF250:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF27:
	.string	"__SIZEOF_SHORT__ 2"
.LASF183:
	.string	"__INT64_C(c) c ## L"
.LASF610:
	.string	"__stub___compat_bdflush "
.LASF533:
	.string	"__NTH(fct) __LEAF_ATTR fct __THROW"
.LASF643:
	.string	"_SIZE_T_DEFINED_ "
.LASF160:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF120:
	.string	"__cpp_aggregate_bases 201603L"
.LASF702:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF304:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF517:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF131:
	.string	"__cpp_template_template_args 201611L"
.LASF565:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF264:
	.string	"__FLT32_DIG__ 6"
.LASF370:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF71:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF252:
	.string	"__DECIMAL_DIG__ 21"
.LASF547:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF632:
	.string	"__need_size_t "
.LASF663:
	.string	"__SLONGWORD_TYPE long int"
.LASF685:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF598:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF278:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF509:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF583:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF395:
	.string	"__x86_64__ 1"
.LASF444:
	.string	"__USE_XOPEN2K"
.LASF545:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF717:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF445:
	.string	"__USE_XOPEN2KXSI"
.LASF169:
	.string	"__UINT8_MAX__ 0xff"
.LASF421:
	.string	"_GNU_SOURCE 1"
.LASF224:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF330:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF581:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF626:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF477:
	.string	"_XOPEN_SOURCE 700"
.LASF242:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF40:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF495:
	.string	"__USE_POSIX199309 1"
.LASF104:
	.string	"__cpp_decltype_auto 201304L"
.LASF411:
	.string	"__SEG_FS 1"
.LASF136:
	.string	"__GXX_ABI_VERSION 1016"
.LASF176:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF123:
	.string	"__cpp_template_auto 201606L"
.LASF299:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF439:
	.string	"__USE_POSIX199309"
.LASF776:
	.string	"__HAVE_FLOAT32X 1"
.LASF428:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF742:
	.string	"SEEK_SET 0"
.LASF759:
	.string	"stderr stderr"
.LASF723:
	.string	"__FILE_defined 1"
.LASF726:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF522:
	.string	"__GLIBC_MINOR__ 35"
.LASF729:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF378:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF443:
	.string	"__USE_UNIX98"
.LASF68:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF460:
	.string	"__KERNEL_STRICT_NAMES "
.LASF679:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF731:
	.string	"_IO_USER_LOCK 0x8000"
.LASF184:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF793:
	.string	"__CFLOAT64X _Complex long double"
.LASF55:
	.string	"__INT64_TYPE__ long int"
.LASF664:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF382:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF419:
	.string	"__ELF__ 1"
.LASF733:
	.string	"_VA_LIST_DEFINED "
.LASF585:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF159:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF751:
	.string	"FILENAME_MAX 4096"
.LASF260:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF615:
	.string	"__stub_setlogin "
.LASF347:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF470:
	.string	"_ISOC2X_SOURCE"
.LASF316:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF657:
	.string	"__GNUC_VA_LIST "
.LASF548:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF820:
	.string	"printf"
.LASF87:
	.string	"__cpp_unicode_literals 200710L"
.LASF185:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF351:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF821:
	.string	"resetConsole"
.LASF340:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF748:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF386:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF427:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF622:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF629:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 1"
.LASF563:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF540:
	.string	"__BEGIN_DECLS extern \"C\" {"
.LASF720:
	.string	"____mbstate_t_defined 1"
.LASF178:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF212:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF356:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF623:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 1"
.LASF546:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF573:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF584:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF210:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF496:
	.string	"__USE_POSIX199506 1"
.LASF63:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF484:
	.string	"_ATFILE_SOURCE"
.LASF669:
	.string	"__SLONG32_TYPE int"
.LASF173:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF690:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF779:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF13:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF431:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF433:
	.string	"__USE_ISOC11"
.LASF510:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF570:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF315:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF364:
	.string	"__REGISTER_PREFIX__ "
.LASF238:
	.string	"__DBL_NORM_MAX__ double(1.79769313486231570814527423731704357e+308L)"
.LASF620:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF410:
	.string	"__MMX_WITH_SSE__ 1"
.LASF227:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF426:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF507:
	.string	"__USE_LARGEFILE64 1"
.LASF165:
	.string	"__INT8_MAX__ 0x7f"
.LASF692:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF385:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF658:
	.string	"_BITS_TYPES_H 1"
.LASF530:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF209:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF121:
	.string	"__cpp_deduction_guides 201703L"
.LASF19:
	.string	"__pie__ 2"
.LASF57:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF472:
	.string	"_POSIX_SOURCE"
.LASF133:
	.string	"__STDCPP_THREADS__ 1"
.LASF491:
	.string	"__USE_ISOC95 1"
.LASF602:
	.string	"__glibc_macro_warning(message) __glibc_macro_warning1 (GCC warning message)"
.LASF614:
	.string	"__stub_revoke "
.LASF345:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF638:
	.string	"_T_SIZE_ "
.LASF211:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF440:
	.string	"__USE_POSIX199506"
.LASF148:
	.string	"__SCHAR_WIDTH__ 8"
.LASF555:
	.string	"__glibc_c99_flexarr_available 1"
.LASF464:
	.string	"_ISOC95_SOURCE"
.LASF402:
	.string	"__k8__ 1"
.LASF22:
	.string	"_LP64 1"
.LASF194:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF301:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF633:
	.string	"__need_NULL "
.LASF432:
	.string	"_FEATURES_H 1"
.LASF483:
	.string	"_DEFAULT_SOURCE 1"
.LASF126:
	.string	"__cpp_guaranteed_copy_elision 201606L"
.LASF263:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF593:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF448:
	.string	"__USE_LARGEFILE"
.LASF567:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF237:
	.string	"__DBL_MAX__ double(1.79769313486231570814527423731704357e+308L)"
.LASF375:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF234:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF674:
	.string	"_BITS_TYPESIZES_H 1"
.LASF14:
	.string	"__ATOMIC_RELEASE 3"
.LASF323:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF214:
	.string	"__FLT_MANT_DIG__ 24"
.LASF804:
	.string	"__float128"
.LASF501:
	.string	"__USE_UNIX98 1"
.LASF502:
	.string	"_LARGEFILE_SOURCE"
.LASF157:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF288:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF111:
	.string	"__cpp_enumerator_attributes 201411L"
.LASF621:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 1"
.LASF405:
	.string	"__SSE__ 1"
.LASF161:
	.string	"__INTMAX_WIDTH__ 64"
.LASF253:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF101:
	.string	"__cpp_return_type_deduction 201304L"
.LASF7:
	.string	"__GNUC__ 11"
.LASF384:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF372:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF480:
	.string	"_LARGEFILE64_SOURCE"
.LASF710:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF307:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF756:
	.string	"_PRINTF_NAN_LEN_MAX 4"
.LASF179:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF595:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF438:
	.string	"__USE_POSIX2"
.LASF810:
	.string	"FOREGROUND_COLOR_CODES"
.LASF380:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF326:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF651:
	.string	"__need_size_t"
.LASF641:
	.string	"_SIZE_T_ "
.LASF514:
	.string	"__USE_DYNAMIC_STACK_SIZE 1"
.LASF213:
	.string	"__FLT_RADIX__ 2"
.LASF812:
	.string	"FONT_STYLE_CODES"
.LASF125:
	.string	"__cpp_variadic_using 201611L"
.LASF50:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF604:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF609:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF258:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF393:
	.string	"__amd64__ 1"
.LASF152:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF18:
	.string	"__PIC__ 2"
.LASF764:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF784:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF195:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF381:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF446:
	.string	"__USE_XOPEN2K8"
.LASF551:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF590:
	.string	"__attribute_copy__"
.LASF283:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF806:
	.string	"double"
.LASF197:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF48:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF476:
	.string	"_XOPEN_SOURCE"
.LASF154:
	.string	"__WINT_WIDTH__ 32"
.LASF32:
	.string	"__CHAR_BIT__ 8"
.LASF571:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF389:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF114:
	.string	"__cpp_nontype_template_args 201411L"
.LASF589:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF143:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF525:
	.string	"__PMT"
.LASF400:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF203:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF696:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF485:
	.string	"_ATFILE_SOURCE 1"
.LASF82:
	.string	"__GXX_EXPERIMENTAL_CXX0X__ 1"
.LASF665:
	.string	"__SQUAD_TYPE long int"
.LASF752:
	.string	"L_ctermid 9"
.LASF37:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF180:
	.string	"__INT32_C(c) c"
.LASF319:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF45:
	.string	"__WCHAR_TYPE__ int"
.LASF425:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF77:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF455:
	.string	"__USE_FORTIFY_LEVEL"
.LASF606:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF741:
	.string	"EOF (-1)"
.LASF365:
	.string	"__USER_LABEL_PREFIX__ "
.LASF113:
	.string	"__cpp_fold_expressions 201603L"
.LASF338:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF401:
	.string	"__k8 1"
.LASF730:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF601:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF766:
	.string	"__HAVE_FLOAT128 1"
.LASF544:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF66:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF12:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF70:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF216:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF293:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF526:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF46:
	.string	"__WINT_TYPE__ unsigned int"
.LASF289:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF451:
	.string	"__USE_MISC"
.LASF318:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF291:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF215:
	.string	"__FLT_DIG__ 6"
.LASF127:
	.string	"__cpp_nontype_template_parameter_auto 201606L"
.LASF808:
	.string	"COLORS_COUNT"
.LASF497:
	.string	"__USE_XOPEN2K 1"
.LASF489:
	.string	"__USE_ISOC11 1"
.LASF703:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF221:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF137:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF305:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF662:
	.string	"__U32_TYPE unsigned int"
.LASF151:
	.string	"__LONG_WIDTH__ 64"
.LASF562:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF81:
	.string	"__cpp_rtti 199711L"
.LASF300:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF312:
	.string	"__FLT32X_DIG__ 15"
.LASF208:
	.string	"__GCC_IEC_559 2"
.LASF566:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF487:
	.string	"_DYNAMIC_STACK_SIZE_SOURCE 1"
.LASF588:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF93:
	.string	"__cpp_rvalue_references 200610L"
.LASF2:
	.string	"__STDC__ 1"
.LASF391:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF699:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF38:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF796:
	.string	"unsigned int"
.LASF56:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF676:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF577:
	.string	"__wur "
.LASF504:
	.string	"__USE_XOPEN2K8XSI 1"
.LASF26:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF149:
	.string	"__SHRT_WIDTH__ 16"
.LASF357:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF115:
	.string	"__cpp_range_based_for 201603L"
.LASF668:
	.string	"__UWORD_TYPE unsigned long int"
.LASF403:
	.string	"__code_model_small__ 1"
.LASF714:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF520:
	.string	"__GNU_LIBRARY__ 6"
.LASF678:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF105:
	.string	"__cpp_aggregate_nsdmi 201304L"
.LASF313:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF374:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF687:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF594:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF167:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF538:
	.string	"__STRING(x) #x"
.LASF797:
	.string	"unsigned char"
.LASF591:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF783:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF654:
	.string	"__need_NULL"
.LASF135:
	.string	"__cpp_exceptions 199711L"
.LASF266:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF80:
	.string	"__GXX_RTTI 1"
.LASF531:
	.string	"__THROW noexcept (true)"
.LASF762:
	.string	"RENAME_WHITEOUT (1 << 2)"
.LASF777:
	.string	"__HAVE_FLOAT128X 0"
.LASF225:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF343:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF757:
	.string	"stdin stdin"
.LASF106:
	.string	"__cpp_variable_templates 201304L"
.LASF802:
	.string	"char"
.LASF803:
	.string	"__unknown__"
.LASF600:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF636:
	.string	"_SIZE_T "
.LASF738:
	.string	"_IOLBF 1"
.LASF122:
	.string	"__cpp_noexcept_function_type 201510L"
.LASF739:
	.string	"_IONBF 2"
.LASF722:
	.string	"____FILE_defined 1"
.LASF141:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF807:
	.string	"long double"
.LASF559:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF817:
	.string	"style"
.LASF760:
	.string	"RENAME_NOREPLACE (1 << 0)"
.LASF341:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF296:
	.string	"__FLT128_DIG__ 33"
.LASF174:
	.string	"__INT8_C(c) c"
.LASF270:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF798:
	.string	"short unsigned int"
.LASF787:
	.string	"__f64(x) x"
.LASF232:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF640:
	.string	"__SIZE_T "
.LASF54:
	.string	"__INT32_TYPE__ int"
.LASF350:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF376:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF707:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF435:
	.string	"__USE_ISOC95"
.LASF447:
	.string	"__USE_XOPEN2K8XSI"
.LASF727:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF442:
	.string	"__USE_XOPEN_EXTENDED"
.LASF95:
	.string	"__cpp_initializer_lists 200806L"
.LASF769:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF259:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF579:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF371:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF320:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF429:
	.string	"_STDIO_H 1"
.LASF574:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF794:
	.string	"COLOROUTPUT_H_ "
.LASF308:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF499:
	.string	"__USE_XOPEN 1"
.LASF294:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF110:
	.string	"__cpp_namespace_attributes 201411L"
.LASF34:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF706:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF327:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF124:
	.string	"__cpp_structured_bindings 201606L"
.LASF743:
	.string	"SEEK_CUR 1"
.LASF465:
	.string	"_ISOC95_SOURCE 1"
.LASF138:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF262:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF436:
	.string	"__USE_ISOCXX11"
.LASF644:
	.string	"_SIZE_T_DEFINED "
.LASF144:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF736:
	.string	"__ssize_t_defined "
.LASF672:
	.string	"__U64_TYPE unsigned long int"
.LASF334:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF76:
	.string	"__INTPTR_TYPE__ long int"
.LASF795:
	.string	"long unsigned int"
.LASF475:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF65:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF49:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF342:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF458:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF479:
	.string	"_XOPEN_SOURCE_EXTENDED 1"
.LASF780:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF205:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF21:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF744:
	.string	"SEEK_END 2"
.LASF72:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF508:
	.string	"__WORDSIZE 64"
.LASF388:
	.string	"__SIZEOF_INT128__ 16"
.LASF17:
	.string	"__pic__ 2"
.LASF617:
	.string	"__stub_stty "
.LASF44:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF349:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF552:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF182:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF671:
	.string	"__S64_TYPE long int"
.LASF605:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF642:
	.string	"_BSD_SIZE_T_ "
.LASF543:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF92:
	.string	"__cpp_rvalue_reference 200610L"
.LASF404:
	.string	"__MMX__ 1"
.LASF534:
	.string	"__NTHNL(fct) fct __THROW"
.LASF661:
	.string	"__S32_TYPE int"
.LASF128:
	.string	"__cpp_sized_deallocation 201309L"
.LASF147:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF192:
	.string	"__UINT64_C(c) c ## UL"
.LASF223:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF51:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF789:
	.string	"__f64x(x) x ##l"
.LASF229:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF786:
	.string	"__f32(x) x ##f"
.LASF513:
	.string	"__USE_ATFILE 1"
.LASF765:
	.string	"_BITS_FLOATN_H "
.LASF336:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF734:
	.string	"__off_t_defined "
.LASF818:
	.string	"color"
.LASF142:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF62:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF387:
	.string	"__SSP__ 1"
.LASF337:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF8:
	.string	"__GNUC_MINOR__ 2"
.LASF249:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF89:
	.string	"__cpp_lambdas 200907L"
.LASF261:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF379:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF768:
	.string	"__HAVE_FLOAT64X 1"
.LASF321:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF611:
	.string	"__stub_chflags "
.LASF728:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF454:
	.string	"__USE_GNU"
.LASF649:
	.string	"_SIZET_ "
.LASF811:
	.string	"BACKGROUND_COLOR_CODES"
.LASF244:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF823:
	.string	"setForegroundColor"
.LASF486:
	.string	"_DYNAMIC_STACK_SIZE_SOURCE"
.LASF406:
	.string	"__SSE2__ 1"
.LASF306:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF698:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF625:
	.string	"__GLIBC_USE_IEC_60559_EXT 1"
.LASF239:
	.string	"__DBL_MIN__ double(2.22507385850720138309023271733240406e-308L)"
.LASF772:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF813:
	.string	"setFontStyle"
.LASF582:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF453:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF363:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF231:
	.string	"__DBL_DIG__ 15"
.LASF572:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF31:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF550:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF412:
	.string	"__SEG_GS 1"
.LASF172:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF754:
	.string	"FOPEN_MAX"
.LASF399:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF721:
	.string	"_____fpos64_t_defined 1"
.LASF396:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF408:
	.string	"__SSE_MATH__ 1"
.LASF800:
	.string	"short int"
.LASF524:
	.string	"_SYS_CDEFS_H 1"
.LASF188:
	.string	"__UINT16_C(c) c"
.LASF90:
	.string	"__cpp_decltype 200707L"
.LASF463:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF367:
	.string	"__NO_INLINE__ 1"
.LASF331:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF11:
	.string	"__ATOMIC_RELAXED 0"
.LASF560:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF271:
	.string	"__FLT32_NORM_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF243:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF162:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF279:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF73:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF9:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF69:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF597:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF666:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF28:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF353:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF236:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF790:
	.string	"__CFLOAT32 _Complex float"
.LASF608:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF771:
	.string	"__CFLOAT128 __cfloat128"
.LASF683:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF166:
	.string	"__INT16_MAX__ 0x7fff"
.LASF761:
	.string	"RENAME_EXCHANGE (1 << 1)"
.LASF561:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF667:
	.string	"__SWORD_TYPE long int"
.LASF150:
	.string	"__INT_WIDTH__ 32"
.LASF569:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF295:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF78:
	.string	"__GXX_WEAK__ 1"
.LASF493:
	.string	"__USE_POSIX 1"
.LASF164:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF763:
	.string	"__attr_dealloc_fclose"
.LASF118:
	.string	"__cpp_capture_star_this 201603L"
.LASF607:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF255:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF481:
	.string	"_LARGEFILE64_SOURCE 1"
.LASF503:
	.string	"_LARGEFILE_SOURCE 1"
.LASF84:
	.string	"__cpp_hex_float 201603L"
.LASF659:
	.string	"__S16_TYPE short int"
.LASF390:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF576:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF580:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF275:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF344:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF59:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF782:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF335:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF30:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF596:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF586:
	.string	"__restrict_arr "
.LASF701:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF688:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF302:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF773:
	.string	"__HAVE_FLOAT16 0"
.LASF96:
	.string	"__cpp_delegating_constructors 200604L"
.LASF409:
	.string	"__SSE2_MATH__ 1"
.LASF42:
	.string	"__GNUG__ 11"
.LASF286:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF648:
	.string	"_GCC_SIZE_T "
.LASF785:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 0"
.LASF97:
	.string	"__cpp_nsdmi 200809L"
.LASF140:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF88:
	.string	"__cpp_user_defined_literals 200809L"
.LASF24:
	.string	"__SIZEOF_INT__ 4"
.LASF100:
	.string	"__cpp_alias_templates 200704L"
.LASF488:
	.string	"__GLIBC_USE_ISOC2X 1"
.LASF677:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF146:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF207:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF471:
	.string	"_ISOC2X_SOURCE 1"
.LASF542:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF392:
	.string	"__amd64 1"
.LASF473:
	.string	"_POSIX_SOURCE 1"
.LASF256:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF494:
	.string	"__USE_POSIX2 1"
.LASF418:
	.string	"__unix__ 1"
.LASF689:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF603:
	.string	"__HAVE_GENERIC_SELECTION 0"
.LASF112:
	.string	"__cpp_nested_namespace_definitions 201411L"
.LASF134:
	.string	"__EXCEPTIONS 1"
.LASF624:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF247:
	.string	"__LDBL_DIG__ 18"
.LASF681:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF505:
	.string	"__USE_XOPEN2KXSI 1"
.LASF129:
	.string	"__cpp_aligned_new 201606L"
.LASF145:
	.string	"__WINT_MIN__ 0U"
.LASF682:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF280:
	.string	"__FLT64_DIG__ 15"
.LASF355:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF747:
	.string	"P_tmpdir \"/tmp\""
.LASF814:
	.string	"setBackgroundColor"
.LASF705:
	.string	"__TIMER_T_TYPE void *"
.LASF175:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF558:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __THROWNL __asm__ (__ASMNAME (#alias))"
.LASF61:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF645:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF469:
	.string	"_ISOC11_SOURCE 1"
.LASF805:
	.string	"float"
.LASF276:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF627:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 1"
.LASF416:
	.string	"__linux__ 1"
.LASF516:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF248:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF631:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT 1"
.LASF628:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF708:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF770:
	.string	"__f128(x) x ##q"
.LASF656:
	.string	"__need___va_list"
.LASF397:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF422:
	.string	"_DEBUG 1"
.LASF189:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF724:
	.string	"__struct_FILE_defined 1"
.LASF368:
	.string	"__STRICT_ANSI__ 1"
.LASF553:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF684:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF86:
	.string	"__cpp_raw_strings 200710L"
.LASF103:
	.string	"__cpp_generic_lambdas 201304L"
.LASF456:
	.string	"__KERNEL_STRICT_NAMES"
.LASF311:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF153:
	.string	"__WCHAR_WIDTH__ 32"
.LASF449:
	.string	"__USE_LARGEFILE64"
.LASF725:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF177:
	.string	"__INT16_C(c) c"
.LASF328:
	.string	"__FLT64X_DIG__ 18"
.LASF116:
	.string	"__cpp_constexpr 201603L"
.LASF467:
	.string	"_ISOC99_SOURCE 1"
.LASF15:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF206:
	.string	"__INTPTR_WIDTH__ 64"
.LASF415:
	.string	"__linux 1"
.LASF233:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF198:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF257:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF466:
	.string	"_ISOC99_SOURCE"
.LASF98:
	.string	"__cpp_inheriting_constructors 201511L"
.LASF333:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF618:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF713:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF474:
	.string	"_POSIX_C_SOURCE"
.LASF230:
	.string	"__DBL_MANT_DIG__ 53"
.LASF200:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF587:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF139:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF191:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF193:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF750:
	.string	"TMP_MAX 238328"
.LASF527:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/tnvc/Documents/assembler/assembler"
.LASF0:
	.string	"../src/utils/coloroutput.cpp"
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
