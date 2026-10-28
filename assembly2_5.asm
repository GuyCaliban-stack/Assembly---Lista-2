.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero: "
msg3: .asciiz "\nSoma dos impares: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    ble $t0, $t1, ordem_correta

    move $t2, $t0
    move $t0, $t1
    move $t1, $t2

ordem_correta:
    move $t2, $t0
    li $t3, 0

loop:
    bgt $t2, $t1, resultado

    andi $t4, $t2, 1
    beqz $t4, proximo

    add $t3, $t3, $t2

proximo:
    addi $t2, $t2, 1
    j loop

resultado:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall