/*
   ~/src/dietlibc-0.32/bin-i386/diet                            \
   gcc -I ~/src/dietlibc-0.32/ -std=c99 -static -fno-builtin    \
   pathcrop.c -o pathcrop
*/
#include <stdlib.h>
#include <unistd.h>
#include "dietstring.h"
#include <syscalls.h>

#define MAX1 3
#define MAX2 2
#define PLACEHOLDER "...."

static void __puts(const char* s, const size_t l) { write(1, s, l); }
static void puts(const char* s) { __puts(s, strlen(s)); }
static void putchar(const char c) { const char buf[1] = {c}; __puts(buf, 1); }

static void
split(const char* s,
      const size_t l,
      const char c,
      char*** res_a,
      size_t* res_l)
{
    char** a = malloc(l * sizeof(char*));
    size_t a_l = 0;

    const char* start = s;
    size_t cs_l = 0;
    for(int i=0; i<=l; ++i)
    {
        if(cs_l && (i==l || s[i] == c))
        {
            char* p = malloc(cs_l*sizeof(char) + 1);
            strncpy(p, start, cs_l);
            p[cs_l] = '\0';
            start += cs_l+1;
            cs_l = 0;
            a[a_l] = p;
            ++a_l;
        }
        else
            ++cs_l;
    }

    *res_a = a;
    *res_l = a_l;
}

int
main(int argc, char** argv)
{
    size_t bufsize = 0;
    const char* path = argv[1];
    const size_t path_len = strlen(path);
    char** parts;
    size_t parts_n;
    split(path, path_len, '/', &parts, &parts_n);

    if(parts_n <= MAX1+MAX2)
    {
        puts(path);
        putchar('\n');
        return 0;
    }

    for(int i=0; i<MAX1; ++i)
    {
        puts(parts[i]);
        putchar('/');
    }
    puts(PLACEHOLDER);
    for(int i=parts_n-MAX2; i<parts_n; ++i)
    {
        putchar('/');
        puts(parts[i]);
    }

    putchar('\n');
    return 0;
}
