	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

chuoi DCD 3,3,1,4,5

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE

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
	BEQ ketthuc ;bang thi xuong phep chia
	LDR R3,[R1,R2] 	;R3 = (Dia chi R1 + R2) = 3
	ADD R0,R3 ;R0 =R0+R3
	ADD R2,#4 ;TANG R2 = R2 + 4 => cho den gia tri tiep theo cua chuoi
	SUB R4,#1 ;xoa so thu thu nhat di
	B loop

ketthuc
	LDR R7, =SoHang;
	UDIV R6, R0, R7; R6 la tbc
	MUL R4, R6, R7; 
	SUB R7, R0, R4; R7 la so du
	SWI &11

	END