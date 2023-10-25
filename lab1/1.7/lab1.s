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
;ta lay X - Y cho den khi X < Y thì doi chô den khi nào X-Y = 0 thì Y là uoc chung lon nhat
X EQU 24
Y EQU 36
   	
	LDR R1,=X
	LDR R2,=Y
	
	
	CMP R1,#0
	BLE thoat
	CMP R2,#0
	BLE thoat
looptru	
	CMP R1,R2 ;kiem tra
	BLT hoandoi
	
tieptuc
	SUB R1,R2 
	CMP R1,#0
	BEQ ketqua
	B looptru
	
hoandoi
	MOV R4,R2
	MOV R2,R1
	MOV R1,R4
	B tieptuc
ketqua
	MOV R3,R2;R3 se la cho luu KQ cua R2 cuoi cung
	SWI &11
	
thoat
	MOV R3,#0
	SWI &11

;-------------------------------------------------------------------------
          END	;Ket thuc chuong trinhf
;-------------------------------------------------------------------------
