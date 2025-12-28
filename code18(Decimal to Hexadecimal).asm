.model small   ;1ta code segment and 1ta data segment thakbe=64kb
.stack 100h
.data  

input db "Input decimal: $"
output db 13,10, "Output hexadecimal:$"
;buffer db 6 dup(?) 
.code

main proc   
    mov ax,@data ;input output variable rakhar jnno
    mov ds,ax  
    
    lea dx,input
    mov ah,9  ;eta address
    int 21h
    
    mov si,0   ;segment er age likhle global condition
    read_digit:  ;digit input
    mov ah,1
    int 21h
    cmp al,13;13=enter (means digit equal to 13or enter)
    je convert_hexadecimal
    
    sub al,48  ;jehetu ascii te input tai decimal e convert krlm
    mov bl,al
    mov ax,si
    cmp ax,0
    jne add_digit  ;ax=0 na hole 2nd digit input dite(add_digit)segment e jbo 
    mov ax,bx ;bl=digit thake ex:bl=5 inout dile ax=5 hbe
    mov si,ax  ;ax e save krate si(why ax cz 2nd number nite 16bit lagbe)
    jmp read_digit;enter click krar ag obdhi digit nibe tai
    
    add_digit:;number create
    mov ax,si;cz gun er kaj si krte parbena dekhe mov krlm
    mov cx,10
    mul cx;cx multiplier and ax multiplicand
    add ax,bx ;(noted)
    mov si,ax
    jmp read_digit;enter press kra obdhi digit nibe tai
    
    convert_hexadecimal:
    mov ax,si;octal mane jehetu 16 diye vag tai ax e mov krlm
    mov bx,16
    mov cx,0
    
    divide_hexadecimal:
    xor dx,dx ;memory clear krlm remainder er jnno jate garbage value na thake
    div bx  ;divisor 16
    push dx
    inc cx 
    cmp ax,0
    jne divide_hexadecimal
    
    lea dx,output
    mov ah,9
    int 21h  
    
    print_hexadecimal:
    pop dx 
    cmp dl,9
    jbe print_num ;jump if below or equal
    add dl,7
    
    print_num:
    add dl,'0'
    mov ah,2
    int 21h
    loop print_hexadecimal
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main