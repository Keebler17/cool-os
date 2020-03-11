 enable_a20: ; returns AL=1 if enabled, AL=0 if failure
  in al, 0x92
  or al, 0b0000010
  out 0x92, al

  call check_a20

  cmp al, 0x1
  je a20_enabled


  mov ax, 0x2401
  int 0x15

  call check_a20

  cmp al, 0x1
  je a20_enabled

  mov ebx, 0x0B8000
  mov eax, a20_fail

  a20_fail db "a20 fail F in the chat gamers", 0

  call print32

  jmp $

a20_enabled:
  ret


check_a20:
  pushad
  mov edi, 0x112345
  mov esi, 0x012345
  mov [edi], edi
  mov [esi], esi
  cmpsd
  popad

  jne .on
  mov al, 0
  ret
  .on:
  mov al, 1
  ret


kb_wait:
  in al, 0x64
  test al, 0x2
  jnz kb_wait
  ret

kb_wait2:
  in al, 0x64
  test al, 0x1
  jz kb_wait2
  ret
