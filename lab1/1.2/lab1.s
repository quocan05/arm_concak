; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  start  ; reset vector
  
; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT start

start
;======================
N EQU 10;
	MOV R0,#0 ;TONG CHAN R0 = 0
	MOV R1,#0 ;TONG LE R1 = 0
	LDR R2, =N ; R2 = 10
	MOV R3,#1  ; R3 = 1
	MOV R4,#2	; R4 = 2
	
loopsole
	CMP R3,R2 ;so sanh R3 voi R2
	BGT ketthuctongle ; Ket thuc tong le
	ADD R1,R3 ; R1 = R1 +R3
	ADD R3,#2 ; R3 = R3 + 2
	B loopsole
ketthuctongle
loopsochan
	CMP R4,R2 ;so sanh R4 voi R2
	BGT ketthuctongchan ; Ket thuc tong le
	ADD R0,R4 ; R1 = R1 +R4
	ADD R4,#2 ; R4 = R4 + 2
	B loopsochan
ketthuctongchan
stop B stop

;======================
	END