;Vi?t chuong trình d?m s? ph?n t? duong, âm trong ma tr?n

	AREA RESET , DATA ,READONLY
		DCD 0x20001000
		DCD start
MaTran DCD 1,-1,-1
		DCD 2,-2,2
		DCD -3,3,-3
	AREA KQ,DATA ,READWRITE
SoAm DCD 0
SoDuong DCD 0
	AREA mycode ,CODE ,READONLY
	EXPORT start
	ENTRY
start
;============================
pt EQU 9
	MOV R0,#0 ;DUONG
	MOV R1,#0 ;AM
	MOV R2,#0 ;BienNhay
	LDR R3,=MaTran ;lay dia chi
	LDR R4,[R3,R2] ;lay gia tri
	LDR R5,=pt
	PUSH{R0,R1,R2,R3,R4,R5}
	BL DEM
DEM PROC
	POP{R0,R1,R2,R3,R4,R5}
loop	
	CMP R5,#0 ; so sanH R5 vaf 0
	BEQ thoat ;Bang thi ket thuc
	LDR R4,[R3,R2] ; lay gia tri tu dia chi R3 + R2
	CMP R4,#0	; SO SANH R4 VOI 0
	BGT lasoduong ; > THI NHAY SANG SO DUONG
	BLT lasoam	; < THI NHAY SANG AM
	B tiep ; BANG 0 THI DEN B TIEP
	 
lasoduong
	ADD R0,#1 ;CONG R0 LEN 1
	B tiep
lasoam
	ADD R1,#1 ; + R1 LEN 1
	B tiep
tiep
	ADD R2,#4 ;R2 + 4 DE TRO DEN GIA TRI TIEP THEO CUA MA TRAN
	SUB R5,#1 ; phan tu xoa pt vua tinh
	B loop

thoat
	LDR R6,=SoDuong
	STR R0,[R6]
	LDR R7,=SoAm
	STR R1,[R7]
	SWI &11


;============================
	END