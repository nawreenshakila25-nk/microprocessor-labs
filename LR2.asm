.model small
.stack 100h

.data
msgOdd      db "Odd Load Detected",13,10,'$'
msgEven     db "Even Load Detected",13,10,'$'
msgZero     db "All Are Stars Here",13,10,'$'
msgInvalid  db "Invalid Input!",13,10,'$'

inputBuf    db 3, ?, 3 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax

    
    lea dx, inputBuf
    mov ah, 0Ah
    int 21h

    
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h

  
    mov al, [inputBuf+1]
    cmp al, 0
    je invalid

    mov al, [inputBuf+2]
    sub al, '0'
    cmp al, 0
    jb invalid
    cmp al, 9
    ja invalid
    mov bl, al         

    cmp bl, 0
    je zeroCase

    ; check odd or even
    mov al, bl
    and al, 1
    cmp al, 0
    je evenCase

oddCase:
    lea dx, msgOdd
    mov ah, 9
    int 21h

    mov cl, 1         

oddLoop:
    mov ch, cl         
printOddStars:
    mov dl, '*'
    mov ah, 2
    int 21h
    dec ch
    jnz printOddStars

  
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h

    inc cl
    cmp cl, bl
    jle oddLoop
    jmp done

evenCase:
    lea dx, msgEven
    mov ah, 9
    int 21h

    mov cl, bl         

evenLoop:
    mov ch, cl          
printEvenStars:
    mov dl, '*'
    mov ah, 2
    int 21h
    dec ch
    jnz printEvenStars

  
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h

    dec cl
    jnz evenLoop
    jmp done

zeroCase:
    lea dx, msgZero
    mov ah, 9
    int 21h
    jmp done

invalid:
    lea dx, msgInvalid
    mov ah, 9
    int 21h

done:
    mov ah, 4Ch
    int 21h

main endp
end main



