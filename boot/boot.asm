BITS 16
org 0x7C00

KERNEL_OFFSET equ 0x8000

main:
	xor ax, ax
	mov ds, ax

	mov [drive], dl

	mov si, hello
	call print

	; loading stage 2 real from disk

	mov ah, 0x2
	mov al, [sectors]
	mov ch, 0x0
	mov cl, 0x2
	mov dh, 0x0
	mov dl, [drive]
	mov bx, 0x07E00
	int 0x13


	jc disk_error

	cmp ah, 0x0
	jne disk_error

	;cmp al, [sectors]
	;jne disk_error

	jmp 0x7E00

disk_error:
	mov si, disk_error_msg
	call print
	jmp $

drive db 0
sectors db 2

%include "boot/real/print.asm"

hello db "Hello World!", 0xA, 0
disk_error_msg db "Error reading from disk", 0xA, 0

%include "boot/gdt.asm"

times 510-($-$$) db 0
dw 0xAA55

%include "boot/prot/stage2.asm"
