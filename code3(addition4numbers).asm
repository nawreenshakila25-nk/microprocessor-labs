.model small
.stack 100h
.data
.code

main proc
    mov ax, @data
    mov ds, ax

    ; Add 4 numbers
    mov al, 2
    add al, 3
    add al, 4
    add al, 1        ; AL = 10

    ; Divide by 10 to get digits
    mov ah, 0
    mov bl, 10
    div bl            ; AL = quotient (tens), AH = remainder (ones)

    ; -----------------------------
    ; Print tens digit
    ; -----------------------------
    push ax            ; save AX (optional, safe)
    mov dl, al         ; tens
    add dl, 48         ; convert to ASCII
    mov ah, 2
    int 21h
    pop ax             ; restore AX (optional)

    ; -----------------------------
    ; Print ones digit
    ; -----------------------------
    mov dl, ah         ; ones
    add dl, 48         ; convert to ASCII
    mov ah, 2
    int 21h

    ; Terminate program
    mov ah, 4Ch
    int 21h

main endp
end main
