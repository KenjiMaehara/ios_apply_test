#include "all_includes.h"

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



char charget(void);
void charput(char);
void PutStr(char *);

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

void charput_sci1(char OutputChar)
{
	while ((CONSOLE_P_SCI1.SSR.BIT.TDRE) == 0);
		CONSOLE_P_SCI1.TDR = OutputChar;

	CONSOLE_P_SCI1.SSR.BIT.TDRE = 0;
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
