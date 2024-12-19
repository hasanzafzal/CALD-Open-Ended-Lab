INCLUDE Irvine32.inc

.data
    array1 WORD 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h
    array2 WORD 10h dup(?)
    direct_heading BYTE "Direct Addressing: ", 0
    indirect_heading BYTE "Indirect Addressing: ", 0
.code
main PROC
    ; Display heading for Direct Addressing
    mov edx, OFFSET direct_heading
    call WriteString
    call Crlf

    ; Direct addressing mode: Accessing elements directly by index
    mov ax, array1[0] ; Access the first element of array1
    mov array2[0], ax ; Store the value in the first element of array2

    ; Display the element processed by Direct Addressing
    mov ax, array2[0]
    call WriteDec
    call Crlf

    ; Indirect addressing mode: Using a register to access elements
    mov esi, 0 ; Set the index register
    mov ax, array1[esi] ; Access the first element using the index
    mov array2[esi*2], ax ; Store the value in the second element of array2 (skipping one)

    ; Display the element processed by Indirect Addressing
    mov ax, array2[esi*2]
    call WriteDec
    call Crlf

    ; Loop to access and modify elements using indirect addressing
    mov ecx, 4 ; Loop counter
    mov esi, 0 ; Index register
Loop1:
    mov ax, array1[esi] ; Access the element
    add ax, 10h ; Modify the value
    mov array2[esi*2 + 2], ax ; Store the modified value in the third element (skipping two)

    ; Display modified element processed by Indirect Addressing
    mov ax, array2[esi*2 + 2]
    call WriteDec
    call Crlf

    add esi, 2 ; Increment the index by 2
    loop Loop1

    ; Display heading for Indirect Addressing
    mov edx, OFFSET indirect_heading
    call WriteString
    call Crlf

    ; Display the contents of array2
    mov ecx, 8 ; Loop counter
    mov esi, 0 ; Index register

Loop2:
    mov ax, array2[esi]
    call WriteDec
    call Crlf
    add esi, 2 ; Increment the index by 2
    loop Loop2

    exit
main ENDP
END main