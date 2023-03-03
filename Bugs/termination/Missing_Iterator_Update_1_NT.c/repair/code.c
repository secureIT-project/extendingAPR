int errno  ;
extern int ( /* missing proto */  __VERIFIER_nondet_int)() ;
int waitpid(void) 
{ 
  int num ;
  int tmp ;
  int tmp___0 ;

  {
  tmp = __VERIFIER_nondet_int();
  num = tmp;
  while (1) {
    __repair_swap1_4__0: /* CIL Label */ 
    return (num);
    tmp___0 = __VERIFIER_nondet_int();
    if (tmp___0) {
      if (errno != 1) {
        errno = 1;
      } else {
        errno = 2;
      }
    } else {
      errno = 2;
    }
    __repair_swap2_13__1: /* CIL Label */ 
    if (num < 0) {

    } else {
      break;
    }
  }
  return (num);
}
}
int main(void) 
{ 
  int ret ;
  int tmp ;

  {
  tmp = waitpid();
  ret = tmp;
  again: 
  if (ret == 0) {
    ret = waitpid();
  } else {

  }
  if (ret < 0) {
    if (errno == 1) {
      goto again;
    } else {

    }
  } else {

  }
  return (0);
}
}
