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
N EQU 5
	
	MOV R1,#0 ;gan gia tri R1 =0
	LDR R2, =N ; R2 = N = 5
	
Tinhtong
	ADD R1,R2 ;R1 = R1 + R2 = 5
	SUBS R2, #1 ; R2 = R2 -1 = 4
	CMP R2, #0 ;so sanh
	BGT Tinhtong
stop
	B stop
	END ;KET THUC
;-------------------------------------------------------------------------
          END	;Ket thuc chuong trinhf
;-------------------------------------------------------------------------
