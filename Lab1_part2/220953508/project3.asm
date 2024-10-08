	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000 ;Stack pointer value when stack is empty
	DCD Reset_Handler ;Reset vectors
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =N
	LDR R1, =DST
	LDR R2, [R0]
	STR R2, [R1];
	ADD R0, #4;will increment the pointer value by 4 (next address)
	ADD R1, #4
	LDR R2, [R0]
	STR R2, [R1]
	
	;LDR R2, [R0]
	;STR R2, [R1]
STOP
	B STOP 
N DCD 0X12345678, 0x6A
	AREA mydata, DATA, READWRITE
DST DCD 0,0
	END
	