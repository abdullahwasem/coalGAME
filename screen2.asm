[org 0x0100]

	jmp start

	;message0: db '______'
	;length0: dw 42

	;message1: db 'W E L C O M E  T O  C O I N  B U Z Z' ; string to be printed
	;length1: dw 36

	message2: db '/\/\/\/\'
	length2: dw 8

	message3: db '|||||'
	length3: dw 5

	;message4: db '|||||'
	;length4: dw 5

	;message5: db '|||||'
	;length5: dw 5

	message6: db '|TNT|'
	length6: dw 5

clrscr: 		; subroutine to color the screen
	push es
	push ax
	push cx
	push di
	mov ax, 0xb800
	mov es, ax 	; point es to video base
	xor di, di 	; point di to top left column
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

	

	mov ax, 54
	push ax 	; push x position
	mov ax, 3
	push ax 	; push y position
	mov ax, 0xAF 	; color attribute
	push ax 	; push attribute
	mov ax, message3
	push ax 	; push address of message
	push word [length3] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 22
	push ax 	; push x position
	mov ax, 14
	push ax 	; push y position
	mov ax, 0x9F 	; color attribute
	;mov ax, 0x81
	push ax 	; push attribute
	mov ax, message3
	push ax 	; push address of message
	push word [length3] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 66
	push ax 	; push x position
	mov ax, 8
	push ax 	; push y position
	mov ax, 0xDF 	; color attribute
	;mov ax, 
	push ax 	; push attribute
	mov ax, message3
	push ax 	; push address of message
	push word [length3] ; push message length
	call printstr 	; call the printstr subroutine

        mov ax, 39
	push ax 	; push x position
	mov ax, 11
	push ax 	; push y position
	mov ax, 0xAF 	; color attribute
	push ax 	; push attribute
	mov ax, message3
	push ax 	; push address of message
	push word [length3] ; push message length
	call printstr 	; call the printstr subroutine 

        mov ax, 29
	push ax 	; push x position
	mov ax, 7
	push ax 	; push y position
	mov ax, 0x4F 	; color attribute
	;mov ax, 0x5F
	push ax 	; push attribute
	mov ax, message6
	push ax 	; push address of message
	push word [length6] ; push message length
	call printstr 	; call the printstr subroutine


        mov ax, 77
	push ax 	; push x position
	mov ax, 17
	push ax 	; push y position
	mov ax, 0xDF 	; color attribute
	;mov ax, 
	push ax 	; push attribute
	mov ax, message3
	push ax 	; push address of message
	push word [length3] ; push message length
	call printstr 	; call the printstr subroutine


        mov ax, 60
	push ax 	; push x position
	mov ax, 19
	push ax 	; push y position
	mov ax, 0x9F 	; color attribute
	;mov ax, 0x81
	push ax 	; push attribute
	mov ax, message3
	push ax 	; push address of message
	push word [length3] ; push message length
	call printstr 	; call the printstr subroutine


	mov ax, 45
	push ax 	; push x position
	mov ax, 12
	push ax 	; push y position
	mov ax, 0x4F 	; color attribute
	;mov ax, 0x5F
	push ax 	; push attribute
	mov ax, message6
	push ax 	; push address of message
	push word [length6] ; push message length
	call printstr 	; call the printstr subroutine

	mov ax, 34
	push ax 	; push x position
	mov ax, 24
	push ax 	; push y position
	mov ax, 0x30 	; color attribute
	;mov ax, 0x4F
	push ax 	; push attribute
	mov ax, message2
	push ax 		; push address of message
	push word [length2] 	; push message length
	call printstr 		; call the printstr subroutine

	mov ax, 0x4c00 	; terminate program
	int 0x21


