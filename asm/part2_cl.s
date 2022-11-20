	.file	"part2_a.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	cmp	DWORD PTR -4[rbp], 1
	je	.L2
	cmp	DWORD PTR -4[rbp], 0
	jne	.L3
.L2:
	movsd	xmm0, QWORD PTR .LC0[rip]
	jmp	.L4
.L3:
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -4[rbp]
	movsd	QWORD PTR -16[rbp], xmm1
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	mov	edi, eax
	call	factorial
	mulsd	xmm0, QWORD PTR -16[rbp]
.L4:
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	factorial, .-factorial
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
