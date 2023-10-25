;Vi?t chuong trình tính tong cac phan tu c?a chu?i s?.
	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

chuoi DCD -3,-3,-1,-4,-5

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE
Tong DCD 0
	AREA mycode, CODE ,READONLY
	EXPORT start
	ENTRY
start
;===================================
SoHang EQU 5
	MOVS R0,#0 ;tong
	LDR R1,=chuoi
	MOVS R2,#0
	LDR R3,[R1,R2]
	LDR R4,=SoHang
	PUSH{R0,R1,R2,R3,R4}
	BL CONG
CONG PROC
	POP{R0,R1,R2,R3,R4} 
loop
	CMP R4,#0 ;KIEM TRA R4 = 0 hay k
	BEQ ketthuc ;bang thi xuong phep chia
	ADDS R2, #4
	ADDS R0,R3 ;R0 =R0+R3
	LDR R3,[R1,R2]
	SUBS R4,#1 ;xoa so thu thu nhat di
	B loop
ketthuc
	MVN R5,R0
	ADD R5,#1
	SWI &11
	ENDP
;===================================
	END