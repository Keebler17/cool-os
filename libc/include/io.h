#ifndef IO
#define IO

#include "io/print.h"

int strlen(char *str);

char citoa(int n);
char *itoa(int n);

void cprint(volatile unsigned char *vram, char *ch);

#endif
