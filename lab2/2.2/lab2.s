	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

chuoi DCD 3,2,1,4,5

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE
max DCD 0
min DCD 0
	AREA mycode, CODE ,READONLY
	EXPORT start
	ENTRY
start
;=========================================
pt EQU 5
	LDR R2,=chuoi 	;LAY DIA CHI DAU TIEN CUA CHUOI
	LDR R3,=pt 		;R3 = 5
	MOV R4,#0 		; BIEN NHAY
	LDR R5,[R2,R4] 	;0x00000000 + 0 => R5 = 3, gia tri cua dia chi R2 + gia tri cua R4 roi luu vao R5
	MOV R0,R5 		;max
	MOV R1,R5 		;min
loop	
	CMP R3,#0
	BEQ thoat
	LDR R5,[R2,R4] ;dung de tinh cac gia tri lien tiep trong chuooi
	CMP R5,R0 ;kiem tra xem R5 Co lon hon R0 HAY K 
	BGT PMAX
	CMP R5,R1
	BLT PMIN ;kiem tra xem R5 Co NHO hon R1 HAY K 
	B tieptuc
	
PMAX
	MOV R0,R5 ; gan R5 cho R0
	B tieptuc
PMIN
	MOV R1,R5 ; gan R5 cho R1
	B tieptuc

tieptuc
	ADD R4,#4 ;Tang len 4 lan de nhay sang phan tu tiep theo
	SUB R3,#1	; khi nhay se sang phan tu tiep theo chuoi so se giam di 1
	B loop
thoat
	SWI &11

	END	