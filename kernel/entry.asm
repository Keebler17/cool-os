bits 32

extern kmain

call kmain
jmp $ ; hopefully never executed
times 20 db 0xFF
