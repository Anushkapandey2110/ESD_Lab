#include<LPC17XX.h>
main()
{
	int i;
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON -> PINSEL0=0;
	LPC_GPIO0 ->FIODIR=1<<4;
	while(1)
	{
	LPC_GPIO0 ->FIOSET=1<<4;
		for(i=0;i<1000000;i++);
		LPC_GPIO0 ->FIOCLR =1<<4;
		for(i=0;i<1000000;i++);
		
	
}
}