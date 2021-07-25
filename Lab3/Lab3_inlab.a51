org 0H
LJMP main

org 10H
	
conv : 
       //1
	   mov a,@r0
	   mov b,r4
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   inc r1
	   
	   //2
	   mov a,@r0
	   mov b,r5
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   inc r1
	   inc r0
	   mov a,@r0
	   mov b,r4
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   mov a,@r1
	   dec r1
	   dec r1
	   add a,@r1
	   mov @r1,a
	   inc r1
	   mov a,@r1
	   dec r1
	   dec r1
	   addc a,@r1
	   mov @r1,a
	   
	   inc r1
	   inc r1
	   dec r0
	   //3
	   mov a,@r0
	   mov b,r6
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   inc r1
	   inc r0
	   mov a,@r0
	   mov b,r5
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   inc r1
	   inc r0
	   mov a,@r0
	   mov b,r4
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   mov a,@r1
	   dec r1
	   dec r1
	   add a,@r1
	   mov @r1,a
	   dec r1
	   dec r1
	   addc a,@r1
	   mov @r1,a
	   mov a,@r1
	   inc r1
	   inc r1
	   inc r1
	   mov a,@r1
	   dec r1
	   dec r1
	   addc a,@r1
	   dec r1
	   dec r1
	   addc a,@r1
	   mov @r1,a
	   
	   inc r1
	   inc r1
	   dec r0
	   dec r0
	   
	   //4
	   inc r0
	   mov a,@r0
	   mov b,r6
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   inc r1
	   inc r0
	   mov a,@r0
	   mov b,r5
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   mov a,@r1
	   dec r1
	   dec r1
	   add a,@r1
	   mov @r1,a
	   inc r1
	   mov a,@r1
	   dec r1
	   dec r1
	   addc a,@r1
	   mov @r1,a
	   
	   inc r1
	   inc r1
	   dec r0
	   dec r0
	   
	   //5
	   inc r0
	   inc r0
	   mov a,@r0
	   mov b,r6
	   mul ab
	   mov @r1,a
	   inc r1
	   mov @r1,b
	   ret
	  
	   
	   
	   
	   
main:
	  mov r0, #50H
	  mov r1, #51H
	  mov r3,#0
	  mov r2,#0
	  mov r7,#0
	  mov a,@r0
	  mov r0,a
	  mov a,@r1
	  mov r1,a
	  mov a,@r1
	  mov r4,a
	  inc r1
	  mov a,@r1
	  mov r5,a
	  inc r1
	  mov a,@r1
	  mov r6,a
	  mov r1,#52H
	  mov a,@r1
	  mov r1,a
	  lcall conv
	  here:
		    sjmp here
	  end
		  
	  
	   