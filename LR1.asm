.model small
.stack 100h

.data
prompt      db "Book Title: $"
fmtMsg      db 13,10,"Formatted Title: $"
vowelMsg    db 13,10,"Vowels:",13,10,"$"
consMsg     db 13,10,"Consonants:",13,10,"$"
countMsg    db 13,10,"Total Vowels = $"

buffer      db 50
            db ?
            db 50 dup(?)

vowels      db 60 dup('$')
cons        db 60 dup('$')

vcount      db 0

.code
main proc
    mov ax, @data
    mov ds, ax  
    mov vcount,0

    lea dx, prompt
    mov ah, 9
    int 21h

    lea dx, buffer
    mov ah, 0Ah
    int 21h

    xor bx, bx
    mov bl, [buffer+1]
    mov byte ptr [buffer+bx+2], '$'

    lea si, buffer+2 
    mov cl, [buffer+1]
    xor ch, ch

    lea di, vowels
    lea bx, cons


process:
    mov al, [si]
    cmp al, 'a'
    jb not_lower
    cmp al, 'z'
    ja not_lower
    sub al, 20h

not_lower:
    
    cmp al, 'A'
    jb next
    cmp al, 'Z'
    ja next
    cmp al, 'A'
    je is_vowel
    cmp al, 'E'
    je is_vowel
    cmp al, 'I'
    je is_vowel
    cmp al, 'O'
    je is_vowel
    cmp al, 'U'
    je is_vowel

  
    mov [bx], al
    inc bx
    mov byte ptr [bx], ' '
    inc bx
    jmp next

is_vowel:
    mov [di], al
    inc di
    mov byte ptr [di], ' '
    inc di
    inc vcount

next:
    inc si
    loop process


    mov byte ptr [di], '$'
    mov byte ptr [bx], '$'


    lea dx, fmtMsg
    mov ah, 9
    int 21h

    lea dx, buffer+2
    mov ah, 9
    int 21h

    lea dx, vowelMsg
    mov ah, 9
    int 21h

    lea dx, vowels
    mov ah, 9
    int 21h

    lea dx, consMsg
    mov ah, 9
    int 21h

    lea dx, cons
    mov ah, 9
    int 21h

    lea dx, countMsg
    mov ah, 9
    int 21h  

    mov dl, '1'
    mov ah, 2
    int 21h

    mov dl, '0'
    mov ah, 2
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main


