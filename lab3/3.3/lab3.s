;Vi?t chuong trình tính giai th?a c?a N.

	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD start	
N DCD 5
	AREA MYCODE, CODE ,READONLY
	ENTRY
	
start
;=========================
	MOV R1,#1
	LDR R2,N
	PUSH{R1,R2}
	MOV R3,#1
	BL CT1
stop B stop
;5X4X3X2X1
CT1 PROC
	POP{R1,R2}
	MOV R3,#1
giaithua
	CMP R3,R2
	BHI thoat
	MUL R1,R3
	ADD R3,#1
	B giaithua
thoat
	BX LR
	ENDP
	END