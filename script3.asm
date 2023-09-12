.data
    max_terms:   .word 15    # N�mero m�ximo de t�rminos en la serie Fibonacci
    term1:       .word 0     # Primer t�rmino de la serie Fibonacci
    term2:       .word 1     # Segundo t�rmino de la serie Fibonacci
    newline:     .asciiz "\n"

.text
.globl main

main:
    # Cargar el n�mero m�ximo de t�rminos en $t0
    lw $t0, max_terms

    # Cargar los primeros dos t�rminos en $t1 y $t2
    lw $t1, term1
    lw $t2, term2

    # Mostrar los primeros dos t�rminos
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Inicializar el contador de t�rminos y el �ndice del ciclo
    li $t3, 2  # Comenzamos desde el tercer t�rmino (�ndice 2)
    li $t4, 1  # Inicializamos el contador de t�rminos mostrados

    fibonacci_loop:
    # Calcular el siguiente t�rmino de Fibonacci (sumar $t1 y $t2)
    add $t3, $t3, 1  # Incrementar el �ndice del t�rmino
    add $t5, $t1, $t2
    move $t1, $t2
    move $t2, $t5

    # Mostrar el t�rmino actual
    li $v0, 1
    move $a0, $t2
    syscall

    # Incrementar el contador de t�rminos mostrados
    addi $t4, $t4, 1

    # Comprobar si hemos alcanzado el n�mero m�ximo de t�rminos
    beq $t4, $t0, end_fibonacci

    # Imprimir una coma y un espacio en blanco
    li $v0, 4
    la $a0, comma_space
    syscall

    # Volver al inicio del bucle
    j fibonacci_loop

    end_fibonacci:
    # Imprimir una nueva l�nea y terminar
    li $v0, 4
    la $a0, newline
    syscall

    # Salir del programa
    li $v0, 10
    syscall

    .data
    comma_space: .asciiz ", "