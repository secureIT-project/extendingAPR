# 0 "code_unprocesed.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "code_unprocesed.c"
# 12 "code_unprocesed.c"
int errno;
int waitpid()
{
    int num = __VERIFIER_nondet_int();
    while( num < 0 )
    {
        if( __VERIFIER_nondet_int() && errno != 1 )
            errno = 1;
        else
            errno = 2;
        return num;
    }
    return num;
}

int main()
{

    int ret = waitpid();
again:
    if( ret == 0 )
    {
        ret = waitpid();
    }
    if( ret < 0 )
        if( errno == 1 )
        goto again;
    return 0;
}
