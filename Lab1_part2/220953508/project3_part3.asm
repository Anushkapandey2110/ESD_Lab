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
	MOV R3, #5
BACK LDR R2, [R0],#4
	STR R2, [R1],#4
	SUB R3,#1
	CMP R3, #0
	BNE BACK ;branch when not equal , BEQ: branch when it is equal 
	STR R2, [R1]
STOP
	B STOP 
N DCD 0X12345678, 0x6A, 0X234,0X49C,0XA13BC
	AREA mydata, DATA, READWRITE
DST DCD 0,0,0,0,0
	END