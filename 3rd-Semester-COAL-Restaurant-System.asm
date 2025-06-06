.MODEL LARGE
print macro m
    mov ah, 09
    lea dx, m
    int 21h
endm

.STACK 1000H
.DATA
M1 DB 10,13,10,13,'                  Our Five star Restaurants      $',10,13 
M2 DB 10,13,10,13,'Enter your Choise $'

M3 DB 10,13,'                  1.Breakfast Menue         $' 
M4 DB 10,13,'                   2.Lunch Menue            $'
M5 DB 10,13,'                   3.Dinner Menue          $'
M7 DB 10,13,'                       4.Drinks             $'  
str db 10,13,'       3-for same menu       $'               
               
M8 DB 10,13,10,13,'Enter the food number $'
  
;BREAKFAST  
M9 DB 10,13,'             1.Tanduri Roti            50/-                     $' ;breakfast
M10 DB 10,13,'            2.Nan                     30/-                     $'
M11 DB 10,13,'            3.Parata                  60/-                     $'
M12 DB 10,13,'            4.Dal                     150/-                    $'
M13 DB 10,13,'            5.Mixed Vegetables        140/-                    $'
M14 DB 10,13,'            6.Halwa                   120/-                    $'
M15 DB 10,13,'            7.Luchi                   40/-                     $'
M16 DB 10,13,'            8.Fried Egg               50/-                     $'
M17 DB 10,13,'            9.Goats Feet              160/-                    $' 

 

;lunch & dinner 

M25 DB 10,13,'   1.Kachchi Birani(Kabab)                  400/-                $' 
M26 DB 10,13,'   2.Chicken Birani(Kabab)                  350/-                $' 
M27 DB 10,13,'   3.Plain Polaw                            370/-                $' 
M28 DB 10,13,'   4.Chicken Bhuna Khichuri(with Kabab)     450/-                $'
M29 DB 10,13,'   5.Mutton Bhuna Khichuri(with Kabab)      900/-                $'
M30 DB 10,13,'   6.Plain Rice                             100/-                $'
M31 DB 10,13,'   7.Pabda Fish                             300/-                $'
M32 DB 10,13,'   8.Lobstar Big/Small                      300/-                $'
M33 DB 10,13,'   9.Koi Fish                               350/-                $'
 

 
 
;DINNER

M18 DB 10,13,'    1.Goats Brain             600/-                               $'
M19 DB 10,13,'    2.Chicken Bhuna Khichuri  800/-                               $'
M20 DB 10,13,'    3.Mutton Bhuna Khichuri   800/-                               $' 
M21 DB 10,13,'    4.Chicken Liver/Kolija    400/-                               $'
M22 DB 10,13,'    5.Goats Liver/Kolija      500/-                               $'
M23 DB 10,13,'    6.Chicken Vuna            700/-                               $'
M34 DB 10,13,'    7.Hilsha Fish             600/-                               $'
M35 DB 10,13,'    8.Rui Fish                600/-                               $'
M36 DB 10,13,'    9.Molay/Kaski Fish        600/-                               $'


;Drinks
M49 DB 10,13,'  1.Shoft Drinks 80/-                      $'
M50 DB 10,13,'  2.Laschi       60/-                      $'
M51 DB 10,13,'  3.Borhani      90/-                      $'
M52 DB 10,13,'  4.Labang       90/-                      $'
M53 DB 10,13,'  5.Coffee       70/-                      $'
M54 DB 10,13,'  6.Tea          50/-                      $'



;INVALID
M55 DB 10,13,10,13,'  INVALID option selected $'
M56 DB 10,13,'      Try Again $'



M57 DB 10,13,10,13,'Enter your order: $'
M58 DB 10,13,'Quantity: $'
M59 DB 10,13,'Total Price: $'


DRINK DB ?
QUANTITY DB ?
price db ?

M60 DB 10,13,10,13,'1.Go Back to Main Menu$'
M61 DB 10,13,'2.EXIT$'




SEJ DB 10,13,10,13,' $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
  TOP:
  
    print M1
    
    print SEJ ;NEWLINE
    mov price,'0'
     
    print M3   ; breakfast
    print M4
    print M5
    print M7
    print M2 ; choice
    
  
    MOV AH,1    ; input
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE BREAKFAST
    
    CMP BH,2
    JE LD   
     
    CMP BH,3
    JE DINNER 
    
    CMP BH,4
    JE DRINKS
    
    
    JMP INVALID
    
       
    
    
   BREAKFAST:
             ;BREAkFAST STARTS

    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H

    print M10
    print M11
    print M12
    print M13
    print M14
    print M15
    print M16
    print M17
    print M57
    
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE TEN
    
    CMP BL,2
    JE TEN
    
    CMP BL,3
    JE TEN 
    
    CMP BL,4
    JE TEN
    
    CMP BL,5
    JE TWENTY
    
    CMP BL,6
    JE TWENTY
    
    CMP BL,7
    JE TEN
    
    CMP BL,8
    JE TWENTY 
    
    CMP BL,9
    JE SIXTY

    JMP INVALID
    
    
          
   FOURTY:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    lea Dx,str
    mov ah,09    ;for going same menu
    int 21h 
    
    LEA DX,M2
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    cmp Al,2
    JE BreakFast
    
    JMP EXIT
             
   FIFTY:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
           
           
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48    ;MAIN  MENU
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT
             
   SEVENTY:
    MOV BL,7
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H       ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT
         
   EIGHTY:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2    ;MAIN MENU
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT         
    
    JMP EXIT
    
    
    
    
     
     
    LD:
                    ;LUNCH AND DINNER
    LEA DX,M8
    MOV AH,9
    INT 21H
    
    
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
     
    

    print M25
    print M26
    print M27
    print M28
    print M29
    print M30
    print M31
    print M32
    print M33
    print M57 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE NINETY
    
    CMP BL,2
    JE NINETY
    
    CMP BL,3
    JE THIRTY
    
    CMP BL,4
    JE NINETY
    
    CMP BL,5
    JE NINETY
    
    CMP BL,6
    JE TEN
    
    CMP BL,7
    JE THIRTY
    
    CMP BL,8
    JE THIRTY 
    
    CMP BL,9
    JE THIRTY
    
    JMP INVALID
    
   TEN:
    MOV BL,1
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    print M59              
  
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H  
    
    ;FOR /- PRINT
    
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
     
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
        
    lea dx,str
    mov ah,09
    int 21h 
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H          
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    cmp Al,3
    JE breakFast
    
    JMP EXIT
    
   
   
    
   TWENTY:
   
    MOV BL,2
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H   
    
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT 
    
   THIRTY:
   
    MOV BL,3
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H  
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H   
    
        
    lea dx,str
    mov ah,09
    int 21h 
    
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    cmp al,3
    je breakfast
    JMP EXIT
    
    
   SIXTY: 
   
    MOV BL,6
   
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
           
           
        
    lea dx,str
    mov ah,09
    int 21h 
           
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    cmp al,3
    je breakfast
    JMP EXIT
    
      
   NINETY:
    MOV BL,9
    
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H 
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT 

    
    JMP EXIT 

    
  DINNER:
    LEA DX,M8
    MOV AH,9         ;DINNER STARTS
    INT 21H
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,M18         ;1th
    MOV AH,9
    INT 21H 
    
    LEA DX,M19
    MOV AH,9              ;2th
    INT 21H
    
    
    LEA DX,M20          ;3th
    MOV AH,9
    INT 21H
    
    LEA DX,M21
    MOV AH,9                ;4th
    INT 21H  
    
    
    LEA DX,M22              ;5th
    MOV AH,9
    INT 21H 
    
    
    LEA DX,M23               ;6th
    MOV AH,9
    INT 21H
    
     
    LEA DX,M34               ;10th
    MOV AH,9
    INT 21H
    
    
    LEA DX,M35               ;11th
    MOV AH,9
    INT 21H 
    
    LEA DX,M36               ;12th
    MOV AH,9
    INT 21H
      
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE SIXTY
    
    CMP BL,2
    JE EIGHTY
    
    CMP BL,3
    JE EIGHTY 
    
    CMP BL,4
    JE FOURTY
    
    CMP BL,5
    JE FIFTY
    
    CMP BL,6
    JE SEVENTY
    
    CMP BL,7
    JE SIXTY
    
    CMP BL,8
    JE SIXTY 
    
    CMP BL,9
    JE SIXTY
    
   FOURTY1:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT
 
   
    
  FIFTY1:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
           
           
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48    ;MAIN  MENU
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT
   
   SIXTY1: 
   
    MOV BL,6
   
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT 
    
    
    
    
   SEVENTY1:
    MOV BL,7
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H       ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT
         
   EIGHTY1:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2    ;MAIN MENU
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT         
    
    JMP EXIT
    
   DRINKS:  
    LEA DX,M8
    MOV AH,9            ;DRINKS STARTS
    INT 21H 
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
   

    print M49
    print M50
    print M51
    print M52
    print M53
    print M54
    print M57
    
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE SOFTDRINK
    
    CMP BL,2
    JE LASCHI
    
    CMP BL,3
    JE BORHANI
    
    CMP BL,4
    JE LABANG
    
    CMP BL,5
    JE COFFEE 
    
    CMP BL,6
    JE TEA 
    
    JMP INVALID
    
   SOFTDRINK:
    MOV BL,8
    JMP COMMON
    
   LASCHI:
    MOV BL,6
    JMP COMMON
   
    
   BORHANI:
    MOV BL,9
    JMP COMMON
    
   LABANG:
    MOV BL,9
    JMP COMMON
    
    
   COFFEE:
    MOV BL,7
    JMP COMMON
    
 
   TEA:
    MOV BL,5
    JMP COMMON
   
   
    
    
   COMMON: 
    LEA DX,M58              
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H 
    
    
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT:
    
    
   INVALID:
   
    LEA DX,M55
    MOV AH,9
    INT 21H 
    
    
    LEA DX,M56 
    MOV AH,9
    INT 21H 
    
    JMP EXIT 
    
     EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
