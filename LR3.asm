.model small
.stack 100h

.data
msg_input   db "Enter Value: $"
msg_even    db 13,10,"Number is Even$"
msg_odd     db 13,10,"Number is Odd$"
msg_zero    db 13,10,"All is Well$"
new_line    db 13,10,"$"
mul_sign    db " x $"
eq_sign     db " = $"

num_main    db ?
max_limit   db ?
temp_val    db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg_input
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov num_main, al

    cmp al, 0
    jne check_type
    lea dx, msg_zero
    mov ah, 9
    int 21h
    jmp end_prog

check_type:
    test al, 1
    jnz odd_case

    lea dx, msg_even
    mov ah, 9
    int 21h
    mov max_limit, 10
    jmp start_table

odd_case:
    lea dx, msg_odd
    mov ah, 9
    int 21h
    mov max_limit, 5

start_table:
    mov bl, 1

table_loop:
    lea dx, new_line
    mov ah, 9
    int 21h

    mov dl, num_main
    add dl, '0'
    mov ah, 2
    int 21h

    lea dx, mul_sign
    mov ah, 9
    int 21h

    cmp bl, 10
    je show_ten
    mov dl, bl
    add dl, '0'
    mov ah, 2
    int 21h
    jmp show_equal

show_ten:
    mov dl, '1'
    mov ah, 2
    int 21h
    mov dl, '0'
    int 21h

show_equal:
    lea dx, eq_sign
    mov ah, 9
    int 21h

    mov al, num_main
    mul bl

    aam
    add ax, 3030h
    mov dx, ax
    push dx

    cmp dh, '0'
    je skip_zero
    mov dl, dh
    mov ah, 2
    int 21h

skip_zero:
    pop dx
    mov dl, dl
    mov ah, 2
    int 21h

    inc bl
    cmp bl, max_limit
    jbe table_loop

end_prog:
    mov ah, 4Ch
    int 21h

main endp
end main







