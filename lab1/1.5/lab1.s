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
; vi du 2 ^ 4 
N EQU 4
X EQU 2
	MOV R2, #1; luu ket qua
	LDR R0, =X;
	LDR R1, =N;
	CMP R0, #0
	BLE ketthuc
	CMP R1, #0
	BEQ stop
phepnhan
	CMP R1, #0;
	BEQ stop;
	MUL R2, R0;
	SUB R1, #1;
	B phepnhan
ketthuc	
	MOV R2, #0;

stop 
	B stop;
;-------------------------------------------------------------------------
          END	;Ket thuc chuong trinhf
;-------------------------------------------------------------------------
