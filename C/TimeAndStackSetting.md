## win
```c
#include<stdio.h>
#include<windows.h>
int main(void){
    int a[100000000];
    int b[100000000];
    SYSTEMTIME t1;
    GetSystemTime(&t1);
    printf("%u %u\n", t1.wSecond,t1.wMilliseconds);
    for (int  i = 0; i < 100000000; i++)
    {
        a[i]=i;
        b[i]=i;
    }
    SYSTEMTIME t2;
    GetSystemTime(&t2);
    printf("%u %u\n", t2.wSecond,t2.wMilliseconds);
    printf("%u\n", (t2.wSecond-t1.wSecond)*1000+t2.wMilliseconds-t1.wMilliseconds);
}
```
```c
typedef unsigned short WORD;
typedef struct _SYSTEMTIME {
    WORD wYear;
    WORD wMonth;
    WORD wDayOfWeek;
    WORD wDay;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
  } SYSTEMTIME, *PSYSTEMTIME, *LPSYSTEMTIME;
```
* win下对栈的控制在编译时
`gcc "-Wl,--stack,2000000000" -o main main.c`
## linux
```c
#include<stdio.h>
#include<sys/time.h>
int main(void){
    int a[100000000];
    int b[100000000];
    timeval t1;
    gettimeofday(&t1,NULL);
    printf("%d %d\n", t1.tv_sec,t1.tv_usec);
    for (int  i = 0; i < 100000000; i++)
    {
        a[i]=i;
        b[i]=i;
    }
    timeval t2;
    gettimeofday(&t2,NULL);
    printf("%d %d\n", t2.tv_sec,t2.tv_usec);
    printf("%dms\n", (t2.tv_sec-t1.tv_sec)*1000+(t2.tv_usec-t1.tv_usec)/1000);
}
```
```c
typedef long __time_t;
typedef long __suseconds_t;
struct timeval
  {
    __time_t tv_sec;		/* Seconds.  */
    __suseconds_t tv_usec;	/* Microseconds.  */
  };
```
* linux下程序受统一限制`ulimit -s 2000000000`
