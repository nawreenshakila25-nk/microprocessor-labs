.model small
.stack 100h
.data ;DS declare
micro DB "Welcome to Micro Lab$" ;variable+size+msg+$(end of msg) 
assembly DB 13,10, "Work hard,Keep shine$"  ;13->carraze Return(enter),10->Linefeed(end).First take new line then end it.
.code ;CS declare

main proc ;procedure
    mov ax , @data ;DS activate
    mov ds,ax  ;DS activate 
       
    LEA dx, micro ;Load Effective Address -> msg store(load)
    mov ah,9h ;string/msg print
    int 21h ;interrupt=pause   
    
    LEA dx, assembly ;Load Effective Address -> msg store(load)
    mov ah,9h ;string/msg print
    int 21h ;interrupt=pause
    
    mov ah,4ch ;instruction terminate
    int 21h ;instruction terminate
    main endp ;end of procedure
end main ;program terminate