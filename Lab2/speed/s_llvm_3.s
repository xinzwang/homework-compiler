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
	jge	.LBB0_19
	.p2align	4, 0x90
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_6 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	movslq	%edi, %rdx
	movl	a(,%rdx,4), %eax
	movl	%r14d, %ecx
	cmpl	%r14d, %edx
	jge	.LBB0_18
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	%edi, %edx
	movl	%r14d, %ecx
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_6 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	cmpl	%ecx, %edx
	jge	.LBB0_4
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=2
	movslq	%ecx, %rcx
	movslq	%edx, %rbp
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	a(,%rcx,4), %eax
	jg	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=3
	addq	$-1, %rcx
	cmpq	%rbp, %rcx
	jg	.LBB0_6
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	movslq	%edx, %rbp
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=2
	movslq	%ecx, %rbx
	movl	a(,%rbx,4), %esi
	movl	%esi, a(,%rbp,4)
	cmpl	%ebx, %edx
	jge	.LBB0_9
# %bb.10:                               #   in Loop: Header=BB0_3 Depth=2
	cmpl	%eax, %esi
	jge	.LBB0_11
# %bb.12:                               #   in Loop: Header=BB0_3 Depth=2
	addl	$1, %edx
	.p2align	4, 0x90
.LBB0_13:                               #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leaq	1(%rbp), %rsi
	cmpq	%rbx, %rsi
	jge	.LBB0_16
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=3
	addl	$1, %edx
	cmpl	%eax, a+4(,%rbp,4)
	movq	%rsi, %rbp
	jl	.LBB0_13
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=2
	leaq	a(,%rbp,4), %rsi
	movl	(%rsi), %esi
	movl	%esi, a(,%rbx,4)
	cmpl	%ebx, %edx
	jl	.LBB0_3
	jmp	.LBB0_18
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=2
	movq	%rbp, %rsi
.LBB0_15:                               #   in Loop: Header=BB0_3 Depth=2
	movl	%esi, %edx
.LBB0_16:                               #   in Loop: Header=BB0_3 Depth=2
	movslq	%edx, %rsi
	leaq	a(,%rsi,4), %rsi
	movl	(%rsi), %esi
	movl	%esi, a(,%rbx,4)
	cmpl	%ebx, %edx
	jl	.LBB0_3
.LBB0_18:                               #   in Loop: Header=BB0_1 Depth=1
	movslq	%ecx, %rbx
	movl	%eax, a(,%rbx,4)
	leal	-1(%rbx), %esi
	callq	qsort
	addl	$1, %ebx
	movl	%ebx, %edi
	cmpl	%r14d, %ebx
	jl	.LBB0_1
.LBB0_19:
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$.L.str, %edi
	movl	$.L.str.1, %esi
	callq	fopen
	movq	%rax, %r15
	testq	%r15, %r15
	je	.LBB1_1
# %bb.2:
	xorl	%r14d, %r14d
	leaq	4(%rsp), %rdx
	movl	$.L.str.3, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	callq	__isoc99_fscanf
	cmpl	$0, 4(%rsp)
	jle	.LBB1_5
# %bb.3:
	movl	$a, %ebp
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	movl	$.L.str.3, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movq	%rbp, %rdx
	callq	__isoc99_fscanf
	addq	$1, %rbx
	movslq	4(%rsp), %rax
	addq	$4, %rbp
	cmpq	%rax, %rbx
	jl	.LBB1_4
.LBB1_5:
	movq	%r15, %rdi
	callq	fclose
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+4(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+8(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+12(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+16(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+20(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+24(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+28(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+32(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+36(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.Lstr.13, %edi
	callq	puts
	movl	$.Lstr.11, %edi
	callq	puts
	callq	clock
	movq	%rax, %rbx
	movl	4(%rsp), %esi
	addl	$-1, %esi
	xorl	%edi, %edi
	callq	qsort
	callq	clock
	movq	%rax, %rbp
	movl	$.Lstr.12, %edi
	callq	puts
	movl	$.L.str.9, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+4(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+8(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+12(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+16(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+20(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+24(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+28(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+32(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	a+36(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.Lstr.13, %edi
	callq	puts
	subq	%rbx, %rbp
	cvtsi2sdq	%rbp, %xmm0
	divsd	.LCPI1_0(%rip), %xmm0
	movl	$.L.str.10, %edi
	movb	$1, %al
	callq	printf
	jmp	.LBB1_6
.LBB1_1:
	movl	$.Lstr.14, %edi
	callq	puts
	movl	$1, %r14d
.LBB1_6:
	movl	%r14d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
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
