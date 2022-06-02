#----------------------------------------------------------------------------
#media.asm
#
#DDA 03.09.2020
#
#Aluno: Lucas Albino Martins, Matricula 12011ECP022
#
#DESC: programa que soma 10 valores adicionados em um vetor
#      e imprimir a m�dia
#
#------------------------------------------------------------------------------

.data
array: .word  1,  2,  3,  4,  5, 6, 7, 8, 9, 15
nelem: .word 10
soma: .word 0
media: .word 0
imprimimedia: .asciiz "\nO valor da m�dia eh: " 

.text
.globl main
main:

#  loop para calcular a soma dos valores

la $t0, array # endere�o inicial do array
li $t1, 0 # loop do indice, i=0
lw $t2, nelem
li $t3, 0 # inicializa a soma=0

loop:
lw $t4, ($t0) # pega o valor do array[i]
add $t3, $t3, $t4 # soma = soma + array[i]
add $t1, $t1, 1 # i = i+1
add $t0, $t0, 4 # atualiza o endere�o do array
blt $t1, $t2, loop # condi��o de i < nelem, continua loop
sw $t3, soma # salva a soma

# calculando a m�dia.

div $t5, $t3, $t2 # media = soma / nelem
sw $t5, media

# imprimindo a m�dia
	li	 $v0, 4
	la	 $a0, imprimimedia
	syscall 

	li	 $v0, 1
	addi	 $a0,$t5,0
	syscall

# finaliza o programa.
	li $v0, 10
	syscall

