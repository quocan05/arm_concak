

	AREA RESET,DATA,READONLY
		DCD 0X20001000
		DCD start

N DCD 20		
	AREA MYCODE, CODE,READONLY
	ENTRY
	
start
;=====================

	MOV R0,#0
	LDR R1,N
	PUSH{R0,R1}
	BL CT1
stop B stop
CT1 PROC
	POP{R0,R1}
	MOV R2,#5
chiahet	
	CMP R2,R1
	BHI thoat
	ADD R0,R2 ;R0 =R0 + R2 = 5
	ADD R2,#5
	B chiahet
thoat
	BX LR
	ENDP
	END