#include "stdio.h"
#include "stdlib.h"

int main(int argc, char **argv){
  if(argc < 3){
    printf("usage: %s <int1> <int2>\n", argv[0]);
    return 0;
  }
  int a1 = strtol(argv[1], (char **)NULL, 10);
  int a2 = strtol(argv[2], (char **)NULL, 10);
  printf("total: %d\n", a1+a2);
  return 0;
}
