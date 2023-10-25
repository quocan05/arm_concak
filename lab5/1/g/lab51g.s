	AREA Convert, CODE, READONLY

; H�m chuy?n d?i t? chu?i nh? ph�n sang s? nguy�n h? 10
ConvertBinaryToDecimal
    MOV R1, #0        ; R1 luu tr? gi� tr? h? 10
    MOV R2, #1        ; R2 luu tr? gi� tr? co s? (2^0 = 1)
    MOV R3, #0        ; R3 luu tr? v? tr� trong chu?i
Loop
    LDRB R0, [R4, R3] ; Load k� t? t? chu?i nh? ph�n v�o R0
    CBZ R0, Done       ; N?u k� t? l� null terminator, k?t th�c v�ng l?p
    CMP R0, #'1'       ; So s�nh k� t? v?i '1'
    BEQ Multiply       ; N?u b?ng '1', nh?y d?n Multiply
    B NextChar         ; N?u kh�ng, nh?y d?n NextChar
Multiply
    MUL R0, R2, R1     ; Nh�n gi� tr? hi?n t?i c?a R1 v?i co s?
    ADD R1, R0, R2     ; C?ng gi� tr? nh�n du?c v�o R1
NextChar
    ADD R3, R3, #1     ; Di chuy?n d?n k� t? ti?p theo trong chu?i
    B Loop             ; L?p l?i v�ng l?p
Done
    ; K?t qu? l� gi� tr? h? 10, luu trong R1

    ; (Ch� �: R4 ph?i tr? d?n d?a ch? c?a chu?i nh? ph�n c?n chuy?n d?i)

    BX LR              ; Tr? v? t? h�m con

END
