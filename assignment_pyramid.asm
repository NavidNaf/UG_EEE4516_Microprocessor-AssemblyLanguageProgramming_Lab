                .MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 10,13,'ENTER NUMBER OF ROWS: $'
MSG2 DB 10,13,'$'
NUM1 DB ?
NUM2 DB ?
NUM3 DB ?
NUM4 DB ?
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
    MOV NUM3,BL
    MOV NUM4,BL
    SHL BL,1
    ;
    MOV CL,0
    MOV CH,0
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    ;
    SPACE:
    CMP CH,NUM4
    JGE WHILE_
    MOV AH,2
    MOV DL,' '
    INT 21H
    INC CH
    JMP SPACE
    
    WHILE_:
    DEC NUM4
    MOV CH,0
    CMP CL,NUM3
    JE END_WHILE 
    MOV NUM1,0
    MOV NUM2,CL
    SHL NUM2,1
    MOV BH,NUM2
    ;
    PRINT:
    MOV AH,2
    MOV DL,'*'
    INT 21H
    INC NUM1
    CMP NUM1,BH
    JNG PRINT
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    INC CL
    JMP SPACE
    ;
    END_WHILE:
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN