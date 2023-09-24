module quadro_0(contador, colunas);
	// Entrada do contador de 3 bits que conta de 0 a 7
	input [2:0] contador;
	// Saída de 5 bits que controlam as colunas da matriz
	output [4:0] colunas;
	
	// Fios auxiliares para negar os bits do contador
	wire not_a, not_b, not_c;
	// Fios auxiliares para as portas lógicas
	wire and0, or0;

	// Negação dos bits do contador
	not(not_a, contador[2]);
	not(not_b, contador[1]);
	not(not_c, contador[0]);

	// Porta AND que calcula C0 = C' + AB'
	// Se C' = 1 ou AB' = 1, então C0 = 1, caso contrário, C0 = 0
	and (and0, contador[2], not_b);
	or(colunas[0], not_c, and0);

	// Porta OR que calcula C1 = C’(A'+B')
	// Se C' = 1 e A' + B' = 1, então C1 = 1, caso contrário, C1 = 0
	or(or0, not_a, not_b);
	and(colunas[1], not_c, or0);

	// Porta OR que calcula C2 = C' + AB'
	// Se C' = 1 ou AB' = 1, então C2 = 1, caso contrário, C2 = 0
	or(colunas[2], not_c, and0);

	// Porta AND que calcula C3 = C’(A’+B’)
	// Se C' = 1 e A' + B' = 1, então C3 = 1, caso contrário, C3 = 0
	and(colunas[3], not_c, or0);

	// Porta OR que calcula C4 = B' + C'
	// Se B' = 1 ou C' = 1, então C4 = 1, caso contrário, C4 = 0
	or(colunas[4], not_b, not_c);	
endmodule
