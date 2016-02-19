#include <stdio.h>

int foo0( int a , int b ) {

    int x = a;
    int y = b;

    for (int i = 0; i < 5; i++) {
        __atomic_compare_exchange_n(&x, &x, y, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
    }
    return x;
}

int foo1( int a , int b ) {
    int x = a ;
    int y = b;

    int z = 10;

    if(foo0(12,2)) {
        z = 0;
    }
    else {
        while (z) {
            z = z - 1;
            if (z == 5)
                break;
        }
    }

    if(1)
        while (z)
            z = z + 1;

    return foo0(x,z);
}

int main(){
    int z = 0;
    double a,b,c,d,e,f,g=0;
    for(int i=0; i<5; i++){
        a = 1;
        if (g) {
            a = 0;
        }

        if (a) {
            g = 1;
        }

        for(int j=0; j<5; j++){
            while ( a<10 ) {
                a ++;
            }
            for(int k=0; k<5; k++){
                 __atomic_compare_exchange_n(&z, &z, z, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
                for(int l=0; l<5; l++){
                    for(int m=0; m<5; m++){
                        for(int n=0; n<5; n++){
                            for(int o=0; o<5; o++){
                                for(int p=0; p<5; p++){
                                    for(int q=0; q<5; q++){
                                        z++;
                                        z = foo1( z , 10);
                                        for(int r=0; r<5; r++){
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return 0;
}
