.data
    max_terms:   .word 15    # Número máximo de términos en la serie Fibonacci
    term1:       .word 0     # Primer término de la serie Fibonacci
    term2:       .word 1     # Segundo término de la serie Fibonacci
    newline:     .asciiz "\n"

.text
.globl main

main:
    # Cargar el número máximo de términos en $t0
    lw $t0, max_terms

    # Cargar los primeros dos términos en $t1 y $t2
    lw $t1, term1
    lw $t2, term2

    # Mostrar los primeros dos términos
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Inicializar el contador de términos y el índice del ciclo
    li $t3, 2  # Comenzamos desde el tercer término (índice 2)
    li $t4, 1  # Inicializamos el contador de términos mostrados

    fibonacci_loop:
    # Calcular el siguiente término de Fibonacci (sumar $t1 y $t2)
    add $t3, $t3, 1  # Incrementar el índice del término
    add $t5, $t1, $t2
    move $t1, $t2
    move $t2, $t5

    # Mostrar el término actual
    li $v0, 1
    move $a0, $t2
    syscall

    # Incrementar el contador de términos mostrados
    addi $t4, $t4, 1

    # Comprobar si hemos alcanzado el número máximo de términos
    beq $t4, $t0, end_fibonacci

    # Imprimir una coma y un espacio en blanco
    li $v0, 4
    la $a0, comma_space
    syscall

    # Volver al inicio del bucle
    j fibonacci_loop

    end_fibonacci:
    # Imprimir una nueva línea y terminar
    li $v0, 4
    la $a0, newline
    syscall

    # Salir del programa
    li $v0, 10
    syscall

    .data
    comma_space: .asciiz ", "