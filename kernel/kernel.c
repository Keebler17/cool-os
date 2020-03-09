#include "../libc/include/io.h"
#include "../libc/include/math.h"

int kmain() {
	volatile unsigned char *vram = (volatile unsigned char*)0x0B8000;
	char *cool = "this is very epic\0";

	cprintch(vram, citoa(lastDigit(15)));

	return 0;
}
