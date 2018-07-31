	.global	_start		@ Provide starting point for linker

_start:
	mov	R0, #1		@ Load "True"
	bl	v_bool		@ Call subroutine to display true or false
	mov	R0, #0		@ Code finished successfully
	mov 	R7, #1		@ Code to terminate program
	svc	0		@ Terminate program

	
	@ Subroutines
	@ 	v_bool, display text True or False depending on what is in R0
	@		R0: True if non-zero value
	@		LR: Contains return address
	@		Consumed registers: R0, R1, R2, R7

v_bool:
	cmp	R0, #0		@ Set flag to false or true
	ldrne	R1,=T_msg	@ If true display true message
	ldreq	R1,=F_msg	@ If false display false message
	movne	R2, #5		@ Number of chars to be displayed if true
	moveq 	R2, #6		@ Number of chars to be displayed if false
	mov	R0, #1		@ Code for std-out
	mov	R7, #4		@ Svc code for print string
	svc	0		@ Call to print
	bx	LR		@ Return to calling program


	.data

T_msg:	.ascii	"True\n" 	@ String if true
F_msg:	.ascii	"False\n"	@ String if false

	.end

	
