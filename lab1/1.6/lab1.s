; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
; 
X EQU 0
N EQU 0

	MOV R0, #1;
	LDR R1, =X;
	LDR R2, =N;
	CMP R1, #0; 
	BLE stop;
	CMP R2, #0;
	BLE stop;
	MOV R3, #1;
	LDR R4, =X;
tong
	CMP R3, R2;
	BGT ketthuc;
	MUL R4, R1;
	ADD R0, R4;
	ADD R3, #1;
	B tong
	
ketthuc
	
stop B stop
;-------------------------------------------------------------------------
          END	;Ket thuc chuong trinhf
;-------------------------------------------------------------------------
