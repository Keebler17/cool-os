#include "../libc/include/io.h"
#include "../libc/include/math.h"

int kmain() {
	volatile unsigned char *vram = (volatile unsigned char*)0x0B8000;

	char *ascii = itoa(27);

	cprintch(vram, ascii[0]);
	cprintch(vram+2, ascii[1]);

	return 0;
}
