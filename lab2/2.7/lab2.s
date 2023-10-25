	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
matran 	DCD 3,4,5,6
		DCD 6,5,4,3
		DCD 3,4,5,6
		DCD 6,5,4,3
	
	AREA RESET, DATA, READWRITE
TongChan DCD 0
TongLe DCD 0
	
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
;============================
soPhantu EQU 16
	LDR R0,=matran
	LDR R1,=soPhantu
	MOV R2,#0	;tong chan
	MOV R3,#0	;tong le
	
loop
	CMP R1,#0 
	BEQ thoat
	SUB R1,#1  
	LDR R4,[R0],#4 
	CMP R4,#0 
	BEQ loop
	B KiemTra
	
	
; KIEM TRA
KiemTra
	MOV R5,#2 
	
add1	
	CMP R5,R4	
	ADD R5,#2
	BLT add1 
	BGT le	
	BEQ Chan	
; KIEM TRA
		
Chan
	ADD R2,R4 
	B loop
le
	ADD R3,R4 
	B loop
thoat
	LDR R7,=TongChan
	STR R2,[R7]
	LDR R8,=TongLe
	STR R3,[R8]
	SWI &11