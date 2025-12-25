.model small
.stack 100h
.data
input1 db "Enter dividend: $"
input2 db 13,10, "Enter divisor: $"
output1 db 13,10, "Your Quoteint: $"
output2 db 13,10, "Your Remainder: $"
error db 13,10, "Undefined!! $"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,input1
    mov ah,9  ;1st iput msg print
    int 21h 
    
    mov ah,1  ;1st char input
    int 21h
    sub al,48 ;demotion to decimal by subtracting 48 from al=by default input holder
    mov bl,al ;bl=al=dividend
    
    lea dx,input2
    mov ah,9  ;2nd char input
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov bh,al ;bh=al=divisor(bl already in use)
    
    lea dx,output1
    mov ah,9  ;3rd output msg print
    int 21h
    
    cmp bh,0  ;bh=divisor=0 then jump to called segment
    je divisor_zero ;(work as if)je=jump if equal(division_zero=segment.we can;t use space in our segment name)
    
    mov al,bl ;al=bl=dividend=accumulator register
    xor ah,ah ;ah=remainder,xor=memory clear
    div bh  ;div=bh=divisor
    mov ch, ah     ; save the remainder BEFORE AH is overwritten

    
    add al,48 ;al=quotient,ascii convert
    mov dl,al ;dl=al=output register
    
    mov ah,2
    int 21h 
    
    lea dx, output2
    mov ah, 9
    int 21h
    
    mov dl, ch    ; remainder is in AH
    add dl, 48    ; convert to ASCII
    mov ah, 2
    int 21h
    
    jmp exit  ;goes to exit segment cx if not give this it will find divison_zero.not ah,4ch that's why for ending it we used exit segment 
    
 divisor_zero:  ;segment build
 
    lea dx,error ;error msg load
    mov ah,9     ;error msg show
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main


