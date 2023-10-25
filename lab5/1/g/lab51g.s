	AREA Convert, CODE, READONLY

; Hàm chuy?n d?i t? chu?i nh? phân sang s? nguyên h? 10
ConvertBinaryToDecimal
    MOV R1, #0        ; R1 luu tr? giá tr? h? 10
    MOV R2, #1        ; R2 luu tr? giá tr? co s? (2^0 = 1)
    MOV R3, #0        ; R3 luu tr? v? trí trong chu?i
Loop
    LDRB R0, [R4, R3] ; Load ký t? t? chu?i nh? phân vào R0
    CBZ R0, Done       ; N?u ký t? là null terminator, k?t thúc vòng l?p
    CMP R0, #'1'       ; So sánh ký t? v?i '1'
    BEQ Multiply       ; N?u b?ng '1', nh?y d?n Multiply
    B NextChar         ; N?u không, nh?y d?n NextChar
Multiply
    MUL R0, R2, R1     ; Nhân giá tr? hi?n t?i c?a R1 v?i co s?
    ADD R1, R0, R2     ; C?ng giá tr? nhân du?c vào R1
NextChar
    ADD R3, R3, #1     ; Di chuy?n d?n ký t? ti?p theo trong chu?i
    B Loop             ; L?p l?i vòng l?p
Done
    ; K?t qu? là giá tr? h? 10, luu trong R1

    ; (Chú ý: R4 ph?i tr? d?n d?a ch? c?a chu?i nh? phân c?n chuy?n d?i)

    BX LR              ; Tr? v? t? hàm con

END
