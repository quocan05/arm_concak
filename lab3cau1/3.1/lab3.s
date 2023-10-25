	
	AREA RESET, DATA,READONLY
		DCD 0x20001000
		DCD start

N DCD 5
		
	AREA mycode,CODE,READONLY
	ENTRY
	
	
start
;======================
	MOV R0,#0 ;TONG R0 = 0
	MOV R1, #1;
	LDR R2, N ; R2 = 5
	BL tong
stop B stop	
tong PROC	
loop
	CMP R1,R2 ;so sanh R3 voi R2
	BGT ketthuc ; Ket thuc tong
	ADD R0,R1 ; R0 = R0 +R1
	ADD R1,#1 ; R3 = R1 + 1
	B loop
ketthuc
	BX LR
	ENDP

;======================
	END