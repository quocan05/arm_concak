
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
	MOV R3,#2
	MOV R4,R1
loop
	CMP R3,R2
	BGT ketthuc
	MUL R4,R1 ; R4 = R4 X R1
	ADD R0,R4
	ADD R3,#1
	B loop	
ketthuc
	BX LR
	ENDP
;======================
	END
	
	
; 1 + 4^2 +4^3
;36