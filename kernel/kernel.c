#include "../libc/include/io.h"
#include "../libc/include/math.h"

int kmain() { // IF YOU ARE GETTING AN ERROR ON A FUNCTION AND IT MAKES NO SENSE TRY INCREASING SECTORS IN boot/boot.asm
	volatile unsigned char *vram = (volatile unsigned char*)0x0B8000;

	char *ascii = itoa(0xFFFFFFF, 10);

	cprint(vram, "                    m9oj876uy435t2rxcfvbin7o0o6i8uyet5rf");


	while(1) {

	//write_byte(0x0, 0x9);
	char byte = read_byte(0x60);

	__asm__("mov %%cl, %%dl" : : "d" (byte));
	__asm__("jmp #$");
	char *read = itoa(0xFF, 16);
	cprint(vram, read);

	}
	return 0;
}
