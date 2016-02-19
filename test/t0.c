#include <stdio.h>

int main() {
  int i = 0, x = 0, z;
  for(; i<10; ++i){
    if(i > 3) {
        while(1) {
            ++x;
        }
    } else {
        z = 4;
        for(;;) {
            ++z;
        }
    }
  }
  return 0;
}
