#include "../include/io.h"

#include "../include/math.h"

// TODO: move IO into /include and /source to avoid #include "include/io/io.h" which looks ugly

int strlen(char *str) {
  int len = 0;
  while(str[len] != '\0') {
    len++;
  }
  return len;
}

char citoa(int n) {
  if(n < 0xA) {
    return n + 0x30;
  } else {
    return n + 0x37;
  }
}

char *itoa(int n, int base) {
  int len = intlen(n, base);
  char *ret = "1111111111111111111111111111111\0";
  int ptr = 0;
  for(int i = len; i > 0; i--) {

    ret[ptr] = citoa(firstDigit(truncate(n, i, base), base));
    ptr++;
  }
  ret[ptr] = '\0';
  return ret;
}

void cprint(volatile unsigned char *vram, char *ch) {
	for(int i = 0; i < strlen(ch); i++) {
    vram[i*2] = ch[i];
  }
}
