org 0H
ljmp main;

org 100H
main:
	mov R0,#50H
	mov R1,#60H
	mov a,@R0
	mov R5,a
	mov R4,#00
	mov a,@R1
	add a,R5
	jnc here
	inc R4
	mov b,R4
	mov 71H,b
	mov 70H,a
	here : mov 70H,a
		   mov b,R4
		   mov 71H,b
end
	
	
	