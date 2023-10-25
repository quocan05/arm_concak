	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
DV DCB 1, "A", "B" ;Du lieu dau vao 0x1A
SPT DCD 3
	AREA STORE, DATA, READWRITE
DR DCB 0
	AREA MYCODE, CODE, READONLY
	EXPORT Reset_Handler
;=====================================
;Doc cac ky tu
CHUYEN_KI_TU_SANG_CS16 PROC
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
	BL CHUYEN_KI_TU_SANG_CS16
	POP {R4}
	ADD R2, #1; Tien them 1 bit de viet nguoc lai
	AND R5, R4, #0x03 ; 00000011
	STRB R5, [R2], #-1;
	LSR R4, #2 ; Dich phai 2 bit
	AND R5, R4, #0x03 ; 00000011
	STRB R5, [R2], #-1;
	ADD R3, #1;
	ADD R2, #3 ;nhay den o trong tiep theo
	B LOOP
THOAT
	SWI &11
	END
