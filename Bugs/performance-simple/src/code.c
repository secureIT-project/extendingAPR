#include <unistd.h>
#include <stdio.h>

int main(){
    int n = __VERIFIER_nondet_int();

    int s = 0;
    for ( int i=0; i < n; i++ ){
        s += i;
        usleep(n * 0.01);
    }

    printf("%d", s);
    return 0;
}
