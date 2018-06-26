		.global _start

_start:
	mov	R0, #0	@ All went fine
	mov 	R7, #1	@ Tell scv to terminate
	svc 	0	@ Terminate program
