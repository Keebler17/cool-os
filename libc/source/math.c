#include "../include/math.h"

int power(int base, int exponent) {
  int result = 1;
  for(int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

int intlen(int n, int base) {
  int len = 1;

  loop:
    if(n / base > 0) {
      n /= base;
      len++;
      goto loop;
    }

    return len;
}

int firstDigit(int n, int base) {
  int loops = intlen(n, base)-1;
  for(int i = 0; i < loops; i++) {
    n /= base;
  }
  return n;
}

int truncate(int n, int digits, int base) {
  return n % power(base, digits);
}
