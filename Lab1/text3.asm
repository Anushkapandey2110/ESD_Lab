	AREA RESET , DATA, READONLY;the code should be saved in RAM
	EXPORT __Vectors
__Vectors
	DCD 0X10001000 ;stack pointer value when stack is empty 
	DCD Reset_Handler ;reset vector
	ALIGN
	AREA mycode,CODE,READONLY 
	ENTRY
	EXPORT Reset_Handler
Reset_Handler ;till here info given to the compiler 
	MOV R0 , #0X10;transfer to (R0 register) , # (addressing mode) ,MOV when 8 bit data;0X--- is hexadecimal data  
	MOV R1 , #2_1010;4 byte instruction  , binary(2_)
	MOV R3 , #-2
	MOV R4 , #3_1010;base 3
	MOV R5 , #0XFFFF
	LDR R6 , =0xFFFFFF
STOP
	B STOP
NUM EQU 10
SRC DCD 8 , 0X123456 , 34567891
	END