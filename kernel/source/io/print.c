#include "print.h"

void printch(volatile unsigned char *vram, char ch) {
	*vram = ch;
}
