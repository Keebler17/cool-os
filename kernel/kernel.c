#include "include/io/io.h"

int kmain() {
	volatile unsigned char *vram = (volatile unsigned char*)0x0B8000;
	char *cool = "this is very epic\0";

	cprintch(vram, citoa(5));
	
	return 0;
}
