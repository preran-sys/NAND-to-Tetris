// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Pseudocode : 

// Computes: RAM[SCREEN] = -1 if RAM[KBD] !=0 and RAM[SCREEN] = 0 if RAM[KBD] ==0

// Usage: 16384 <= SCREEN <= 24576

/*
word = 0
max = 8192
LOOP:
	word = 0
	If RAM[KBD] == 0 goto FILL_WHITE
	If RAM[KBD] != 0 got FILL_BLACK
FILL_WHITE:
	if (word >= 8192) goto LOOP
	RAM[SCREEN + word] = 0
	word = word + 1
	goto FILL_WHITE
FILL_BLACK:
	if (word >= 8192) goto LOOP
	RAM[SCREEN + word] = -1
	word = word + 1
	goto FILL_BLACK
*/

@word
M=0

@8192
M=A

(LOOP)
//word = 0
@word
M=0

//If RAM[KBD] == 0 goto FILL_WHITE
@KBD
D=M

@FILL_WHITE
D;JEQ

//If RAM[KBD] != 0 got FILL_BLACK
@KBD
D=M

@FILL_BLACK
D;JNE

(FILL_WHITE)
//if (word >= 8192) goto LOOP
@word	
D=M

@8192
D=D-M

@LOOP
D;JEQ

//RAM[SCREEN + word] = 0
@SCREEN
D=A

@word
D=D+M

A=D
M=0

//word = word + 1
@word
M=M+1

//goto FILL_WHITE
@FILL_WHITE
0;JMP

(FILL_BLACK)
//if (word >= 8192) goto LOOP
@word
D=M

@8192
D=D-M

@LOOP
D;JEQ

//RAM[SCREEN + word] = -1
@SCREEN
D=A
@word
D=D+M

A=D
M=-1

//word = word + 1
@word
M=M+1 

//goto FILL_BLACK
@FILL_BLACK
0;JMP