include Irvine32.inc

.data
    msg byte "Value: ",0
    space byte " ",0 ;for spacing
.code
main proc
    mov eax,1       ; Initialize counter to 1
Loop1:
    mov edx,offset msg ; Load offset of message
    call WriteString    ; Display "Value: "
    call WriteDec     ; Display the current number
    mov edx,offset space ; Load offset of space
    call Crlf ; Displays on New line 
    inc eax         ; Increment the counter
    cmp eax,10      ; Compare counter with 10 (loop until 9)
    jl Loop1           ; Jump to loop if < 10

    invoke ExitProcess,0
main endp
end main