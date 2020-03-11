BITS 16

stage2:

cli
lgdt [gdt_desc]

mov eax, cr0
or eax, 0x1
mov cr0, eax

jmp CODE:pm

BITS 32

pm:
	mov ax, DATA
	mov ds, ax
	mov ss, ax

	call enable_a20

	call check_a20

	cmp al, 0

	je $

	jmp KERNEL_OFFSET

%include "boot/prot/print.asm" ; lower level print function
%include "boot/prot/a20.asm"

times 512-($-stage2) db 0
