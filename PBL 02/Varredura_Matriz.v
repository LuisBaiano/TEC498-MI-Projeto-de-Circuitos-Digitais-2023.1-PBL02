module Varredura_Matriz(clock_50MHz, chaves, linhas, colunas);
	
	input clock_50MHz;
	input [1:0] chaves;
	output [6:0] linhas;
	output [4:0] colunas;
	
	// Fios auxiliares para gerar os sinais de clock
	wire clock0, clock1;
	// Contadores para linhas e colunas
	wire [2:0] contador, quadros;
	// Fios auxiliares para negar os bits do contador
	wire not_a, not_b, not_c; 
	
	
	wire l0, l1, l2, l3, l4, l5, l6;
	wire [4:0] col;
	
	// Divide o clock_50MHz em três clocks cada
	Divisor_Clock(clock_50MHz, clock0, clock1);
	// Conta de 0 a 7, ciclando a cada 8 pulsos do clock1
	Contador(clock0, 2'b01, contador);
	
	// Os sinais A, B e C são os bits do contador
	// A = contador[2]
	// B = contador[1]
	// C = contador[0]
	
	// Negação dos bits do contador
	not(not_a, contador[2]);
	not(not_b, contador[1]);
	not(not_c, contador[0]);
	
	// Gera os sinais das linhas da matriz usando portas NAND
	
	nand(l6, not_a, not_b, not_c);		  			// L6 = A' + B' + C' 
	
	nand(l5, not_a, not_b, contador[0]);			// L5 = A' + B' + C
	
	nand(l4, not_a, contador[1], not_c);			// L4 = A' + B + C'
	
	nand(l3, not_a, contador[1], contador[0]);	// L3 = A' + B + C
	
	nand(l2, contador[2], not_b, not_c); 			// L2 = A + B' + C'
	
	nand(l1, contador[2], not_b, contador[0]);	// L1 = A + B' + C
	
	nand(l0, contador[2], contador[1], not_c);	// L0 = A + B + C'
	
	// Conta de 0 a 7, ciclando a cada vez que a chave é pressionada
	Contador(clock1, chaves, quadros);
	// O sinal quadros representa o valor do contador, 
	// e o sinal contador representa a linha atual da matriz
	// 000 = quadro 0
	// 001 = quadro 1
	// 010 = quadro 2
	// 011 = quadro 3
	// 100 = quadro 4
	// 101 = quadro 5
	// 110 = quadro 6
	// 111 = quadro 7
	
	// Multiplexa o valor do contador para gerar os sinais das colunas da matriz
	Multiplexador(quadros, contador, col);
	
	// Caso as duas chaves estejam em nível lógico baixo (0), desativa a matriz
	assign colunas = (chaves == 2'b00) ? 5'b0:col;
	assign linhas[0] = (chaves == 2'b00) ?  1'b1: l0;
	assign linhas[1] = (chaves == 2'b00) ?  1'b1: l1;
	assign linhas[2] = (chaves == 2'b00) ?  1'b1: l2;
	assign linhas[3] = (chaves == 2'b00) ?  1'b1: l3;
	assign linhas[4] = (chaves == 2'b00) ?  1'b1: l4;
	assign linhas[5] = (chaves == 2'b00) ?  1'b1: l5;
	assign linhas[6] = (chaves == 2'b00) ?  1'b1: l6;
	
endmodule
