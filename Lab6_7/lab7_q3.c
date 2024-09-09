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
	LPC_GPIO0->FIODIR=0XFF<<4; //SETTING P0.4 to P0.11 IN OUTPUT MODE
	i=0;
	while(1)
	{
	x=LPC_GPIO2->FIOPIN;
	x=x>>12&1; //to get only the value of the 12th pin on which switch is connected 
		if(x==0) //switch is pressed so ring counter
		{
			LPC_GPIO0->FIOPIN=1<<(i+4);
			for(j=0;j<1000000;j++); //delay
			i++;
		}
		else //switch is not pressed so ring counter in reverse direction
		{
			LPC_GPIO0->FIOPIN=1<<(i+4); //shifting in reverse 
			for(j=0;j<1000000;j++); //delay
			i--;
		
		}
		if(i>7)
			i=0;
		if(i<0)
			i=7;
	}
		

}