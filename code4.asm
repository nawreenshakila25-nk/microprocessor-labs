.model small
.stack 100h
.data
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,3
    mov ax,2    ;ax=multiplicend
    mul dx   ;mul=multiplier(dx)
    
    mov dx,ax
    add dx,48
    
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    