	AREA RESET, DATA,READONLY
		DCD 0x20001000
		DCD start
	ALIGN
X DCD 4
N DCD 3
		
	AREA mycode,CODE,READONLY
	EXPORT start
	ENTRY
start
;======================
	MOV R0,#1
	LDR R1,X
	LDR R2,N
	BL CT1
stop B stop
CT1 PROC
	MOV R3,#1
loop
	CMP R3,R2
	BGT thoat
	MUL R0,R1 ;R0 = R0 X R1 = 1X5X5X5 5^3
	ADD R3,#1
	B loop
thoat	
	BX LR
	ENDP
;======================
	END
	
	
; 1 + 4^2 +4^3
;36