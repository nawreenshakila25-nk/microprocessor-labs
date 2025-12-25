.model small     
.stack 100h
.data  

n dw 7  ;variable+size(dw=2byte=16bits)+value
output db "output factorial: $"
buffer db 6 dup(?)   ;variable+size+value+duplicate

.code
main proc
    mov ax,@data
    mov ds,ax  
    
    ;global declaration
    mov ax,n   ;ax=7
    mov cx,n   ;cx=7
    dec cx     ;cx=6  
    
    factorial_loop:   ;fact count
    dec n
    mul n
    dec cx
    cmp cx,0    ;break condition(cx=0)
    jne factorial_loop   
                    
    ;global declaration                
    lea si,buffer+5 ;buffer load to source index
    mov cx,0   ;digit counter(0++....)
    
    convert_loop:   ;multi-digit loading
    xor dx,dx    ;dx=remainder=initially 0
    mov bx,10    ;bx=divisor=10
    div bx       ;dividend=ax=5040/10
    add dl, '0'  ;dl=remainder=ascii convert=digit er value
    dec si       ;si is decreasing cz stack e ekta ekta load hole box fill hbe man kombe
    mov [si],dl  ;[si]=memory location=remainder push(dl)
    inc cx       ;cx=digit counter=4ta digit
    cmp ax,0     ;ax!=0
    jne convert_loop   ;continue
    
    ;global declaration
    mov ah,2 ;print globally  
    
    print_loop:
    mov dl,[si] ;si=loading buffer er si(dl=pop digit from [si]
    int 21h
    inc si  ;si=printing buffer er si  increament
    loop print_loop   ;break condition(loading er si er value null hye jaoa)
    ;otherwise continue
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main