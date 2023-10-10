	AREA RESET, DATA,READONLY
		DCD 0x20001000
		DCD start
	ALIGN
N DCD  5	
	AREA mycode, CODE,READONLY
	EXPORT start
	ENTRY
	
start
;===============
	MOV R1,#0 ;gan gia tri R1 =0
	LDR R2,N ; R2 = N = 5
	PUSH{R1,R2}
	BL Cong
stop
	B stop
Cong PROC
	POP{R1,R2}
Tinhtong
	ADD R1,R2 ;R1 = R1 + R2 = 5
	SUBS R2, #1 ; R2 = R2 -1 = 4
	CMP R2, #0 ;so sanh
	BGT Tinhtong
	BX LR
	ENDP
;===============
	END