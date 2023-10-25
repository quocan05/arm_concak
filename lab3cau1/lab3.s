	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD start	
N DCD 3
	AREA MYCODE, CODE ,READONLY
	EXPORT start
	ENTRY
	
	
start
;=========================
	MOV R1,#1
	LDR R2,N
	MOV R3,#1
	BL giaithua
stop
	B stop
	
;3X2X1
giaithua PROC
tinhgiaithua
	CMP R3,R2
	BHI thoat ;higher
	MUL R1,R3
	ADD R3,#1
	B tinhgiaithua
	
thoat
	BX LR
	ENDP
	
	