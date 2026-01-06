.model small
.stack 100h
.data
    space db ' ', '$'        ; Space for printing
    newline db 10, 13, '$'   ; Newline for printing

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 0               ; First Fibonacci number (a)
    mov bx, 1               ; Second Fibonacci number (b)
    mov cx, 5               ; Count for loop

fib_loop:
    push ax                 ; Save AX since print_num will modify it
    call print_num          ; Print number in AX

    mov ah, 09h             ; Print space
    lea dx, space
    int 21h

    ; Compute next Fibonacci number
    pop ax                  ; Restore AX
    mov dx, ax              ; DX = a
    add dx, bx              ; DX = a + b
    mov ax, bx              ; a = b
    mov bx, dx              ; b = new_b

    dec cx
    jnz fib_loop

    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp


;---------------------------------------------------
; print_num: Prints number in AX as decimal string
; Uses SI to store digits, CX as digit counter
; Modifies AX, CX, DX, SI
;---------------------------------------------------
print_num proc
    push bx
    push cx
    push dx
    push si

    mov cx, 0               ; Digit count
    mov si, 10              ; Divisor for division loop

    cmp ax, 0
    jne print_loop
    ; Special case for zero
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp print_done

print_loop:
    mov bx, 10              ; Divisor 10

convert_loop:
    xor dx, dx              ; Clear DX before div
    div bx                  ; AX / 10, quotient in AX, remainder in DX
    push dx                 ; Push remainder on stack as digit
    inc cx                  ; Count digits

    cmp ax, 0
    jne convert_loop

    ; Now pop digits and print
print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits

print_done:
    pop si
    pop dx
    pop cx
    pop bx
    ret
print_num endp

end main