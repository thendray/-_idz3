	.file	"part1_a.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomX			#объявленеи getRandomX
	.type	getRandomX, @function		#getRandomX - функция 
getRandomX:
	endbr64
	push	rbp				#пролог
	mov	rbp, rsp
	sub	rsp, 16				#выделение памяти на стеке
	mov	edi, 0				#edi := 0
	call	time@PLT			#вызов time
	mov	edi, eax			#edi := eax
	call	srand@PLT			#вызов srand
	call	rand@PLT			#вызов rand
	pxor	xmm0, xmm0			#xmm0 & xmm0 логическое исключающее побитове или для 64 разрдных величин
	cvtsi2sd	xmm0, eax		#преобразование eax в вещественное xmm0
	movsd	xmm1, QWORD PTR .LC0[rip]	#xmm1 := &.LC0
	divsd	xmm0, xmm1			#xmm0 /= xmm1
	movsd	QWORD PTR -8[rbp], xmm0		#-8[rpb] := xmm0
	movsd	xmm1, QWORD PTR -8[rbp]		#xmm1 := -8[ptr]
	movsd	xmm0, QWORD PTR .LC1[rip]	#xmm0 := $.LC1
	mulsd	xmm0, xmm1			#xmm0 *= xmm1
	movsd	xmm1, QWORD PTR .LC2[rip]	#xmm1 := &.LC2
	subsd	xmm0, xmm1			#xmm0 -= xmm1
	movsd	QWORD PTR -8[rbp], xmm0		#-8[rbp] := xmm0
	movsd	xmm0, QWORD PTR -8[rbp]		#xmm0 := -8[rbp]
	movq	rax, xmm0			#rax := xmm0
	movq	xmm0, rax			#xmm0 := rax
	leave					#эпилог
	ret
	.size	getRandomX, .-getRandomX
	.section	.rodata
.LC3:						#строка вывода double
	.string	"%lf"
.LC4:						#строка для чтения файла
	.string	"r"
.LC5:						#строка подсказка вывода
	.string	"Input is incorrect"
.LC12:						#строка для записи в файл
	.string	"w"
	.align 8
.LC13:						#строка подсказка вывода для времени работы программы
	.string	"Program working time: %lld ns\n"
.LC14:						#строка подсказка вывода результата программы
	.string	"Program result: %.20lf\n"
.LC16:						#строка подсказка вывода точности полученного результата
	.string	"Precision: %.20lf %%"
.LC17:						
	.string	"Precision: %.20lf %%\n"
	.text
	.globl	main
	.type	main, @function
main:						#точка входа - основная функция 
	endbr64
	push	rbp				#пролог
	mov	rbp, rsp
	sub	rsp, 144			#выделение памяти на стеке
	mov	DWORD PTR -116[rbp], edi	#-116[rbp] := edi
	mov	QWORD PTR -128[rbp], rsi	#-128[rbp] := rsi
	mov	DWORD PTR -20[rbp], 1000	#-20[rbp] := 1000
	cmp	DWORD PTR -116[rbp], 2		#compare -116[rbp] && 2
	jne	.L4
	mov	rax, QWORD PTR -128[rbp]	#-128[rbp] := rax
	add	rax, 8				#rax += 8
	mov	rax, QWORD PTR [rax]		#rax := [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 99
	jne	.L4
	lea	rax, -72[rbp]			#rax := &-72[rbp]
	mov	rsi, rax			#rsi := rax (2ой передаваемый аргумент)
	lea	rax, .LC3[rip]			#rax := &.LC3
	mov	rdi, rax			#rdi := rax (1ый передаваемый аргумент)
	mov	eax, 0
	call	__isoc99_scanf@PLT		#вызов функции scanf
	jmp	.L5
.L4:						#1ый else if
	cmp	DWORD PTR -116[rbp], 2		#compare -116[rbp] && 2
	jne	.L6	
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8				#rax += 8
	mov	rax, QWORD PTR [rax]		#rax := [rax]
	movzx	eax, BYTE PTR [rax]		#eax := [rax]
	cmp	al, 114			
	jne	.L6
	mov	eax, 0
	call	getRandomX			#вызов функции getRandomX
	movq	rax, xmm0			#rax := xmm0 (запись возвращаемого значения)
	mov	QWORD PTR -72[rbp], rax		#-72[rbp] := rax
	jmp	.L5
.L6:						#2ой else if
	cmp	DWORD PTR -116[rbp], 4		#-116[rbp] := 4
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]	#rax := -128[rbp]
	add	rax, 8				#rax += 8
	mov	rax, QWORD PTR [rax]		#rax := [rax]
	movzx	eax, BYTE PTR [rax]		#eax := [rax]
	cmp	al, 102
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]	#rax := -128[rbp]
	add	rax, 16				#rax += 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC4[rip]			#rdx := &.LC4
	mov	rsi, rdx			#rsi := rdx (2ой аргумент)
	mov	rdi, rax			#rdi := rax (1ый аргумент)
	call	fopen@PLT			#вызов функции fopen
	mov	QWORD PTR -32[rbp], rax		#-32[rbp] := rax (запись результата)
	lea	rdx, -72[rbp]			#rdx := -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx			#rsi := rcx
	mov	rdi, rax			#rdi := rax
	mov	eax, 0				#eax := 0
	call	__isoc99_fscanf@PLT		#вызов scanf
	jmp	.L5
.L7:						#else
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0				#eax := 0
	call	printf@PLT			#вызов printf
	mov	eax, 0
	jmp	.L8
.L5:						#код после блока if else if else
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0		#-8[rbp] := xmm0
	movsd	xmm0, QWORD PTR -72[rbp]
	movq	xmm1, QWORD PTR .LC7[rip]	#xmm1 := &.LC7
	xorpd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	call	exp@PLT				#вызов exponent
	movq	rax, xmm0
	mov	QWORD PTR -40[rbp], rax		#-40[rbp] := rax
	lea	rax, -96[rbp]			#rax := -96[rbp]
	mov	rsi, rax
	mov	edi, 1				#edi := 1
	call	clock_gettime@PLT		#вызов clock_gettime
	mov	DWORD PTR -12[rbp], 0
	jmp	.L9
.L15:
	pxor	xmm0, xmm0			#xmm0 & xmm0 логическое исключающее побитове или для 64 разрдных величин
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -16[rbp], 0		#-16[rbp] := 0
	jmp	.L10
.L14:						#тело 2ого for
	pxor	xmm0, xmm0  			#xmm0 & xmm0 логическое исключающее побитове или для 64 разрдных величин
	cvtsi2sd	xmm0, DWORD PTR -16[rbp]	#преобразование -16[rbp] в вещественное xmm0
	mov	rax, QWORD PTR .LC8[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT				#вызов функции pow
	movsd	QWORD PTR -136[rbp], xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -16[rbp]
	mov	rax, QWORD PTR -72[rbp]		#rax := -72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT				#вызов функции pow
	movapd	xmm3, xmm0
	mulsd	xmm3, QWORD PTR -136[rbp]	#xmm3 := -136[rbp]
	movsd	QWORD PTR -136[rbp], xmm3
	mov	eax, DWORD PTR -16[rbp]		#eax := -16[rbp]
	mov	edi, eax			#edi := eax
	call	factorial@PLT			#вызов функции факториал
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -136[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0	#-64[rbp] := xmm0
	movsd	xmm0, QWORD PTR -64[rbp]	#xmm0 := -64[rbp]
	movq	xmm1, QWORD PTR .LC9[rip]
	andpd	xmm0, xmm1
	pxor	xmm1, xmm1			#xmm1 & xmm1 логическое исключающее побитове или для 64 разрдных величин
	comisd	xmm0, xmm1
	jbe	.L11
	movsd	xmm0, QWORD PTR -8[rbp]		#xmm0 := -8[rbp]
	movapd	xmm1, xmm0			
	addsd	xmm1, QWORD PTR -64[rbp]	#xmm1 += -64[rbp]
	movsd	xmm0, QWORD PTR .LC10[rip]	#xmm0 := &.LC10
	comisd	xmm0, xmm1
	jb	.L11
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -64[rbp]	#xmm0 += -64[rbp]
	movsd	QWORD PTR -8[rbp], xmm0		#-8[rbp] := xmm0
	add	DWORD PTR -16[rbp], 1		#-16[rbp] := 1
.L10:						#условие 2ого for
	cmp	DWORD PTR -16[rbp], 999
	jle	.L14
.L11:						#1ый for 
	add	DWORD PTR -12[rbp], 1		#-12[rbp] += 1 (увеличение счетчика)
.L9:						#после for
	mov	eax, DWORD PTR -12[rbp]		# -12[rbp] := eax
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L15
	lea	rax, -112[rbp]
	mov	rsi, rax			#rsi := rax
	mov	edi, 1				#edi := 1
	call	clock_gettime@PLT		#вызов clock_gettime
	mov	rax, QWORD PTR -104[rbp]
	pxor	xmm1, xmm1			#xmm1 & xmm1 логическое исключающее побитове или для 64 разрдных величин
	cvtsi2sd	xmm1, rax
	mov	rax, QWORD PTR -112[rbp]	#rax := -112[rbp]
	pxor	xmm2, xmm2			#xmm2 & xmm2 побитове или для 64 разрдных величин
	cvtsi2sd	xmm2, rax		#преобразование rax в вещественное xmm2
	movsd	xmm0, QWORD PTR .LC11[rip]
	mulsd	xmm0, xmm2			#xmm0 *= xmm2
	addsd	xmm0, xmm1			#xmm0 += xmm1
	mov	rax, QWORD PTR -96[rbp]
	pxor	xmm2, xmm2			#xmm2 & xmm2 логическое исключающее побитове или для 64 разрдных величин
	cvtsi2sd	xmm2, rax		#преобразование rax в вещественное xmm2
	movsd	xmm1, QWORD PTR .LC11[rip]
	mulsd	xmm1, xmm2			#xmm1 *= xmm2
	subsd	xmm0, xmm1			#xmm0 += xmm1
	mov	rax, QWORD PTR -88[rbp]
	pxor	xmm1, xmm1			#xmm1 & xmm1 логическое исключающее побитове или для 64 разрдных величин
	cvtsi2sd	xmm1, rax		преобразование rax в вещественное xmm1
	subsd	xmm0, xmm1			#xmm0 - xmm1
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -48[rbp], rax
	cmp	DWORD PTR -116[rbp], 4
	jne	.L16
	mov	rax, QWORD PTR -128[rbp]	#rax := -128[rbp]
	add	rax, 24				# rax += 24
	mov	rax, QWORD PTR [rax]		#rax := [rax]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx			#rsi := rdx
	mov	rdi, rax			#rdi := rax
	call	fopen@PLT			#вызов fopen
	mov	QWORD PTR -56[rbp], rax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC13[rip]
	mov	rsi, rcx			#rsi := rcx
	mov	rdi, rax			#rdi := rax
	mov	eax, 0
	call	fprintf@PLT			#вызов fprintf
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -56[rbp]		#rax := -56[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC14[rip]			# rdx := .LC14 (3ий передаваемый аргумент)
	mov	rsi, rdx			# rsi := rdx (2ой передаваемый аргумент)
	mov	rdi, rax			# rdi := rax (1ый передаваемый аргумент)
	mov	eax, 1				# eax := 1
	call	fprintf@PLT			# вызов fprintf
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
	movq	xmm1, QWORD PTR .LC9[rip]
	andpd	xmm0, xmm1
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC15[rip]
	mulsd	xmm1, xmm0
	movq	rdx, xmm1
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC16[rip]			# rdx := .LC16 (3ий передаваемый аргумент)
	mov	rsi, rdx			# rsi := rdx (2ой передаваемый аргумент)
	mov	rdi, rax			# rdi := rax (1ый передаваемый аргумент)
	mov	eax, 1				# eax := 1
	call	fprintf@PLT			# вызов fprintf
	jmp	.L17
.L16:						#последний else
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	lea	rax, .LC14[rip]			# rax := .LC14
	mov	rdi, rax			#rdi := rax  (1ый передаваемый аргумент)
	mov	eax, 1				#eax := 1
	call	printf@PLT			# вызов printf
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
	movq	xmm1, QWORD PTR .LC9[rip]
	andpd	xmm0, xmm1
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC15[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1			#rax := xmm1
	movq	xmm0, rax			#xmm0 := rax
	lea	rax, .LC17[rip]			# rax := .LC17
	mov	rdi, rax			# rdi := rax  (1ый передаваемый аргумент)
	mov	eax, 1				# eax := 1
	call	printf@PLT			# вызов printf
.L17:
	mov	eax, 0
.L8:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-4194304
	.long	1105199103
	.align 8
.LC1:
	.long	0
	.long	1080000512
	.align 8
.LC2:
	.long	0
	.long	1079738368
	.align 16
.LC7:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC8:
	.long	0
	.long	-1074790400
	.align 16
.LC9:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC10:
	.long	-1
	.long	2146435071
	.align 8
.LC11:
	.long	0
	.long	1104006501
	.align 8
.LC15:
	.long	0
	.long	1079574528
