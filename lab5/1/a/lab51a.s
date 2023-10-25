;Chuyen co so 16 sang 2 bang cach chuyen tung ky tu sang 4 so co so 2
	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
DV DCB "1AF" ;Du lieu dau vao 0x1AF
SPT DCD 3
	AREA KETQUA, DATA, READWRITE
DR DCB 0
	AREA MYCODE, CODE, READONLY
	EXPORT Reset_Handler
;=====================================
;Doc cac ky tu
CHUYEN_CHU_SANG_CS16 PROC
	POP {R7}
	CMP R7, #0x46 ;Chu F
	BGT THOAT ; Khong hop le
	CMP R7, #0x41 ;Chu A
	SUBGE R7, #0x37 ;Chu A tuong duong voi so 10
	AND R7, #0x0F ; Dam bao rang so tu 0-Fa
	PUSH {R7}
	BX LR
	ENDP
;=====================================
;Viet ky tu ra cac o nho bang cach dich phai
;Sau day lay bit vua dich ra luu vao sau cung
;Sau day dich con tro ra truoc 
DOC_BIT PROC
	LSRS R4, #1 ; Dich phai so luu trong thanh ghi R4
	MOVCC R5, #0 ; neu bit dich ra la 0
	MOVCS R5, #1 ; neu bit dich ra la 1
	STRB R5, [R2], #-1; luu bit day vao va dich R2 ra truoc
	BX LR
	ENDP
;=====================================
	ENTRY
Reset_Handler
	LDR R0, =DV
	LDR R1, SPT
	LDR R2, =DR
	MOV R3, #1
LOOP
	CMP R3, R1
	BGT THOAT 
	LDRB R4, [R0], #1
	PUSH {R4}
	BL CHUYEN_CHU_SANG_CS16
	POP {R4}
	ADD R2, #3; Tien them 3 bit de viet nguoc lai
	BL DOC_BIT
	BL DOC_BIT
	BL DOC_BIT
	BL DOC_BIT; vi 1 ky tu o 16 -> 4 ky tu cs 2
	ADD R3, #1;
	ADD R2, #5 ;nhay den o trong tiep theo
	B LOOP
THOAT
	SWI &11
	END