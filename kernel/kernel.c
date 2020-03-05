#include "include/io/print.h"

int kmain() {
	volatile unsigned char *vram = (volatile unsigned char*)0x0B8000;
	char *cool = "this is epic\0";
	int ptr = 0;
	for(int i = 0; i < 12; i++) {
		vram[ptr] = cool[i];
		ptr += 2;
	}

	// printch(vram, 'a');

	return 0;
}
