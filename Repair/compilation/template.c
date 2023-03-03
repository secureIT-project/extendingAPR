/*

  Template for non determined functions.

 */

/* START_TEMPLATE: pre */
#include <stdlib.h>


/* END_TEMPLATE: pre */

/* START_TEMPLATE: __VERIFIER_nondet_int() */
int _int_index = 0;
int _int_return[200];


int __VERIFIER_nondet_int() {
  int ret_val = _int_return[_int_index++];
  return ret_val;
}


/* END_TEMPLATE: __VERIFIER_nondet_int() */

/* START_TEMPLATE: post */
int main(int argc, char *argv[]) {
  for( int i = 1 ; i < argc; i++ ){
    _int_return[i-1] = atoi(argv[i]);
  }

  return loop();
}


/* END_TEMPLATE: post */
