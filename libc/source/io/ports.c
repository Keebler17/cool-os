#include "../../include/io/ports.h"

char read_byte(unsigned short port) {
  unsigned char ret;

  __asm__("in %%dx, %%al" : "=a" (ret) : "d" (port));
  return ret;
}

void write_byte(unsigned short port, unsigned char byte) {
  __asm__("out %%al, %%dx" : : "a" (byte), "d" (port));
}
