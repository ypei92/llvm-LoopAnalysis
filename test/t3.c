#include <stdio.h>

int fib(int n)
{
     if(n==0)
         return n;
     return fib(n-1) + fib(n-2);
}

int main()
{
     int a = 5;
     return fib(a);
}
