.model small
.stack 100h
.data
.code

main proc
    mov ax,@data
    mov ds,ax  
    
    mov cx,4        ; number of rows
seg1:
    
    push cx         ; save outer loop counter
    mov cx,4        ; number of columns
seg2:
    mov ah,2

    mov dl,'1'      ; print 1
    int 21h
    mov dl,'2'      ; print 2
    int 21h
    mov dl,' '      ; space between values
    int 21h

    loop seg2       ; inner loop
    
    mov dl,13       ; new line
    int 21h
    mov dl,10
    int 21h
    
    pop cx
    loop seg1       ; outer loop
    
    mov ah,4ch
    int 21h
main endp
end main

    