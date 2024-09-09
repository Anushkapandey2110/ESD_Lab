#include<LPC17xx.h>
int main()
{
	int x;
	int i,j;
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL4=0; //GPIO MODE for pin2
	LPC_PINCON->PINSEL0=0;//GPIO MODE 
	//SWITCH IS CONNECTED TO P2.12
	LPC_GPIO2->FIODIR=0; //INPUT MODE FOR SWITCH
	LPC_GPIO0->FIODIR=1<<4; //SETTING P0.4 IN OUTPUT MODE
	while(1)
	{
	x=LPC_GPIO2->FIOPIN;
	x=x&1<<12; //to get only the value of the 12th pin on which switch is connected 
		if(x==0) //switch is pressed so up counter
		{
			i++;
			if(i==256)
				i=0;
		}
		else //switch is not pressed so down counter
		{
			i--;
			if(i==0)
				i=255;
		
		}
			LPC_GPIO0->FIOPIN=i<<4;
		for(j=0;j<1000000;j++);
	}
		

}