#----------------------------------------------------------------------------
#seriefibonacci.asm
#
#DDA 03.09.2020
#
#Aluno: Lucas Albino Martins, Matricula 12011ECP022
#
#DESC: programa calcula a serie fibonacci e imprime o valor
#
#------------------------------------------------------------------------------

.data
srt1: .asciiz "Digite o valor N valor da serie Fibonacci: "
str2: .asciiz "\n A "
str3: .asciiz " posição da Sequêcia Fibonacci é "
str4: .asciiz " "
.text

# t0 = a, t1 = b, t2 = FIB, t3 = i, t4 = n, t5 = aux
	li $t0,0 # t0 = a
	li $t1,1 #t1 = b
	li $t2,0 #t2 = FIB
	li $t3,0 #t3 = i
	la $a0,srt1
	li $v0,4
	 syscall

	li $v0,5
	 syscall

	move $t4,$v0
#	calcula o fribonacci pelo laço
FOR:
	 beq $t3, $t4, PRINT
	# t5 = aux
	li $t5,0
	# aux = aux + a 
	add $t5,$t5,$t0
	# aux = aux + b 
	add $t5,$t5,$t1 
	# FIB = aux
	move $t2,$t5 
	# a = b
	move $t0,$t1 
	# b = FIB
	move $t1,$t2 
	addi $t3,$t3,1
	 j FOR

  # carregando os endereços da frase do msg para syscall
PRINT:
	la $a0,str2 
	 # especifica o serviço de Exibição de String 
	li $v0,4
	 syscall
	# carregando os endereços da frase do msg para syscall
	move $a0,$t4 
	# especifica o serviço de Exibição de inteiro
	li $v0,1 
	syscall
	# carregando os endereços da frase do msg para syscall
	la $a0,str3 
	 # especifica o serviço de Exibição de String
	li $v0,4 
 	syscall
	la $a0,str4 
	# carregando os endereços da frase do msg para syscall
	li $v0,4 
	# especifica o serviço de Exibição de String 
 	syscall
 	# carregando os endereços da frase do msg para syscall
	move $a0,$t0 
	# especifica o serviço de Exibição de inteiros
	li $v0,1 
 	syscall
