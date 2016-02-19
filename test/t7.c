
#include <stdio.h>

int addaaaa(int a, int b)
{
    while(1)
    {
	    if(a < b)
		    return a;
	    else
	    {
		    for(int i = a; i < b; i++)
		    {
			    __atomic_fetch_add(&a, i, __ATOMIC_RELAXED);
		    }
    	}
        if(a > b) 
            break;
    }
}


int main()
{
	printf("sfhsadjfh %d \n", addaaaa(5, 20));
	int temp;
    for(int i = 1; i < 100; i++){
        for(int j = 100; j > 0; j--){
            temp = temp + i - j;
            if(temp > i * j){
                temp--;
            }
            else
                for(int k = 1000; k > 0; k = k - temp)
                    __atomic_fetch_add(&temp, 1, __ATOMIC_RELAXED);
        }
    }

    return 0;
}
