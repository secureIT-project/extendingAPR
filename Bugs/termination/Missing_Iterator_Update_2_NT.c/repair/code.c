int flag  =    0;
extern int ( /* missing proto */  __VERIFIER_nondet_int)() ;
int mdb_cursor_get(void) 
{ 
  int i ;
  int tmp ;

  {
  tmp = __VERIFIER_nondet_int();
  i = tmp;
  flag ++;
  __repair_swap1_4__0: /* CIL Label */ 
  return (1);
  if (i >= 0) {
    return (0);
  } else
  __repair_swap2_9__1: /* CIL Label */ 
  if (flag > 1000) {
    return (1);
  } else {

  }
}
}
int main(void) 
{ 
  int rc ;
  int dval_mv_size ;
  int tmp ;

  {
  rc = mdb_cursor_get();
  tmp = __VERIFIER_nondet_int();
  dval_mv_size = tmp;
  while (rc == 0) {
    if (dval_mv_size <= 0) {
      continue;
    } else {

    }
    rc = mdb_cursor_get();
  }
  return (0);
}
}
