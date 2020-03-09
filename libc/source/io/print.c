#include "../../include/io/print.h"

void cprintch(volatile unsigned char *vram, char ch) {
	*vram = ch;
}
