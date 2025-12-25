.model small
.stack 100h
.data
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,2
    mov ax,3
    add dx,ax
    
    add dx,48
    
    mov ah,2
    int 21h
    
    main endp
end main