; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Nombre:       Yahir Luna Beltran 
; Materia:      Lenguaje de Interfaz
; Práctica:     6.1 - Conteo Regresivo utilizando Decremento
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgFin BYTE "¡Cuenta regresiva finalizada!", 0

.code
main PROC
    mov ecx, 10         ; Inicializa el registro ECX con el número desde el cual empezará la cuenta regresiva
      

cuenta_regresiva:
    push ecx            ; Respaldamos el valor de ECX en la pila     

    mov eax, ecx         ; Movemos el valor actual del contador a EAX para imprimirlo con Irvine32
    call WriteDec        
    call Crlf            ; Salto de línea

    pop ecx             ; Recupera el valor de ECX         

    dec ecx              ; Decrementa el contador en 1 usando DEC          
    
    jnz cuenta_regresiva ; Verificamos si ECX llegó a cero; si no es cero, repetimos el ciclo

    mov edx, OFFSET msgFin  ; Imprime mensaje de finalización
    call WriteString

    exit
main ENDP
END main