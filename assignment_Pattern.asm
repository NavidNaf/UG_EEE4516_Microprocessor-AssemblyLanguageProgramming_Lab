.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 10,13,'ENTER NUMBER OF ROWS: $'
MSG2 DB 10,13,'$'
NUM1 DB ?
NUM2 DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    ;
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    ;
    MOV AH,1
    INT 21H
    ;
    MOV BL,AL 
    SUB BL,30H
    ADD BL,1
    ;
    MOV CL,BL
    ;
    WHILE_:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    DEC CL
    CMP CL,0
    JE END_WHILE 
    MOV NUM1,CL
    ;
    PRINT:
    MOV AH,2
    MOV DL,'*'
    INT 21H
    DEC NUM1
    CMP NUM1,0
    JE WHILE_
    JMP PRINT
    ;
    END_WHILE:
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN