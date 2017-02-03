#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <getopt.h>
#include <sys/time.h> // gettimeofday
#include "dparse.h"

extern D_ParserTables parser_tables_gram;

uint64_t timer() {
struct timeval tv;
gettimeofday(&tv, NULL);
return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

static double timediff(struct timeval *s, struct timeval *e) {
    double t1 = (e->tv_sec - s->tv_sec) * 1000.0;
    double t2 = (e->tv_usec - s->tv_usec) / 1000.0;
    return t1 + t2; /* ms */
  }

int main(int argc, char *argv[]) {
  char s[1048576];
  FILE *fp;
  fp = fopen(argv[1],"r");
  if(fp == NULL){
    printf("null");
  }
  else{
    int k=0;
    while((s[k]=(char)fgetc(fp))!=EOF){
      k++;
    }
    s[k]=' ';
  D_Parser *p = new_D_Parser(&parser_tables_gram, 0);
  int i;
  for (i =1; i <argc; i++){
    double fastest =0.0;
    int j;
  for (int j =0; j<10; j++){
//    int result =0;
    struct timeval start, end;
    gettimeofday(&start,NULL);
    dparse(p,s,strlen(s));
    gettimeofday(&end,NULL);
//    if (result) {
//            fprintf(stderr, "[%s] Parse Error!!!\n", argv[i]);
//            break;
//          }
          double execTime = timediff(&start, &end);
          if (fastest == 0.0 || (execTime < fastest) ) {
            fastest = execTime;
        }
  fclose(fp);
  }
  fprintf(stdout, "%s OK %.4f [ms]\n", argv[i], fastest);
 }
}
}
