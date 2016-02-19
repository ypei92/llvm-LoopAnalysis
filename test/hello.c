#include <stdio.h>

int foo2( int i) {
    for ( int j = 0 ; j < 10 ; j ++) {
        i = i + 9;
    }
    return i;
}

int main() {
    printf( "hello machael!\n");
    printf( "foo is %d\n" , foo2(10));
    return 0;
}
