.model small
.stack 100h
.data 

lower db "Enter lower case: $"
higher db "Output higher case: $"
enterhigher db "Enter higher case: $"
outputlower db "Output lower case: $"

.code

main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,lower
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al  ;bl(base register)=al(by default input)
    mov ah,2  ;ascii char consol show
    int 21h   
    
    mov dl,13  ;dl=13(enter)=load
    int 21h    
    mov dl,10  ;dl=10(line feed)=load
    int 21h 
    
    lea dx,higher
    mov ah,9
    int 21h 
    
    sub bl,32 ;lower-upper=32(ascii)
    mov dl,bl ;dl=bl=upper load
    mov ah,2  ;dl=bl=upper print 
    int 21h
    
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
segment1:
    
    lea dx,enterhigher ;print
    mov ah,9
    int 21h  
    
    mov ah,1
    int 21h
    mov bl,al
    mov ah,2
    mov dl,bh
    int 21h
    
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,outputlower ;print
    mov ah,9
    int 21h  
    
    add bl,32
    mov dl,bl
    mov ah,2
    int 21h
    
exit:
    
    mov ah,4ch
    int 21h
    main endp
end main

