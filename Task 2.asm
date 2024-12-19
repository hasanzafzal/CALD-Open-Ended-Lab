INCLUDE Irvine32.inc

.data
    inputMsg BYTE "Enter a 32-bit integer: ", 0
    outputMsg BYTE "You entered: ", 0
.code
main PROC
    ; Prompt the user for input
    mov edx, OFFSET inputMsg
    call WriteString
    ; Read the integer from the user
    call ReadInt
    mov ebx, eax ; Store the input in ebx
    ; Display the output message
    mov edx, OFFSET outputMsg
    call WriteString
    ; Display the stored integer
    mov eax, ebx
    call WriteDec
    call Crlf
    exit
main ENDP
END main 