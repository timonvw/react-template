#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
   setuid(0);
   system("/bin/sh");
   return 0;
}