;decending(kono condition lagbena cz by default decending order e print hbe)
.model small
.stack 100h
.data
.code

main proc
    mov ax,@data
    mov ds,ax  
    
    mov cx,9
    seg1:     ;outerloop(line count)
    mov bx,cx  ;moved so that two values don't clash
    
    seg2: ;inner loop
    mov ah,2
    ;int 21h cz ekhane interrupt paoar ktha na
    mov dl, '*'  
    int 21h  ;cz output register er kaj sesh
    loop seg2  ;cz nijekei nije call kortese tai pore load krtesi
    
    mov ah,2 ;new line chokhe dekhte pari means print krate hbe that's why eta
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov cx,bx   ;moved again to cx that was stored in dx
    loop seg1    
    
    
  exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    