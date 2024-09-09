#include<LPC17xx.h>
int main()
{
	int i;
	int j;
	SystemInit();
	SystemCoreClockUpdate();
	
	LPC_PINCON->PINSEL0=0; //GPIO MODE
	LPC_GPIO0->FIODIR=0XFF<<4;//OUTPUT MODE 0.4-0.11
	
	
	for(i=0;i<=255;i++)
	{
		LPC_GPIO0->FIOPIN=i<<4;
		for(j=0;j<=10000;j++); //delay
}
}