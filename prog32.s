	.global _start

_start:
	ldr	R1, =msgText	@ Pointer to text for subroutine
	mov	R2, #12		@ Length of message to display for subroutine
	bl	displayAscii	@ Branch and link to subroutine
	mov	R0, #0		@ Code for normal termination
	mov	R7, #1		@ Code to terminate program
	svc	0		@ Terminate program

	.data

msgText:
	.ascii	"Test string\n"

	.text

	@ Subroutines
	@ 	displayAscii, display ASCII message to stdout
	@		R1: Pointer to start of ascii message
	@		R2: Length of message
	@		LR: Contains return address
	@		Consumed registers: R0, R7

displayAscii:
	mov	R0, #1		@ Code to write to stdout
	mov	R7, #4		@ Code for svc to write string
	svc	0		@ Command to write string
	bx	LR		@ Return to calling program
