#include "../include/math.h"

int pow(int base, int exponent) {
  int result = 1;
  for(int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

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

int firstDigit(int n) {
  for(int i = 0; i < intlen(n)-1; i++) {
    n /= 10;
  }
  return n;
}

int truncate(int n, int digits) {
  return n %= pow(10, digits);
}
