int matroska_deliver_packet(int q ) 
{ 


  {
  if (q == 1) {
    return (0);
  } else {
    return (1);
  }
}
}
int flag  =    0;
extern int ( /* missing proto */  __VERIFIER_nondet_int)() ;
int res_return(void) 
{ 
  int tmp ;
  int tmp___0 ;

  {
  __repair_app_4__0: /* CIL Label */ 
  {
  tmp___0 = flag;
  tmp = __VERIFIER_nondet_int();
  }
  flag ++;
  if (tmp___0 < 100) {
    tmp = __VERIFIER_nondet_int();
    return (tmp);
  } else {

  }
  return (-1);
}
}
int main(void) 
{ 
  int matroska ;
  int tmp ;
  int res ;
  int id ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  int tmp___3 ;

  {
  tmp = __VERIFIER_nondet_int();
  matroska = tmp;
  res = 0;
  while (1) {
    tmp___3 = matroska_deliver_packet(matroska);
    if (tmp___3) {

    } else {
      break;
    }
    while (res == 0) {
      tmp___0 = __VERIFIER_nondet_int();
      id = tmp___0;
      switch (id) {
      case 1: 
      tmp___1 = res_return();
      res = tmp___1 < 0;
      if (res) {
        break;
      } else {

      }
      tmp___2 = res_return();
      res = tmp___2 == 0;
      if (res) {
        res = 1;
      } else {

      }
      break;
      case 2: 
      default: 
      res = res_return();
      break;
      }
    }
    if (res == -1) {
      matroska = 1;
    } else {

    }
  }
  return (0);
}
}
