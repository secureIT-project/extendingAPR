extern int ( /* missing proto */  __VERIFIER_nondet_int)() ;
int main(void) 
{ 
  int wc ;
  int tmp ;

  {
  __repair_app_1__0: /* CIL Label */ 
  {
  tmp = __VERIFIER_nondet_int();
  tmp = __VERIFIER_nondet_int();
  }
  wc = tmp;
  while (1) {
    wc >>= 6;
    if (wc) {

    } else {
      break;
    }
  }
  return (0);
}
}
