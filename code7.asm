.model small
.stack 100h
.data 

number DB "Enter three numbers: $"
result DB 13,10, "Output Largest: $"
.code

main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,number  ;Load Effective Address//input load
    mov ah,9
    int 21h
    
    mov ah,1 ;input character//1 is an address not value
    int 21h
    mov bl,al ;bl 1st number//by default al e thake
    int 21h
    mov bh,al ;bh 2nd number
    int 21h
    mov cl,al ;cl 3rd number 
    
    cmp bl,bh ;bl>=bh(if condition)
    jge large1 ;jump if greater or equal 
    
    large2:  ;else condition
    
    cmp bh,cl ;bh>=cl(else er under e if condition)
    jge large3 ;jump if greater or equal
    
    lea dx,result ;output msg print
    mov ah,9
    int 21h
    
    ;else
    mov dl,cl ;cl print krte parena tai dl e load krlm=output load
    mov ah,2
    int 21h
    jmp exit
    
    ;now we will follow lifo
    
    large3:
    lea dx,result ;output msg load
    mov ah,9
    int 21h 
    
    mov dl,bh
    mov ah,2
    int 21h
    jmp exit
    
    large1:
    cmp bl,cl  ;(if)
    jge large4
    
    ;else 
    lea dx,result
    mov ah,9
    int 21h
    
    mov dl,cl
    mov ah,2
    int 21h
    jmp exit
    
    large4:
    lea dx,result
    mov ah,9
    int 21h
    
    mov dl,bl
    mov ah,2
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main
   
    




