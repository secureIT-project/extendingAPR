extern int ( /* missing proto */  __VERIFIER_nondet_int)() ;
extern int ( /* missing proto */  usleep)() ;
extern int ( /* missing proto */  printf)() ;
int main(void) 
{ 
  int n ;
  int tmp ;
  int s ;
  int i ;

  {
  tmp = __VERIFIER_nondet_int();
  n = tmp;
  s = 0;
  i = 0;
  while (i < n) {
    s += i;
    __repair_del_10__0: /* CIL Label */ ;
    i ++;
  }
  printf("%d", s);
  return (0);
}
}
