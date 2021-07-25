; This subroutine writes characters on the LCD
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

ORG 0000H
ljmp start



org 200h
start:
      mov P2,#00h
      mov P1,#00h
	  
	   ;initial delay for lcd power up

	;here1:setb p1.0
      	  acall delay
	;clr p1.0
	  acall delay
	;sjmp here1


	  acall lcd_init      ;initialise LCD
	
	  acall delay
	  acall delay
	  acall delay
	 
	 mov a,#80h
	  acall lcd_command
	  acall delay
	  
	  
	  
	  mov b,#2
	  mov r0,#3
	  mov r1,#4
	  mov r2,#5
	   mov r3,#6
	  mov r4,#7
	  mov r5,#8
	  mov r6,#9
	  mov r7,#10
	 
	 
	  mov a,#41h
	  acall lcd_senddata
	  mov a,#42h
	  acall lcd_senddata
	  mov a,#50h
	  acall lcd_senddata
	  mov a,#53h
	  acall lcd_senddata
	  mov a,#57h
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,#3dh
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,#1                ; show value of a(random value =1)
	  acall bit2ascii_1
	  acall lcd_senddata
	  mov a,#1                ; show value of a(random value =1)
	  acall bit2ascii_2
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,b                 ; show b
	  acall bit2ascii_1
	  acall lcd_senddata
	  mov a,b                ; show b
	  acall bit2ascii_2
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	   mov a,psw                 ; show psw
	  acall bit2ascii_1
	  acall lcd_senddata
	  mov a,psw                ; show psw
	  acall bit2ascii_2
	  acall lcd_senddata
	  
	  
	   mov a,#0C0h           ; 2nd row
	  acall lcd_command
	  acall delay
	 
	 
	   mov a,#52h
	  acall lcd_senddata
	  mov a,#30h
	  acall lcd_senddata
	  mov a,#31h
	  acall lcd_senddata
	  mov a,#32h
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,#3dh
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,r0
	  acall bit2ascii_1
	  acall lcd_senddata ; show r0
	  mov a,r0
	  acall bit2ascii_2
	  acall lcd_senddata ; show r0
	  mov a,#20h
	  acall lcd_senddata
	  mov a,r1
	  acall bit2ascii_1
	  acall lcd_senddata ; show r1
	  mov a,r1
	  acall bit2ascii_2
	  acall lcd_senddata ; show r1
	  mov a,#20h
	  acall lcd_senddata
	  mov a,r2
	  acall bit2ascii_1
	  acall lcd_senddata ; show r2
	  mov a,r2
	  acall bit2ascii_2
	  acall lcd_senddata ; show r2
	  mov a,#20h
	  acall lcd_senddata
	  
	  acall delay5
	  
	  mov a,#80h
	  acall lcd_command
	  acall delay
	  
	  mov a,#52h
	  acall lcd_senddata
	  mov a,#33h
	  acall lcd_senddata
	  mov a,#34h
	  acall lcd_senddata
	  mov a,#35h
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,#3dh
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata

mov a,r3            ; show r3
	  acall bit2ascii_1
	  acall lcd_senddata 
	  mov a,r3            ; show r3
	  acall bit2ascii_2
	  acall lcd_senddata  
	  mov a,#20h
	  acall lcd_senddata
	  mov a,r4            ; show r4
	  acall bit2ascii_1
	  acall lcd_senddata 
	  mov a,r4			  ; show r4
	  acall bit2ascii_2
	  acall lcd_senddata 
	  mov a,#20h
	  acall lcd_senddata
	  mov a,r5            ; show r5
	  acall bit2ascii_1
	  acall lcd_senddata 
	  mov a,r5			  ; show r5
	  acall bit2ascii_2
	  acall lcd_senddata 
	  mov a,#20h
	  acall lcd_senddata
	  
	  mov a,#0C0h		  ; 2nd row
	  acall lcd_command
	  acall delay
	  
	  mov a,#52h
	  acall lcd_senddata
	  mov a,#36h
	  acall lcd_senddata
	  mov a,#37h
	  acall lcd_senddata
	  mov a,#53h
	  acall lcd_senddata
	  mov a,#50h
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,#3dh
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,r6            ; show r6
	  acall bit2ascii_1
	  acall lcd_senddata 
	  mov a,r6			  ; show r6
	  acall bit2ascii_2
	  acall lcd_senddata 
	  mov a,#20h
	  acall lcd_senddata
	  mov a,r7            ; show r7
	  acall bit2ascii_1
	  acall lcd_senddata 
	  mov a,r7			  ; show r7
	  acall bit2ascii_2
	  acall lcd_senddata 
	  mov a,#20h
	  acall lcd_senddata
	  mov a,sp            ; show sp
	  acall bit2ascii_1
	  acall lcd_senddata 
	  mov a,sp			  ; show sp
	  acall bit2ascii_2
	  acall lcd_senddata 
	 

      stop : sjmp stop
	  
	  
	  
	  
	  
	  
	  
	  ;initial delay for lcd power up

	;here1:setb p1.0
      ;	  acall delay
	;clr p1.0
	  ;acall delay
	;sjmp here1


	;  acall lcd_init      ;initialise LCD
	
	 ; acall delay
	  ;acall delay
	  ;acall delay
	  ;mov a,#82h		 ;Put cursor on first row,5 column
	  ;acall lcd_command	 ;send command to LCD
	  ;acall delay
	  ;mov   r0,#80H   ;Load DPTR with sring1 Addr
	  ;acall lcd_sendstring	   ;call text strings sending routine
	  ;acall delay

	  ;mov a,#0C1h		  ;Put cursor on second row,3 column
	  ;acall lcd_command
	  ;acall delay
	  ;mov   r0,#88H
	  ;acall lcd_sendstring

				//stay here 

delay5 :
	    Using 0
		push PSW
		push AR3
		push AR4
		push AR2
		
				    
					
					mov R2,#100
						back3:
							mov R4,#200
								back4:
										mov R3, #0FFH
											back5:
													djnz R3, back5
													djnz R4, back4
													djnz R2, back3
													
		pop AR2
		pop AR4
		pop AR3
		pop PSW
		ret


bit2ascii_1 : 
            using 0
	;first ascii
	anl a,#0f0h
	add a,#60h
	swap a
	jnc here1
		add a,#17h
	here1: add a,#2ah
ret
			
bit2ascii_2 :
            ;second ascii
	swap a
	anl a,#0f0h
	add a,#60h
	swap a
	jnc here2
		add a,#17h
	here2: add a,#2ah
ret

;------------------------LCD Initialisation routine----------------------------------------------------
lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
	     acall delay

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en

		 acall delay
         
         ret                  ;Return from routine

;-----------------------command sending routine-------------------------------------
 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
;-----------------------data sending routine-------------------------------------		     
 lcd_senddata:
         mov   LCD_data,a   ;Move the command to LCD port
         setb  LCD_rs         ;Selected data register
         clr   LCD_rw         ;We are writing
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         acall delay
		 acall delay
         ret                  ;Return from busy routine

;-----------------------text strings sending routine-------------------------------------
lcd_sendstring:
	push 0e0h
	lcd_sendstring_loop:
	 	 clr   a                 ;clear Accumulator for any previous data
	         mov  a,@r0        ;load the first character in accumulator
	         jz    exit              ;go to exit if zero
	         acall lcd_senddata      ;send first char
	         inc   r0              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    pop 0e0h
         ret                     ;End of routine

;----------------------delay routine-----------------------------------------------------
delay:	 push 0
	 push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret

;------------- ROM text strings---------------------------------------------------------------
end
