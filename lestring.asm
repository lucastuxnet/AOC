#----------------------------------------------------------------------------
#lestring.asm
#
#DDA 03.09.2020
#
#Aluno: Lucas Albino Martins, Matricula 12011ECP022
#
#DESC: programa lê a string encontrando o ponto inicial e final
#
#------------------------------------------------------------------------------
.data
vogais: .asciiz "aeiou" #reserva espaço para uma cadeia de caracteres
char:	.byte 'u'

.text
.globl main
main:
	lb	$t0, char #armazenou o byte char no registrador t0
	li	$t1, 0    #carrega a constante 0 em t1
	
	la	$s0, vogais  #aponta para vogais[0]
	lb	$s1, ($s0)   #armazena vogais [0] em s1
	
buscaloop:
	beq	$s1, $zero, fimbusca #verifica pelo caractere final da string
	
	seq	$t1, $s1, $t0 #compara caracteres
	bgt	$t1, $zero, fimbusca #verofica se t1 é maior que zero
	
	addi	$s0,$s0,1 #incrementa o índice do vetor
	lb	$s1, ($s0)  #ler vogais[++s0]
	
	j	buscaloop
fimbusca:
	li	$v0, 10
	syscall