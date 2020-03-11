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
  return n + 0x30;
}

char *itoa(int n) {
  int len = intlen(n);
  char *ret = "2147483647\0";
  int ptr = 0;
  for(int i = len; i > 0; i--) {

    ret[ptr] = citoa(firstDigit(truncate(n, i)));
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
