.data
    prompt1: .asciiz "Ingrese el primer número: "
    prompt2: .asciiz "Ingrese el segundo número: "
    prompt3: .asciiz "Ingrese el tercer número: "
    max_msg: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Solicitar el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Solicitar el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Solicitar el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Encontrar el número mayor
    move $t3, $t0
    bgt $t1, $t3, mayor1
    move $t3, $t1

mayor1:
    bgt $t2, $t3, done
    move $t3, $t2

done:
    # Mostrar el número mayor
    li $v0, 4
    la $a0, max_msg
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    # Salir del programa
    li $v0, 10
    syscall
