; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Nombre:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Práctica:     15 - Manipulacion de datos
; *************************************************************************

INCLUDE Irvine32.inc

.data
    origen     DWORD 100, 200, 300            ; Declara un arreglo de datos fuente
    destino    DWORD 3 DUP(0)                 ; Declara un arreglo destino inicializado en ceros
    msgOrigen  BYTE "Datos manipulados y copiados en memoria.", 0
    msgDestino BYTE "Valor consultado del destino: ", 0

.code
main PROC
    mov eax, origen[0]             ; Carga el primer elemento del origen en el registro EAX
    mov destino[0], eax            ; Almacena el valor copiado en la primera posición del destino

    mov eax, origen[4]             ; Carga el segundo elemento del origen (desplazado 4 bytes) en EAX
    mov destino[4], eax            ; Almacena el valor en la segunda posición del destino

    mov eax, origen[8]             ; Carga el tercer elemento del origen (desplazado 8 bytes) en EAX
    mov destino[8], eax            ; Almacena el valor en la tercera posición del destino

    mov edx, OFFSET msgOrigen      ; Carga la dirección del mensaje informativo
    call WriteString               ; Imprime el texto en la consola
    call Crlf                      ; Realiza un salto de línea

    mov edx, OFFSET msgDestino     ; Carga la dirección del texto descriptivo del resultado
    call WriteString               ; Muestra el mensaje en la pantalla

    mov eax, destino[4]            ; Carga el segundo elemento modificado del arreglo destino en EAX
    call WriteInt                  ; Escribe el valor entero en formato legible por consola

    exit
main ENDP
END main