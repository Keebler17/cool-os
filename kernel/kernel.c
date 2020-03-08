#include "include/io/print.h"

int kmain() {
	volatile unsigned char *vram = (volatile unsigned char*)0x0B8000;
	char *cool = "this is very epic\0";

	

	cprintch(vram, 'a');

	return 0;
}
