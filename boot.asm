BITS 16
org 0x7C00

main:
	xor ax, ax
	mov ds, ax
	
	mov [drive], dl

	mov si, hello
	call print
	
	mov ah, 0x3
	int 0x10
	
	mov ah, 0x2
	mov dl, 0
	int 0x10
	
	mov ax, 0x2403
	int 0x15
	
	; loading stage 2 from disk

	mov ah, 0x2
	mov al, [sectors]
	mov ch, 0x0
	mov cl, 0x2
	mov dh, 0x0
	mov dl, [drive]
	mov bx, 0x9000
	int 0x13

	jc disk_error
	
	cmp ah, 0x0
	jne disk_error
	
	cmp al, [sectors]
	jne disk_error
	
	cli
	lgdt [gdt_desc]
	
	mov eax, cr0
	or al, 1
	mov cr0, eax

	jmp CODE:pm
	
disk_error:
	mov si, disk_error_msg
	call print
	jmp $

drive db 0

%include "real/print.asm"

sectors db 1
hello db "Hello World!", 0xA, 0
disk_error_msg db "Error reading from disk", 0xA, 0

%include "real/gdt.asm"

BITS 32

pm:
	mov ax, DATA
	mov ds, ax
	mov ss, ax

	mov byte [0x0B8000], 'P'
	mov byte [0x0B8001], 0x1B
	jmp 0x9000

BITS 16

times 510-($-$$) db 0

dw 0xAA55

BITS 32

mov byte [0x0B8000], '2'
mov byte [0x0B8001], 0x1B
jmp $