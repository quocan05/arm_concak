	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

X DCD 10
Y DCD 3

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE
Nguyen DCD 0
Du DCD 0
	AREA mycode, CODE ,READONLY
	EXPORT start
	ENTRY
start
	LDR R1,X
	LDR R2,Y
	MOV R3,#0
Tiep	
	SUBS R1,R2 ;R1 = R1 - R2
	ADD R3,#1 ;R3 = R3 + 1
	CMP R1,R2	; KIEM TRA R1 VA R2
	BGE Tiep ;R1 >= R2 TIEP TUC TRU
	BLT ketthuc ;R0 < R4 KET THUC
ketthuc
	LDR R6,=Nguyen
	STR R3,[R6]
	LDR R7,=Du
	STR R1,[R7]
	SWI &11
	END