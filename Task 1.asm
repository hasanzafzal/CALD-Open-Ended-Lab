INCLUDE Irvine32.inc

.data
    message BYTE "Welcome to assembly language", 0
.code
main PROC
    mov edx, OFFSET message    ; Load the address of the message into EDX
    call WriteString           ; Write the string to the console
    call Crlf                  ; Print a newline
    exit                       ; Exit the program
main ENDP

END main                    