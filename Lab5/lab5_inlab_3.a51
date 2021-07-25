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
	  
	  
	 mov 41h,#69h  ; 0100 0001
	mov 56h,#23h ; 0101 0110
	mov 58h,#45h ; 0101 1000
 
	  ;initial delay for lcd power up

	;here1:setb p1.0
      	  acall delay
	;clr p1.0
	  acall delay
	;sjmp here1

	;acall init
	  acall lcd_init      ;initialise LCD
	
	  acall delay
	  acall delay
	  acall delay

      again:
		      acall readByte
			  
			  mov a,#080h
		acall lcd_command
		acall delay
		  
		
		mov a,#4ch
		acall lcd_senddata
	  mov a,#6fh
	  acall lcd_senddata
	  mov a,#63h
	  acall lcd_senddata
	  mov a,#61h
	  acall lcd_senddata
	  mov a,#74h
	  acall lcd_senddata
	  mov a,#69h
	  acall lcd_senddata
	  mov a,#6fh
	  acall lcd_senddata
	  mov a,#6eh
	  acall lcd_senddata
	  mov a,#3ah
	  acall lcd_senddata
	  mov a,#20h
	  acall lcd_senddata
	  mov a,50h         ; show location
	  acall bit2ascii_1
	  acall lcd_senddata
	  mov a,50h         ; show location
	  acall bit2ascii_2
	  acall lcd_senddata
	  
	  
	  mov a,#0C0h
	  acall lcd_command
	  acall delay
	  
	  mov a,#43h
		acall lcd_senddata
		mov a,#6fh
		acall lcd_senddata
		mov a,#6eh
		acall lcd_senddata
		mov a,#74h
		acall lcd_senddata
		mov a,#65h
		acall lcd_senddata
		mov a,#6eh
		acall lcd_senddata
		mov a,#74h
		acall lcd_senddata
		mov a,#73h
		acall lcd_senddata
		mov a,#3ah
		acall lcd_senddata
		mov a,#20h
		acall lcd_senddata
		mov r0,50h
		mov a,@r0         ; show content
		acall bit2ascii_1
	    acall lcd_senddata
		mov r0,50h
	    mov a,@r0         ; show content
	    acall bit2ascii_2
	    acall lcd_senddata
		
		acall delay5
		
		ljmp again
	  
here: sjmp here				//stay here 

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
													
		pop AR4
		pop AR3
		pop AR2
		pop PSW
		ret
delay1 :
	    Using 0
		push PSW
		push AR3
		push AR4
		push AR2
		
				    
					
					mov R2,#20
						back0:
							mov R4,#200
								back1:
										mov R3, #0FFH
											back2:
													djnz R3, back2
													djnz R4, back1
													djnz R2, back0
													
		pop AR4
		pop AR3
		pop AR2
		pop PSW
		ret


readNibble : 
             
			 ;setb P1.0
			 ;setb P1.1
			 ;setb P1.2
			 ;setb P1.3
			 ;setb P1.4
			 ;setb P1.5
			 ;setb P1.6
			 ;setb P1.7
			 clr P1.4
			 clr P1.5
			 clr P1.6
			 clr P1.7
			 
			 mov P1,#0FFH
                      
			 lcall delay5
                         clr P1.4
			 clr P1.5
			 clr P1.6
			 clr P1.7
			 lcall delay1
			 mov a,P1
			 swap a
			 mov P1,a
			 lcall delay5
			 ret

packNibbles : 
	         mov R0,#4fH
			 mov R1,#50H
			 mov a,@R0
			 swap a
			 dec R0
			 orl a,@R0
			 mov @R1,a
			 ret
			 
readByte:
	acall readNibble
	mov 4eh,a
	acall readNibble
	mov 4fh,a
	acall packNibbles
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
         mov   LCD_data,A     ;Move the command to LCD port
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

