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
N EQU 32
	MOV R0, #0; gan kq = 0
	MOV R1, #0; gan buoc nhay = 0
	LDR R2, =N; gan gia tri N = R2
tongchiahet5
	CMP R1, R2; ss
	BGT ketthuc; R1 > R2 end
	ADD R0, R1; 
	ADD R1, #5;
	B tongchiahet5;
ketthuc
stop 
	B stop;

;-------------------------------------------------------------------------
          END	;Ket thuc chuong trinhf
;-------------------------------------------------------------------------
