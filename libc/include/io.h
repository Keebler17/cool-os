#ifndef IO
#define IO

#include "io/print.h"
#include "io/ports.h"

int strlen(char *str);

char citoa(int n);
char *itoa(int n, int base);

void cprint(volatile unsigned char *vram, char *ch);

#endif
