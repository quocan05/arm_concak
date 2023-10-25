	AREA RESET,DATA,READONLY
		DCD 0x20001000     
		DCD start
	ALIGN
chuoi DCD 1,2,3,4,5
	AREA KQ,DATA ,READWRITE

	AREA mycode,CODE, READONLY
	EXPORT start
	ENTRY

start
;===================
pt EQU 5
	MOV R0,#0 ; luu kq cua tong
	LDR R1, =chuoi ;lay dia chi phan tu dau tien cua chuoi
	LDR R2, chuoi	; lay gia tri phan tu dau tien
	MOV R3,#1; ;gia tri run
	LDR R4, =pt; so phan tu
loop	
	CMP R3,R4
	BHI thoat
	LDR R2,[R1],#4 ; gan Gia tri cua Dia chi R1 ([R1]) cho R2 sau do do tang thang R1 + 4byte 0x20001000 0x20001004
	ADD R0,R2 ;R0 = R0 + R2
	ADD R3,#1
	B loop
thoat
	MOV R5, R0; luu tru gia tri  R0 vao dia chi R5, KQ cuoi la R5
	SWI &11

	END