exec:
	nasm -fmacho pp.asm -o pp.o
	ld -e _main pp.o -o ppx

exec64:
	nasm -fmacho64 pp64.asm -o pp64.o
	ld -e _main pp64.o -o pp64x
