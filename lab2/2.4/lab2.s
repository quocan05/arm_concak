	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

MATRAN 	DCD 1,2,3
		DCD 3,2,1
		DCD 1,2,3

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE
Tong DCD 0
	AREA mycode, CODE ,READONLY
	EXPORT start
	ENTRY
start
;===================================
sopt EQU 9
	LDR R1,=MATRAN ;luu dia chi ban dau vao R1
	LDR R2,=sopt ; luu so pt = 9 vao R2
	MOV R3,#0 ; thanh ghi nhay gia tri
	LDR R4,[R1,R3]
	MOV R0,#0
loop	
	CMP R2,#0
	BEQ thoat
	LDR R4,[R1,R3] ; phan tu tiep theo
	ADD R0,R4
	ADD R3,#4 ; nhay den dia chi o nho  tiep theo
	SUB R2,#1 ; giam so pt 
	B loop
	
thoat
	
	SWI &11
	END