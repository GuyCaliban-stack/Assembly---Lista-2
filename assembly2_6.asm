.data
msg1: .asciiz "Digite um numero positivo: "
msg2: .asciiz "\nMaior valor: "
msg3: .asciiz "\nMenor valor: "

.text
.globl main
main:
    li $t0, 0

ler:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    blez $t1, ler

    beqz $t0, primeiro

    bgt $t1, $t2, atualizar_maior
    blt $t1, $t3, atualizar_menor
    j contar

primeiro:
    move $t2, $t1
    move $t3, $t1
    j contar

atualizar_maior:
    move $t2, $t1
    blt $t1, $t3, atualizar_menor
    j contar

atualizar_menor:
    move $t3, $t1

contar:
    addi $t0, $t0, 1
    blt $t0, 10, ler

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall    
    
    