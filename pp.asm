global _main

section .text

_main:
	xor ecx, ecx
	db 0x41
	jecxz _32
_32:
	int 3
	nop
	xor ebx, ebx
	