.model small
.stack 100h
.data 

logic DB "AND Gate Output: $"
logic1 DB 13,10, "OR Gate Output: $"
logic2 DB 13,10, "X-OR Gate Output: $" 
logic3 DB 13,10, "NOT Gate Output: $"

.code

main proc
    mov ax, @data 
    mov ds, ax  
    
    lea dx, logic
    mov ah, 9
    int 21h
    
    mov bl, 1010b  ;bl=1000b
    and bl, 1000b  ;bl=1010 and 1000 =1000=8 
    
    add bl, 48  ;bl='6'
    mov dl, bl  ;dx(16). dl=bl='6'=output show
    mov ah, 2 ;dl='6' print
    int 21h ;interrupt 
    
    
    
    orgate: ;segment build 
    
    lea dx, logic1
    mov ah,9
    int 21h 
    
    mov bl, 101b ;bl=101b
    or bl, 100b  ;bl=101b or 100b=101=5
    
    add bl, '0'
    mov dl,bl
    mov ah,2
    int 21h 
    
    
    
    xorgate: ;segment build
    
    lea dx,logic2
    mov ah,9
    int 21h
    
    mov bl, 1001b ;bl=1001b
    xor bl, 1110b ;bl=1001b xor 1110b=0111=1
    
    add bl, 48
    mov dl,bl
    mov ah,2
    int 21h  
    
    
    notgate:  
    
     lea dx,logic3
    mov ah,9
    int 21h 
    
    mov bl, 110b
    not bl
    and bl, 00000111b 
    
    add bl, 48
    mov dl,bl
    mov ah,2 
    int 21h
    
    
    
    
    mov ah, 4ch
    int 21h
    
    main endp
end main         


;hw:user input niye and,or,xor er kaj