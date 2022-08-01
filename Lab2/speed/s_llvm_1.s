	.text
	.file	"main.c"
	.globl	qsort                   # -- Begin function qsort
	.p2align	4, 0x90
	.type	qsort,@function
qsort:                                  # @qsort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	cmpl	%r14d, %edi
	jge	.LBB0_13
	.p2align	4, 0x90
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_5 Depth 3
                                        #       Child Loop BB0_8 Depth 3
	movslq	%edi, %rdx
	movl	a(,%rdx,4), %eax
	movl	%r14d, %ecx
	cmpl	%r14d, %edx
	jge	.LBB0_12
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	%edi, %edx
	movl	%r14d, %ecx
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
                                        #       Child Loop BB0_8 Depth 3
	cmpl	%ecx, %edx
	jge	.LBB0_7
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movslq	%ecx, %rcx
	movslq	%edx, %rsi
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	a(,%rcx,4), %eax
	jg	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=3
	addq	$-1, %rcx
	cmpq	%rsi, %rcx
	jg	.LBB0_5
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movslq	%ecx, %rsi
	movl	a(,%rsi,4), %ebp
	movslq	%edx, %rbx
	movl	%ebp, a(,%rbx,4)
	cmpl	%esi, %edx
	jge	.LBB0_11
	.p2align	4, 0x90
.LBB0_8:                                #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	%eax, a(,%rbx,4)
	jge	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=3
	addq	$1, %rbx
	cmpq	%rsi, %rbx
	jl	.LBB0_8
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=2
	movl	%ebx, %edx
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=2
	movslq	%edx, %rbp
	movl	a(,%rbp,4), %ebx
	movl	%ebx, a(,%rsi,4)
	cmpl	%esi, %ebp
	jl	.LBB0_3
.LBB0_12:                               #   in Loop: Header=BB0_1 Depth=1
	movslq	%ecx, %rbx
	movl	%eax, a(,%rbx,4)
	leal	-1(%rbx), %esi
	callq	qsort
	addl	$1, %ebx
	movl	%ebx, %edi
	cmpl	%r14d, %ebx
	jl	.LBB0_1
.LBB0_13:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	qsort, .Lfunc_end0-qsort
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI1_0:
	.quad	4696837146684686336     # double 1.0E+6
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$.L.str, %edi
	movl	$.L.str.1, %esi
	callq	fopen
	movq	%rax, %r14
	testq	%r14, %r14
	je	.LBB1_1
# %bb.2:
	leaq	12(%rsp), %rdx
	movl	$.L.str.3, %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	__isoc99_fscanf
	cmpl	$0, 12(%rsp)
	jle	.LBB1_5
# %bb.3:
	movl	$a, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	movl	$.L.str.3, %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%r15, %rdx
	callq	__isoc99_fscanf
	addq	$1, %rbx
	movslq	12(%rsp), %rax
	addq	$4, %r15
	cmpq	%rax, %rbx
	jl	.LBB1_4
.LBB1_5:
	movq	%r14, %rdi
	callq	fclose
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	$-40, %rbx
	.p2align	4, 0x90
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	movl	a+40(%rbx), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	addq	$4, %rbx
	jne	.LBB1_6
# %bb.7:
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.11, %edi
	callq	puts
	callq	clock
	movq	%rax, %r14
	movl	12(%rsp), %esi
	addl	$-1, %esi
	xorl	%edi, %edi
	callq	qsort
	callq	clock
	movq	%rax, %r15
	movl	$.Lstr.12, %edi
	callq	puts
	movl	$.L.str.9, %edi
	xorl	%eax, %eax
	callq	printf
	movq	$-40, %rbx
	.p2align	4, 0x90
.LBB1_8:                                # =>This Inner Loop Header: Depth=1
	movl	a+40(%rbx), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	addq	$4, %rbx
	jne	.LBB1_8
# %bb.9:
	movl	$.Lstr.13, %edi
	callq	puts
	subq	%r14, %r15
	cvtsi2sdq	%r15, %xmm0
	divsd	.LCPI1_0(%rip), %xmm0
	movl	$.L.str.10, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	jmp	.LBB1_10
.LBB1_1:
	movl	$.Lstr.14, %edi
	callq	puts
	movl	$1, %eax
.LBB1_10:
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	a,@object               # @a
	.bss
	.globl	a
	.p2align	4
a:
	.zero	20000020
	.size	a, 20000020

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"5000000.txt"
	.size	.L.str, 12

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"r"
	.size	.L.str.1, 2

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%d"
	.size	.L.str.3, 3

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"Before sort: "
	.size	.L.str.4, 14

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"%d "
	.size	.L.str.5, 4

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"After sort: "
	.size	.L.str.9, 13

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"run time: %f\n"
	.size	.L.str.10, 14

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"\n"
	.size	.Lstr, 2

	.type	.Lstr.11,@object        # @str.11
.Lstr.11:
	.asciz	"Start"
	.size	.Lstr.11, 6

	.type	.Lstr.12,@object        # @str.12
.Lstr.12:
	.asciz	"Finish!\n"
	.size	.Lstr.12, 9

	.type	.Lstr.13,@object        # @str.13
.Lstr.13:
	.asciz	"\n"
	.size	.Lstr.13, 2

	.type	.Lstr.14,@object        # @str.14
.Lstr.14:
	.asciz	"File not exist"
	.size	.Lstr.14, 15


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
