#include "../libc/include/io.h"
#include "../libc/include/math.h"

int kmain() { // IF YOU ARE GETTING AN ERROR ON A FUNCTION AND IT MAKES NO SENSE TRY INCREASING SECTORS IN boot/boot.asm
	volatile unsigned char *vram = (volatile unsigned char*)0x0B8000;

	char *ascii = itoa(0xFFFFFFF, 10);

	cprint(vram, ascii);

	return 0;
}
