	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

chuoi DCD 3,3,1,4,5

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE
Tong DCD 0
Nguyen DCD 0
Du DCD 0
	AREA mycode, CODE ,READONLY
	EXPORT start
	ENTRY
start
;===================================
SoHang EQU 5
	MOV R0,#0 ;tong
	LDR R1,=chuoi
	MOV R2,#0
	LDR R3,[R1,R2]
	LDR R4,=SoHang
	
loop
	CMP R4,#0 ;KIEM TRA R4 = 0 hay k
	BEQ chia ;bang thi xuong phep chia
	LDR R3,[R1,R2] 	;R3 = (Dia chi R1 + R2) = 3
	ADD R0,R3 ;R0 =R0+R3
	ADD R2,#4 ;TANG R2 = R2 + 4 => cho den gia tri tiep theo cua chuoi
	SUB R4,#1 ;xoa so thu thu nhat di
	B loop
chia
	LDR R5,=Tong
	STR R0,[R5]
	
	
	MOV R2,#0
	LDR R4,=SoHang
Tiep	
	SUB R0,R4 ;R0 = R0 - R4
	ADD R2,#1 ;R2 = R2 + 1
	CMP R0,R4	; KIEM TRA R0 VA R4
	BGE Tiep ;R0 >= R4 TIEP TUC TRU
	BLT ketthuc ;R0 < R4 TIEP TUC TRU
ketthuc
	LDR R6,=Nguyen
	STR R2,[R6]
	LDR R7,=Du
	STR R0,[R7]
	SWI &11

	END