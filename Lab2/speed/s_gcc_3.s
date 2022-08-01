	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB23:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cmpl	%esi, %edi
	movl	%esi, 56(%rsp)
	jge	.L1
	leaq	a(%rip), %r13
	movl	%edi, %r12d
.L91:
	movslq	56(%rsp), %rdx
	movslq	%r12d, %r11
	movslq	%r12d, %rax
	movl	0(%r13,%r11,4), %edi
	leal	-1(%rdx), %esi
	movl	%edx, %r8d
.L3:
	leaq	0(%r13,%rdx,4), %rdx
	movl	%esi, 20(%rsp)
	movl	(%rdx), %ecx
	cmpl	%edi, %ecx
	jl	.L160
.L5:
	subq	$4, %rdx
	cmpl	%eax, %esi
	jle	.L4
	movl	(%rdx), %ecx
	movl	%esi, %r8d
	subl	$1, %esi
	movl	%esi, 20(%rsp)
	cmpl	%edi, %ecx
	jge	.L5
.L160:
	movslq	%eax, %rdx
	cmpl	%r8d, %eax
	movl	%ecx, 0(%r13,%rdx,4)
	jge	.L161
	leal	1(%rax), %edx
	notl	%eax
	leal	(%rax,%r8), %r9d
	movslq	%edx, %rdx
	addq	%rdx, %r9
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L163:
	addq	$1, %rdx
	cmpl	%ecx, %edi
	jle	.L162
.L8:
	cmpq	%r9, %rdx
	movslq	%edx, %rax
	movl	0(%r13,%rdx,4), %ecx
	jne	.L163
	movslq	%r8d, %rdx
	movl	%r8d, 36(%rsp)
	movl	%ecx, 0(%r13,%rdx,4)
	jmp	.L94
.L11:
	movl	36(%rsp), %r12d
	addl	$1, %r12d
	cmpl	56(%rsp), %r12d
	jl	.L91
.L1:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movslq	%esi, %rdx
	movl	0(%r13,%rdx,4), %ecx
	movl	%edx, 36(%rsp)
	movl	%ecx, 0(%r13,%rax,4)
	movl	%r8d, %eax
	subl	$2, %eax
	movl	%eax, 20(%rsp)
.L92:
	movslq	36(%rsp), %rdx
	movl	%ecx, 0(%r13,%rdx,4)
.L94:
	cmpl	%r12d, 20(%rsp)
	movl	%edi, 0(%r13,%rdx,4)
	jle	.L11
.L90:
	movslq	20(%rsp), %rdx
	movl	0(%r13,%r11,4), %edi
	movslq	%r12d, %rax
	leal	-1(%rdx), %esi
	movl	%edx, %r8d
.L12:
	leaq	0(%r13,%rdx,4), %rdx
	jmp	.L19
.L14:
	subq	$4, %rdx
	cmpl	%eax, %esi
	jle	.L13
	movl	%esi, %r8d
	subl	$1, %esi
.L19:
	movl	(%rdx), %ecx
	movl	%esi, 16(%rsp)
	cmpl	%ecx, %edi
	jle	.L14
	movslq	%eax, %rdx
	cmpl	%eax, %r8d
	movl	%ecx, 0(%r13,%rdx,4)
	jle	.L164
	leal	1(%rax), %edx
	notl	%eax
	leal	(%rax,%r8), %r9d
	movslq	%edx, %rdx
	addq	%rdx, %r9
.L17:
	cmpq	%r9, %rdx
	movslq	%edx, %rax
	movl	0(%r13,%rdx,4), %ecx
	je	.L16
	addq	$1, %rdx
	cmpl	%ecx, %edi
	jg	.L17
	movslq	%r8d, %rdx
	movl	%ecx, 0(%r13,%rdx,4)
	jmp	.L12
.L16:
	movslq	%r8d, %rdx
	movl	%r8d, 40(%rsp)
	movl	%ecx, 0(%r13,%rdx,4)
.L97:
	cmpl	%r12d, 16(%rsp)
	movl	%edi, 0(%r13,%rdx,4)
	jle	.L20
.L89:
	movslq	16(%rsp), %rax
	movl	0(%r13,%r11,4), %r8d
	movslq	%r12d, %rdx
	leal	-1(%rax), %ecx
	movl	%eax, %esi
.L21:
	leaq	0(%r13,%rax,4), %rdi
	jmp	.L28
.L166:
	movl	%ecx, %esi
	subl	$1, %ecx
.L28:
	movl	(%rdi), %eax
	movl	%ecx, %r9d
	cmpl	%eax, %r8d
	jg	.L165
	subq	$4, %rdi
	cmpl	%edx, %ecx
	jg	.L166
	movslq	%r9d, %rcx
	leal	-2(%rsi), %edi
	movl	%r9d, 44(%rsp)
	movl	0(%r13,%rcx,4), %eax
	movl	%edi, 32(%rsp)
	movl	%eax, 0(%r13,%rdx,4)
.L98:
	cmpl	32(%rsp), %r12d
	movl	%eax, 0(%r13,%rcx,4)
	movl	%r8d, 0(%r13,%rcx,4)
	jge	.L29
.L88:
	movslq	32(%rsp), %rax
	movl	0(%r13,%r11,4), %edi
	movslq	%r12d, %rcx
	leal	-1(%rax), %edx
	movl	%eax, %r8d
.L30:
	leaq	0(%r13,%rax,4), %rax
	jmp	.L37
.L168:
	movl	%edx, %r8d
	subl	$1, %edx
.L37:
	movl	(%rax), %esi
	movl	%edx, %r9d
	cmpl	%esi, %edi
	jg	.L167
	subq	$4, %rax
	cmpl	%ecx, %edx
	jg	.L168
	movslq	%r9d, %rax
	leal	-2(%r8), %ebx
	movl	%r9d, 52(%rsp)
	movl	0(%r13,%rax,4), %esi
	movl	%ebx, 28(%rsp)
	movl	%esi, 0(%r13,%rcx,4)
.L101:
	cmpl	%r12d, 28(%rsp)
	movl	%esi, 0(%r13,%rax,4)
	movl	%edi, 0(%r13,%rax,4)
	jle	.L38
.L198:
	movl	%r12d, %edi
.L87:
	movslq	28(%rsp), %rax
	movl	0(%r13,%r11,4), %r8d
	movslq	%edi, %rcx
	leal	-1(%rax), %edx
	movl	%eax, %r9d
.L39:
	leaq	0(%r13,%rax,4), %rax
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L170:
	movl	%edx, %r9d
	subl	$1, %edx
.L46:
	movl	(%rax), %esi
	movl	%edx, %r10d
	cmpl	%esi, %r8d
	jg	.L169
	subq	$4, %rax
	cmpl	%ecx, %edx
	jg	.L170
	movslq	%r10d, %rax
	leal	-2(%r9), %ebx
	movl	%r10d, 48(%rsp)
	movl	0(%r13,%rax,4), %esi
	movl	%ebx, 24(%rsp)
	movl	%esi, 0(%r13,%rcx,4)
.L104:
	cmpl	24(%rsp), %edi
	movl	%esi, 0(%r13,%rax,4)
	movl	%r8d, 0(%r13,%rax,4)
	jge	.L47
.L86:
	movslq	24(%rsp), %rax
	movl	0(%r13,%r11,4), %esi
	movslq	%edi, %rdx
	leal	-1(%rax), %ebp
	movl	%eax, %r8d
.L48:
	leaq	0(%r13,%rax,4), %rax
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L172:
	movl	%ebp, %r8d
	subl	$1, %ebp
.L55:
	movl	(%rax), %ecx
	movl	%ebp, %r9d
	cmpl	%ecx, %esi
	jg	.L171
	subq	$4, %rax
	cmpl	%edx, %ebp
	jg	.L172
	movslq	%r9d, %rax
	leal	-2(%r8), %ebx
	movl	0(%r13,%rax,4), %ecx
	movl	%ebx, 12(%rsp)
	movl	%ecx, 0(%r13,%rdx,4)
.L107:
	cmpl	%edi, 12(%rsp)
	movl	%ecx, 0(%r13,%rax,4)
	movl	%esi, 0(%r13,%rax,4)
	jle	.L56
.L191:
	movl	%r9d, 60(%rsp)
.L85:
	movslq	12(%rsp), %rax
	movl	0(%r13,%r11,4), %ecx
	movslq	%edi, %rdx
	leal	-1(%rax), %ebx
	movl	%eax, %esi
.L57:
	leaq	0(%r13,%rax,4), %rax
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L174:
	movl	%ebx, %esi
	subl	$1, %ebx
.L64:
	movl	(%rax), %r8d
	movl	%ebx, %r12d
	cmpl	%r8d, %ecx
	jg	.L173
	subq	$4, %rax
	cmpl	%edx, %ebx
	jg	.L174
	movslq	%r12d, %rax
	leal	-2(%rsi), %ebx
	movl	0(%r13,%rax,4), %r8d
	movl	%r8d, 0(%r13,%rdx,4)
.L110:
	cmpl	%ebx, %edi
	movl	%r8d, 0(%r13,%rax,4)
	movl	%ecx, 0(%r13,%rax,4)
	jge	.L65
.L84:
	movl	0(%r13,%r11,4), %ecx
	leal	-1(%rbx), %ebp
	movl	%ebx, %esi
	movslq	%edi, %rdx
	movslq	%ebx, %rax
.L66:
	leaq	0(%r13,%rax,4), %rax
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L176:
	movl	%ebp, %esi
	subl	$1, %ebp
.L73:
	movl	(%rax), %r8d
	movl	%ebp, %r14d
	cmpl	%r8d, %ecx
	jg	.L175
	subq	$4, %rax
	cmpl	%edx, %ebp
	jg	.L176
	movslq	%r14d, %rax
	leal	-2(%rsi), %ebp
	movl	0(%r13,%rax,4), %r8d
	movl	%r8d, 0(%r13,%rdx,4)
.L113:
	cmpl	%ebp, %edi
	movl	%r8d, 0(%r13,%rax,4)
	movl	%ecx, 0(%r13,%rax,4)
	jge	.L74
.L83:
	movl	0(%r13,%r11,4), %ecx
	leal	-1(%rbp), %esi
	movl	%ebp, %r8d
	movslq	%edi, %rdx
	movslq	%ebp, %rax
.L75:
	leaq	0(%r13,%rax,4), %rax
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L178:
	movl	%esi, %r8d
	subl	$1, %esi
.L82:
	movl	(%rax), %r9d
	movl	%esi, %r15d
	cmpl	%r9d, %ecx
	jg	.L177
	subq	$4, %rax
	cmpl	%esi, %edx
	jl	.L178
	movslq	%r15d, %rax
	leal	-2(%r8), %esi
	movl	0(%r13,%rax,4), %r9d
	movl	%r9d, 0(%r13,%rdx,4)
.L116:
	movl	%r9d, 0(%r13,%rax,4)
.L118:
	movl	%ecx, 0(%r13,%rax,4)
	call	qsort
	leal	1(%r15), %edi
	cmpl	%ebp, %edi
	jge	.L74
	movslq	%edi, %r11
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L177:
	movslq	%edx, %rax
	cmpl	%edx, %r8d
	movl	%r9d, 0(%r13,%rax,4)
	jle	.L179
	leal	1(%rdx), %eax
	notl	%edx
	leal	(%rdx,%r8), %r10d
	cltq
	addq	%rax, %r10
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L181:
	addq	$1, %rax
	cmpl	%r9d, %ecx
	jle	.L180
.L80:
	cmpq	%rax, %r10
	movslq	%eax, %rdx
	movl	0(%r13,%rax,4), %r9d
	jne	.L181
	movslq	%r8d, %rax
	movl	%r8d, %r15d
	movl	%r9d, 0(%r13,%rax,4)
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L180:
	movslq	%r8d, %rax
	movl	%r9d, 0(%r13,%rax,4)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L175:
	movslq	%edx, %rax
	cmpl	%edx, %esi
	movl	%r8d, 0(%r13,%rax,4)
	jle	.L182
	leal	1(%rdx), %eax
	notl	%edx
	leal	(%rdx,%rsi), %r9d
	cltq
	addq	%rax, %r9
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L184:
	addq	$1, %rax
	cmpl	%r8d, %ecx
	jle	.L183
.L71:
	cmpq	%rax, %r9
	movslq	%eax, %rdx
	movl	0(%r13,%rax,4), %r8d
	jne	.L184
	movslq	%esi, %rax
	cmpl	%ebp, %edi
	movl	%esi, %r14d
	movl	%r8d, 0(%r13,%rax,4)
	movl	%ecx, 0(%r13,%rax,4)
	jl	.L83
.L74:
	leal	1(%r14), %edi
	cmpl	%edi, %ebx
	jle	.L65
	movslq	%edi, %r11
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L183:
	movslq	%esi, %rax
	movl	%r8d, 0(%r13,%rax,4)
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L173:
	movslq	%edx, %rax
	cmpl	%edx, %esi
	movl	%r8d, 0(%r13,%rax,4)
	jle	.L185
	leal	1(%rdx), %eax
	notl	%edx
	leal	(%rdx,%rsi), %r9d
	cltq
	addq	%rax, %r9
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L187:
	addq	$1, %rax
	cmpl	%r8d, %ecx
	jle	.L186
.L62:
	cmpq	%rax, %r9
	movslq	%eax, %rdx
	movl	0(%r13,%rax,4), %r8d
	jne	.L187
	movslq	%esi, %rax
	cmpl	%ebx, %edi
	movl	%esi, %r12d
	movl	%r8d, 0(%r13,%rax,4)
	movl	%ecx, 0(%r13,%rax,4)
	jl	.L84
.L65:
	leal	1(%r12), %edi
	cmpl	%edi, 12(%rsp)
	jle	.L157
	movslq	%edi, %r11
	jmp	.L85
.L186:
	movslq	%esi, %rax
	movl	%r8d, 0(%r13,%rax,4)
	jmp	.L57
.L171:
	movslq	%edx, %rax
	cmpl	%edx, %r8d
	movl	%ecx, 0(%r13,%rax,4)
	jle	.L188
	leal	1(%rdx), %eax
	notl	%edx
	leal	(%rdx,%r8), %r9d
	cltq
	addq	%rax, %r9
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L190:
	addq	$1, %rax
	cmpl	%ecx, %esi
	jle	.L189
.L53:
	cmpq	%r9, %rax
	movslq	%eax, %rdx
	movl	0(%r13,%rax,4), %ecx
	jne	.L190
	movl	%ebp, 12(%rsp)
	cmpl	%edi, 12(%rsp)
	movslq	%r8d, %rax
	movl	%ecx, 0(%r13,%rax,4)
	movl	%r8d, %r9d
	movl	%esi, 0(%r13,%rax,4)
	jg	.L191
.L56:
	leal	1(%r9), %edi
	cmpl	24(%rsp), %edi
	jge	.L47
	movslq	%edi, %r11
	jmp	.L86
.L189:
	movslq	%r8d, %rax
	movl	%ecx, 0(%r13,%rax,4)
	jmp	.L48
.L169:
	movslq	%ecx, %rax
	cmpl	%ecx, %r9d
	movl	%esi, 0(%r13,%rax,4)
	jle	.L192
	leal	1(%rcx), %eax
	notl	%ecx
	leal	(%rcx,%r9), %r10d
	cltq
	addq	%rax, %r10
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L194:
	addq	$1, %rax
	cmpl	%esi, %r8d
	jle	.L193
.L44:
	cmpq	%r10, %rax
	movslq	%eax, %rcx
	movl	0(%r13,%rax,4), %esi
	jne	.L194
	movl	%edx, 24(%rsp)
	cmpl	24(%rsp), %edi
	movslq	%r9d, %rax
	movl	%esi, 0(%r13,%rax,4)
	movl	%r9d, 48(%rsp)
	movl	%r8d, 0(%r13,%rax,4)
	jl	.L86
.L47:
	movl	48(%rsp), %edi
	addl	$1, %edi
	cmpl	28(%rsp), %edi
	jge	.L38
	movslq	%edi, %r11
	jmp	.L87
.L193:
	movslq	%r9d, %rax
	movl	%esi, 0(%r13,%rax,4)
	jmp	.L39
.L157:
	movl	60(%rsp), %r9d
	jmp	.L56
.L167:
	movslq	%ecx, %rax
	cmpl	%ecx, %r8d
	movl	%esi, 0(%r13,%rax,4)
	jle	.L195
	leal	1(%rcx), %eax
	notl	%ecx
	leal	(%rcx,%r8), %r9d
	cltq
	addq	%rax, %r9
	jmp	.L35
.L197:
	addq	$1, %rax
	cmpl	%esi, %edi
	jle	.L196
.L35:
	cmpq	%rax, %r9
	movslq	%eax, %rcx
	movl	0(%r13,%rax,4), %esi
	jne	.L197
	movl	%edx, 28(%rsp)
	cmpl	%r12d, 28(%rsp)
	movslq	%r8d, %rax
	movl	%esi, 0(%r13,%rax,4)
	movl	%r8d, 52(%rsp)
	movl	%edi, 0(%r13,%rax,4)
	jg	.L198
.L38:
	movl	52(%rsp), %r12d
	addl	$1, %r12d
	cmpl	32(%rsp), %r12d
	jge	.L29
	movslq	%r12d, %r11
	jmp	.L88
.L196:
	movslq	%r8d, %rax
	movl	%esi, 0(%r13,%rax,4)
	jmp	.L30
.L165:
	movslq	%edx, %rdi
	cmpl	%edx, %esi
	movl	%eax, 0(%r13,%rdi,4)
	jle	.L199
	leal	1(%rdx), %eax
	notl	%edx
	leal	(%rdx,%rsi), %r9d
	cltq
	addq	%rax, %r9
	jmp	.L26
.L201:
	addq	$1, %rax
	cmpl	%edi, %r8d
	jle	.L200
.L26:
	cmpq	%rax, %r9
	movslq	%eax, %rdx
	movl	0(%r13,%rax,4), %edi
	jne	.L201
	movl	%ecx, 32(%rsp)
	cmpl	32(%rsp), %r12d
	movslq	%esi, %rax
	movq	%rax, %rcx
	movl	%edi, 0(%r13,%rax,4)
	movl	%esi, 44(%rsp)
	movl	%r8d, 0(%r13,%rcx,4)
	jl	.L88
.L29:
	movl	44(%rsp), %r12d
	addl	$1, %r12d
	cmpl	%r12d, 16(%rsp)
	jle	.L20
	movslq	%r12d, %r11
	jmp	.L89
.L200:
	movslq	%esi, %rax
	movl	%edi, 0(%r13,%rax,4)
	jmp	.L21
.L13:
	movslq	%esi, %rdx
	movl	0(%r13,%rdx,4), %ecx
	movl	%edx, 40(%rsp)
	movl	%ecx, 0(%r13,%rax,4)
	movl	%r8d, %eax
	subl	$2, %eax
	movl	%eax, 16(%rsp)
.L95:
	movslq	40(%rsp), %rdx
	movl	%ecx, 0(%r13,%rdx,4)
	jmp	.L97
.L162:
	movslq	%r8d, %rdx
	movl	%ecx, 0(%r13,%rdx,4)
	jmp	.L3
.L161:
	movl	%r8d, 36(%rsp)
	jmp	.L92
.L164:
	movl	%r8d, 40(%rsp)
	jmp	.L95
.L192:
	movslq	%r9d, %rax
	movl	%edx, 24(%rsp)
	movl	%eax, 48(%rsp)
	jmp	.L104
.L185:
	movslq	%esi, %rax
	movq	%rax, %r12
	jmp	.L110
.L188:
	movslq	%r8d, %rax
	movl	%ebp, 12(%rsp)
	movq	%rax, %r9
	jmp	.L107
.L182:
	movslq	%esi, %rax
	movq	%rax, %r14
	jmp	.L113
.L199:
	movl	%ecx, 32(%rsp)
	movslq	%esi, %rcx
	movl	%ecx, 44(%rsp)
	jmp	.L98
.L195:
	movslq	%r8d, %rax
	movl	%edx, 28(%rsp)
	movl	%eax, 52(%rsp)
	jmp	.L101
.L179:
	movslq	%r8d, %rax
	movq	%rax, %r15
	jmp	.L116
.L20:
	movl	40(%rsp), %r12d
	addl	$1, %r12d
	cmpl	20(%rsp), %r12d
	jge	.L11
	movslq	%r12d, %r11
	jmp	.L90
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
	je	.L215
	leaq	4(%rsp), %rdx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jle	.L205
	leaq	a(%rip), %rbp
	leaq	.LC3(%rip), %r13
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L206:
	movq	%rbp, %rdx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%r12, %rdi
	addl	$1, %ebx
	addq	$4, %rbp
	call	__isoc99_fscanf@PLT
	cmpl	%ebx, 4(%rsp)
	jg	.L206
.L205:
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
.L207:
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$4, %rbx
	call	__printf_chk@PLT
	cmpq	%r13, %rbx
	jne	.L207
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
.L208:
	movl	0(%rbp), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$4, %rbp
	call	__printf_chk@PLT
	cmpq	%rbx, %rbp
	jne	.L208
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
.L202:
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L216
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
.L215:
	.cfi_restore_state
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L202
.L216:
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
