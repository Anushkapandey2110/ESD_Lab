	 AREA RESET,DATA,READONLY 
	 EXPORT __Vectors
__Vectors
	DCD 0X10001000 ;stack pointer value when stack is empty
	DCD Reset_Handler;Reset Vectors
	ALIGN
	AREA mycode, CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =N1 ;to store the address of first 128 bit number
	LDR R1, =N2 ;to store the address of second 128 bit number
	; R2 will store the sum (r7+r8)
	;R5 will be the counter 
	;R6 will point to the difference in data memory
	;R7 will store the values of N1
	;R8 will store the values of N2 
	MOV R5,#4
	LDR R6, =diff
	CMP R2,#0 ;to ensure that carry is one before entering loop
BACK LDR R7,[R0],#4;STORING N1
	LDR R8,[R1],#4;STORING N2
	SBCS R2,R7,R8 ; R2=R7-R8-(1-C)
	STR R2,[R6],#4 ; IT WILL STORE THE DIFFERENCE OF  32 BIT NUMBERS TO THE DATA MEMORY
	SUB R5,#1 ;	NOT SUBS SINCE IT WILL UPDATE THE CARRY FLAG AND WE NEED THAT CARRY IN THE NEXT ITERATION
	TEQ R5,#0 
	BNE BACK
STOP B STOP
N1 DCD 0X1234,0X37485968,0X12,0X17365908
N2 DCD 0X12438,0XAB564,0X17389,0X12343567
	AREA mydata, DATA, READWRITE 
diff DCD 0,0,0,0,0
	END