.data
msg1: .asciiz "Digite a primeira nota: "
msg2: .asciiz "Digite a segunda nota: "
msg3: .asciiz "Digite a terceira nota: "
msg4: .asciiz "Digite a quarta nota: "
msg5: .asciiz "\nMedia inteira: "
msg6: .asciiz "\nAPROVADO"
msg7: .asciiz "\nEXAME"
msg8: .asciiz "\nRETIDO"

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

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    add $t4, $t0, $t1
    add $t4, $t4, $t2
    add $t4, $t4, $t3

    li $t5, 4
    div $t4, $t5
    mflo $t6

    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    bge $t4, 24, aprovado
    bge $t4, 12, exame
    j retido

aprovado:
    li $v0, 4
    la $a0, msg6
    syscall
    j fim

exame:
    li $v0, 4
    la $a0, msg7
    syscall
    j fim

retido:
    li $v0, 4
    la $a0, msg8
    syscall

fim:
    li $v0, 10
    syscall
    