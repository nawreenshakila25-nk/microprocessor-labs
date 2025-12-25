.model small
.stack 100h
.data ;DS declare
micro DB "Welcome to Micro Lab", 13,10, "Work hard,Keep shine$" ,13,10, "$"  ;final instruction to stop printing cz if i don't give the last dollar sign character the last 13,10 will not be in use
.code ;CS declare

main proc ;procedure
    mov ax , @data ;DS activate
    mov ds,ax  ;DS activate 
       
    LEA dx, micro ;Load Effective Address -> msg store(load)
    mov ah,9h ;string/msg print
    int 21h ;interrupt=pause   
    
    
    mov ah,4ch ;instruction terminate
    int 21h ;instruction terminate
    main endp ;end of procedure
end main ;program terminate