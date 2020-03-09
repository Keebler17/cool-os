#include "../include/math.h"

int intlen(int n) {
  int len = 1;

  loop:
    if(n / 10 > 0) {
      n /= 10;
      len++;
      goto loop;
    }

    return len;
}

int lastDigit(int n) {
  for(int i = 0; i < intlen(n)-1; i++) {
    n /= 10;
  }
  return n;
}
