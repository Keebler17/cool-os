print:
	mov ah, 0xE
	
	.loop:
		lodsb
		cmp al, 0x0
		je .end
		
		int 0x10
		
		jmp .loop

	.end:
		ret