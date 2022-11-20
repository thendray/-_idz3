	.file	"part2_a.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64
	movsd	xmm0, QWORD PTR .LC0[rip]
	cmp	edi, 1
	jbe	.L5
	push	rbx
	mov	ebx, edi
	lea	edi, -1[rdi]
	call	factorial
	movaps	xmm1, xmm0
	cvtsi2sd	xmm0, ebx
	pop	rbx
	mulsd	xmm0, xmm1
	ret
.L5:
	ret
	.size	factorial, .-factorial
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
