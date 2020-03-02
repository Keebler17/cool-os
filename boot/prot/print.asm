print32: ; ebx = address, eax = string, ecx not perserved
	.loop:
		mov ecx, [eax]
		cmp cl, 0
		je .end
		mov byte [ebx], cl
		inc ebx
		inc eax

		jmp .loop
	.end:
	ret
