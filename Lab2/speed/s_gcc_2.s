	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB23:
	.cfi_startproc
	cmpl	%esi, %edi
	jge	.L20
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	a(%rip), %rbp
	movslq	%esi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L11:
	movslq	%edi, %rax
	movl	0(%rbp,%rbx,4), %edx
	leal	-1(%r12), %esi
	movl	0(%rbp,%rax,4), %r8d
	movl	%r12d, %r9d
	movslq	%edi, %rcx
.L3:
	movslq	%esi, %rax
	leaq	0(%rbp,%rax,4), %rax
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L25:
	subl	$1, %esi
.L10:
	cmpl	%edx, %r8d
	movl	%esi, %r13d
	jg	.L24
	subq	$4, %rax
	cmpl	%ecx, %esi
	movl	4(%rax), %edx
	movl	%esi, %r9d
	jg	.L25
	movl	%edx, 0(%rbp,%rcx,4)
.L12:
	movslq	%r13d, %rax
	leal	-1(%r13), %esi
	movl	%edx, 0(%rbp,%rax,4)
.L14:
	movl	%r8d, 0(%rbp,%rax,4)
	call	qsort
	leal	1(%r13), %edi
	cmpl	%r12d, %edi
	jl	.L11
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	movslq	%ecx, %rax
	cmpl	%r9d, %ecx
	movl	%edx, 0(%rbp,%rax,4)
	jge	.L26
	leal	1(%rcx), %eax
	notl	%ecx
	leal	(%rcx,%r9), %r10d
	cltq
	addq	%rax, %r10
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L28:
	addq	$1, %rax
	cmpl	%r8d, %edx
	jge	.L27
.L8:
	cmpq	%r10, %rax
	movslq	%eax, %rcx
	movl	0(%rbp,%rax,4), %edx
	jne	.L28
	movslq	%r9d, %rax
	movl	%r9d, %r13d
	movl	%edx, 0(%rbp,%rax,4)
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L27:
	movslq	%r9d, %rax
	movl	%edx, 0(%rbp,%rax,4)
	jmp	.L3
.L20:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	rep ret
.L26:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	movl	%r9d, %r13d
	jmp	.L12
	.cfi_endproc
.LFE23:
	.size	qsort, .-qsort
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"5000000.txt"
.LC2:
	.string	"File not exist"
.LC3:
	.string	"%d"
.LC4:
	.string	"Before sort: "
.LC5:
	.string	"%d "
.LC6:
	.string	"\n"
.LC7:
	.string	"Start"
.LC8:
	.string	"Finish!\n"
.LC9:
	.string	"After sort: "
.LC11:
	.string	"run time: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	.LC0(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC1(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L42
	leaq	4(%rsp), %rdx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jle	.L32
	leaq	a(%rip), %rbp
	leaq	.LC3(%rip), %r13
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%rbp, %rdx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%r12, %rdi
	addl	$1, %ebx
	addq	$4, %rbp
	call	__isoc99_fscanf@PLT
	cmpl	%ebx, 4(%rsp)
	jg	.L33
.L32:
	leaq	a(%rip), %rbp
	movq	%r12, %rdi
	leaq	.LC5(%rip), %r12
	call	fclose@PLT
	leaq	40(%rbp), %r13
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%rbp, %rbx
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L34:
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$4, %rbx
	call	__printf_chk@PLT
	cmpq	%r13, %rbx
	jne	.L34
	leaq	.LC6(%rip), %rdi
	leaq	.LC5(%rip), %r12
	call	puts@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	call	clock@PLT
	movq	%rax, %r14
	movl	4(%rsp), %eax
	xorl	%edi, %edi
	leal	-1(%rax), %esi
	call	qsort
	call	clock@PLT
	leaq	.LC8(%rip), %rdi
	movq	%rax, %r13
	call	puts@PLT
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L35:
	movl	0(%rbp), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$4, %rbp
	call	__printf_chk@PLT
	cmpq	%rbx, %rbp
	jne	.L35
	leaq	.LC6(%rip), %rdi
	subq	%r14, %r13
	call	puts@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	cvtsi2sdq	%r13, %xmm0
	divsd	.LC10(%rip), %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
.L29:
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L43
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L42:
	.cfi_restore_state
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L29
.L43:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 20000020
a:
	.zero	20000020
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC10:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
