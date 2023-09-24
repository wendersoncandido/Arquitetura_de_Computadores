.global _start
_start:
	
//Inicializar os registradores

MOV R0, #0 //Iniciando o primeiro numero da sequencia  F(n)
MOV R1, #1 //Iniciando o segundo numero da sequecia F(n-1)
MOV R2, #0x000002ac  //Endereço de memoria onde armazenaremos os valores
MOV R3, #0x000002b0 //Endereço de memoria para a posição 0x2a8
MOV R4, #10 //Quantidade de numeros da sequencia a calcular (pode ser modificado para quantas vezes quiser calcular)


STR R0, [R2] // Armazenar o valor atual namemoria (posição R3)
STR R1, [R3] // Armazenar o valor atual namemoria (posição R3)

//Agora vamos começar os calculos da Fibonacci
Calcular_Fibonacci:
ADD R5,R0,R1 
STR R5, [R3,#4]!  //Atualizar Endereços de memoria para a proxima posição (avançando 4 bytes)
//calcular o proximo valor da Fibonacci
MOV R0,R1 // F(n)= F(n-1)
MOV R1,R5 // F(n-1)= F(n)
SUB R4,R4,#1
CMP R4,#0
//SUBS R4,R4,#1		//Decrementar o contador de interações
BNE Calcular_Fibonacci 		//Verificar se ainda ha calculo a ser feito

//Sair do programa
//MOV R7, #1 //Codigo de saida do programa
//SWI 0      //Essa é a instrução que chama a interrupção do software para encerrar o programa


