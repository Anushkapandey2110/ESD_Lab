#include<LPC17XX.h>
main()
{
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0=0; //FUNCTION 0 GPIO MODE
	LPC_GPIO0 ->FIODIR = 1<<4 ; //LED IS CONNECTED TO P0.4
	LPC_GPIO0-> FIOSET = 1<<4;
}