; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  start   ; reset vector
  
; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT start
	  
start
;=========================
N EQU 5
	MOV R1,#1 ; gan R1 = 1(kq luu r1)
	LDR R2,=N ; luu R2 = N = 5
	MOV R3,#1; gan R3 = 1
	
;5X4X3X2X1
giaithua
	CMP R3,R2
	BHI thoat; nhay neu r3 lon hon r2
	MUL R1,R3 ;r1 = r1 * r3
	ADD R3,#1 ; tang r3 len 1
	B giaithua; lap lai 
thoat
	

stop B stop
	END