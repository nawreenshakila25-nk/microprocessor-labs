.model small
.stack 100h
.data
.code

main proc
    mov ax, @data
    mov ds, ax

    mov dx, 2      ; first number
    mov ax, 3      ; second number
    add dx, ax

    mov ax, 4      ; third number
    add dx, ax     ; dx = 2 + 3 + 4 = 9

    add dl, 48     ; convert number to ASCII

    mov ah, 2
    int 21h        ; print character in DL

    mov ah, 4Ch
    int 21h
main endp
end main
