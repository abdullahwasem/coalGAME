	[org 0x0100]

	jmp start

	message0: db '__________________________________________'
	length0: dw 42

	message1: db 'W E L C O M E  T O  C O I N  B U Z Z' ; string to be printed
	length1: dw 36

	message2: db 'I N S T R U C T I O N S'
	length2: dw 23

	message3: db 'Green Colored Coin Gives Five Points'
	length3: dw 36

	message4: db 'Blue Colored Coin Gives Ten Points'
	length4: dw 34

	message5: db 'Purple Colored Coin Gives Fifteen Points'
	length5: dw 40

	message6: db 'Red Object Is A Bomb That Terminates The Game'
	length6: dw 45

clrscr: 		; subroutine to color the screen
	push es
	push ax
	push cx
	push di
	mov ax, 0xb800
	mov es, ax 	; point es to video base
	xor di, di 	; point di to top left column
	;mov ax, 0x5520
	mov ax, 0x3320
	mov cx, 2000 	; number of screen locations
	cld 		; auto increment mode
	rep stosw 	; clear the whole screen
	pop di
	pop cx
	pop ax
	pop es
	ret
printstr: 
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 	; point es to video base
	mov al, 80 	; load al with columns per row
	mul byte [bp+10] ; multiply with y position
	add ax, [bp+12] ; add x position
	shl ax, 1 	; turn into byte offset
	mov di,ax 	; point di to required location
	mov si, [bp+6] 	; point si to string
	mov cx, [bp+4] 	; load length of string in cx
	mov ah, [bp+8]
	cld ; auto increment mode

nextchar: 
	lodsb 		; load next char in al
	stosw 		; print char/attribute pair
	loop nextchar 	; repeat for the whole string

	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 10

start: 

	call clrscr 	; call the clrscr subroutine

	mov ax, 19
	push ax 	; push x position
	mov ax, 5
	push ax 	; push y position
	mov ax, 0x30	; color attribute
	push ax 	; push attribute
	mov ax, message0
	push ax 	; push address of message
	push word [length0] ; push message length
	call printstr 	; call the printstr subroutine
	

	mov ax, 22
	push ax 	; push x position
	mov ax, 7
	push ax 	; push y position
	mov ax, 0xB0 	; color attribute
	push ax 	; push attribute
	mov ax, message1
	push ax 	; push address of message
	push word [length1] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 19
	push ax 	; push x position
	mov ax, 8
	push ax 	; push y position	 	
	mov ax, 0x30	; color attribute
	push ax 	; push attribute
	mov ax, message0
	push ax 	; push address of message
	push word [length0] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 28
	push ax 	; push x position
	mov ax, 12
	push ax 	; push y position
	mov ax, 0x30 	; color attribute
	push ax 	; push attribute
	mov ax, message2
	push ax 	; push address of message
	push word [length2] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 22
	push ax 	; push x position
	mov ax, 14
	push ax 	; push y position
	mov ax, 0x30 	; color attribute
	;mov ax, 0x2F
	push ax 	; push attribute
	mov ax, message3
	push ax 	; push address of message
	push word [length3] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 23
	push ax 	; push x position
	mov ax, 16
	push ax 	; push y position
	mov ax, 0x30 	; color attribute
	;mov ax, 0x1F
	push ax 	; push attribute
	mov ax, message4
	push ax 	; push address of message
	push word [length4] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 21
	push ax 	; push x position
	mov ax, 18
	push ax 	; push y position
	mov ax, 0x30 	; color attribute
	;mov ax, 0x5F
	push ax 	; push attribute
	mov ax, message5
	push ax 	; push address of message
	push word [length5] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 18
	push ax 	; push x position
	mov ax, 20
	push ax 	; push y position
	mov ax, 0x30 	; color attribute
	;mov ax, 0x4F
	push ax 	; push attribute
	mov ax, message6
	push ax 	; push address of message
	push word [length6] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 0x4c00 	; terminate program
	int 0x21