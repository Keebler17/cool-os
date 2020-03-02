BITS 16

stage2:

cli
lgdt [gdt_desc]

mov eax, cr0
or eax, 0x1
mov cr0, eax

jmp CODE:pm

pm:

BITS 32

pm:
	mov ax, DATA
	mov ds, ax
	mov ss, ax

	mov byte [0x0B8000], 't'

	mov ebx, 0x0B8000
	mov eax, test_str

	call print32


	jmp KERNEL_OFFSET

test_str db "p", 0x07, "r", 0x07, "i", 0x07, "n", 0x07, "t", 0x07, 0
vram_ptr dd 0x0B8000

%include "boot/prot/print.asm"

times 512-($-stage2) db 0
