	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
matran 	DCD 1,1,1,1
		DCD 1,2,1,1
		DCD 1,3,4,1
		DCD 1,1,1,5
	
	AREA RESET, DATA, READWRITE
MAXCC DCD 0
MINCC DCD 0
	
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
;============================
hang EQU 4
	LDR R2,=matran
	LDR R3,=hang
	LDR R4,[R2],#20 
	MOV R0,R4 ;MAX
	MOV R1,R4 ;MIN
	SUB R3,#1 ;lay duoc roi thi phai tru di, giam so hang neu lay ra duoc phan tu cua duong cheo chinh
loop	
	CMP R3,#0
	BEQ denduongcheophu
	LDR R4,[R2],#20 ;12
	CMP R4,R0 
	BGT	PMAX
	CMP R4,R1
	BLT PMIN
	B tiep
PMIN
	MOV R1,R4 ;gan gia tri R0 cho R4
	B tiep
	
PMAX
	MOV R0,R4 ;gan gia tri R0 cho R4
	B tiep
tiep
	SUB R3,#1
	B loop
denduongcheophu
	
	MOV R6, R0;
	MOV R7, R1;
	LDR R2,=matran
	LDR R3,=hang
	LDR R4,[R2],#12 
	MOV R0,R4 ;MAX
	MOV R1,R4 ;MIN
	SUB R3,#1
loop1	
	CMP R3,#0
	BEQ thoat
	LDR R4,[R2],#12 ;12
	CMP R4,R0 
	BGT	PMAX1
	CMP R4,R1
	BLT PMIN1
	B tiep1
PMIN1
	MOV R1,R4 ;gan gia tri R0 cho R4
	B tiep1
	
PMAX1
	MOV R0,R4 ;gan gia tri R0 cho R4
	B tiep1
tiep1
	SUB R3,#1
	B loop1	
thoat	
	MOV R8, R0;
	MOV R9, R1;
	SWI &11
	
	END