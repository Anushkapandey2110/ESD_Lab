	AREA RESET,DATA,READONLY 
	EXPORT __Vectors
__Vectors
	DCD 0x10001000 ;stack pointer value when stack is empty 
	DCD Reset_Handler; Reset vector 
	ALIGN
	AREA mycode, CODE, READONLY 
	ENTRY 
	EXPORT Reset_Handler
Reset_Handler\

	LDR R0, =N ;copies address of N to R0
	LDR R5, =total ;R5 will now store the address of total in the data memeory
	MOV R1,#10;COUNTER
	;R2 WILL STORE SUM AND R3 WILL STORE CARRY 
BACK LDR R4,[R0],#4
	ADDS R2,R4 ;R2=R2+R4
	ADC R3,#0 ;TO STORE THE CARRY 
	SUBS R1,#1
	BNE BACK 
	STR R2,[R5],#4
	STR R3,[R5]
STOP B STOP
N DCD 0x7, 0x1234, 0x3433, 0x123, 0x90, 0x4559, 0x16457, 0x4,0x111,0x74699 ;numbers stored in code memory
	AREA mydata, DATA, READWRITE
total DCD 0,0
	END 

	