.model small
.stack 100h
.data
.code

main proc
    mov ax,@data
    mov ds,ax

    mov ax,2
    mov bx,3
    mul bx

    mov bx,4
    mul bx          ; AX = 24

    xor ah,ah
    mov bl,10
    div bl          ; AL=2, AH=4

    mov bh,ah       ; save remainder

    mov dl,al
    add dl,48
    mov ah,2
    int 21h

    mov dl,bh
    add dl,48
    mov ah,2
    int 21h

    mov ah,4Ch
    int 21h

main endp
end main




    
    