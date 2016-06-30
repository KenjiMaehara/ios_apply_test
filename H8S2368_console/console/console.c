#include "all_includes.h"
//#include <stdarg.h>


/** ************************************************************************* ** 
 ** defines
 ** ************************************************************************* **/
#define ORER_FER_PER 0x38 /* Error bits of SCI */

/** ************************************************************************* ** 
 ** globals
 ** ************************************************************************* **/

/** ************************************************************************* ** 
 ** locals
 ** ************************************************************************* **/

#include <stdarg.h>

char charget(void);
void charput(char);
void PutStr(char *);


void charput_sci1(char OutputChar);
void outs_sci1(char *, short);
void outc_sci1(char, short);
void outn_sci1(char, unsigned long, short);
void mprint_test_sci1(char *fmt, ...);

#define C_MAX 12    /* ロングデータを8進数で表示するときの最大けた数 */




#ifdef CONSOLE_DEBUG
char charget(void)
{
	char InputChar;
	while (CONSOLE_P.SSR.BIT.RDRF == 0)
	{
		/* ignore errors */
		if ((CONSOLE_P.SSR.BYTE & ORER_FER_PER) != 0x00)
			CONSOLE_P.SSR.BYTE &= ~ORER_FER_PER;
	}
	
	InputChar = CONSOLE_P.RDR;
	CONSOLE_P.SSR.BIT.RDRF = 0;
	charput(InputChar);
	return (InputChar);
}

void charput(char OutputChar)
{
	while ((CONSOLE_P.SSR.BIT.TDRE) == 0);
		CONSOLE_P.TDR = OutputChar;

	CONSOLE_P.SSR.BIT.TDRE = 0;
}

void charput_sci0(char OutputChar)
{
	while ((CONSOLE_P_SCI0.SSR.BIT.TDRE) == 0);
		CONSOLE_P_SCI0.TDR = OutputChar;

	CONSOLE_P_SCI0.SSR.BIT.TDRE = 0;
}


void PutStr(char *str)
{
	while (*str != '\0')
		charput(*str++);
}

#else



char charget(void)
{
}

void charput(char OutputChar)
{
}

void PutStr(char *str)
{
}

#endif



 
/*------------------------------------------------------------------------------
 +　書式付きターミナル出力
 +----------------------------------------------------------------------------*/


void mprint_test_sci0(char *fmt, ...)
{
    va_list args;
    char *p;
    unsigned long v;
    short c;
 


    va_start(args, fmt);
    for (p = fmt; *p != '\0'; p++) 
    {
        if (*p == '%') {
            p++;
            if ((*p >= '1') && (*p <= '9')) {
                c = *p++ - '0';
                while ((*p >= '0') && (*p <= '9')) c = c * 10 + (*p++ - '0');
            }
            else
                c = -1;
 
            v = (unsigned long)va_arg(args, long);
 
            switch (*p) {
            case 's':
                outs_sci0((char*)v, c);
                break;
            case 'c':
                outc_sci0((char)v, c);
                break;
            case 'd': case 'o': case 'x':
                outn_sci0(*p, v, c);
            }
            if (*p == '\0') goto fin;
        }
        else if (*p == '\n') 
        {
        //#ifdef H8TINY_USB
            //charput_sci1('\r');
        //#endif
            charput_sci0('\n');
        }
        else
            charput_sci0(*p);
    }
fin:
    va_end(args);
}


/*------------------------------------------------------------------------------
 +　文字列を出力する
 +----------------------------------------------------------------------------*/
static void outs_sci0(char *s, short c)
{
    char *p;
    for (p = s; *p != '\0'; p++)
    {
        if (c-- == 0) return;
        //output(*p);
        charput_sci0(*p);
    }
    while (c-- > 0) charput_sci0(' ');
}
 
/*------------------------------------------------------------------------------
 +　文字を出力する
 +----------------------------------------------------------------------------*/
static void outc_sci0(char ch, short c)
{
    charput_sci0(ch);
    while (--c > 0) charput_sci0(' ');
}
 
/*------------------------------------------------------------------------------
 +　整数を出力する
 +----------------------------------------------------------------------------*/
static void outn_sci0(char fm, unsigned long v, short c)
{
    char s[C_MAX], *p, z;
    unsigned short b;
 
    switch (fm) {
    case 'd':
        b = 10; z = ' '; break;
    case 'o':
        b = 8; z = '0'; break;
    case 'x':
        b = 16; z = '0'; break;
    default:
        return;
    }
    p = s;
    do {
        c--;
        *p++ = "0123456789abcdef"[v % b];
        v /= b;
    } while (v != 0);
 
    for (; c > 0; c--) charput_sci0(z);
 
    while (p > s) charput_sci0(*--p);
} 







//#endif
