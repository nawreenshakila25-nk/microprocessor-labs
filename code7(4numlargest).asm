.model small
.stack 100h
.data 

num1 db "1st input: $"  
num2 db 10,13, "2nd input: $"
num3 db 10,13, "3rd input: $"
num4 db 10,13, "4th input: $"  
result db 10,13, "largest num: $"

.code

main proc
    mov ax,@data
    mov ds,ax 
    
    ;input 4 numbers
    lea dx,num1  ;Load Effective Address//input load
    mov ah,9
    int 21h
    
    mov ah,1 ;input character//1 is an address not value
    int 21h
    mov bl,al ;bl 1st number//by default al e thake
    
    lea dx,num2  
    mov ah,9
    int 21h
    
    mov ah,1  
    int 21h
    mov bh,al 
    
    lea dx,num3  
    mov ah,9
    int 21h
    
    mov ah,1  
    int 21h
    mov cl,al 
    
    lea dx,num4 
    mov ah,9
    int 21h
    
    mov ah,1  
    int 21h
    mov ch,al 
    
    ;compare bl and bh
    cmp bl,bh 
    jge large1
    mov bl,bh
    
    large1:
    
    ;compare cl and ch
    cmp cl,ch
    jge large2
    mov cl,ch
    
    large2:
    
    ;compare large values
    cmp bl,cl
    jge large3
    mov bl,cl
    
    large3:
    
    ;output
    lea dx,result
    mov ah,9
    int 21h
    
    mov dl,bl
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    




