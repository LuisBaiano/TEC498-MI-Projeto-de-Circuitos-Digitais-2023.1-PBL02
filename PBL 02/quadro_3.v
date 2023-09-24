module quadro_3(contador, colunas);
	input [2:0] contador;
	output [4:0] colunas;
	
	wire not_a, not_b, not_c;
	wire and0;
	wire or0;
	
	// A = contador[2]
	// B = contador[1]
	// C = contador[0]
	
	// Inverte os bits do contador para obter as variáveis A, B e C
	not(not_a, contador[2]);
	not(not_b, contador[1]);
	not(not_c, contador[0]);
	
	//Calcula a função lógica para as cinco colunas

	// C0 = C’+A’B
	and(and0, not_a, contador[1]);
	or(colunas[0], not_c, and0);
	
	// C1 = BC’
	and(colunas[1], contador[1], not_c);
	
	// C2 = C’+A’B
	or(colunas[2], not_c, and0);
	
	// C3 = A'.B.C'
	and(colunas[3], not_a, contador[1], not_c);
	
	// C4 = C’(A’+B)
	or(or0, not_a, contador[1]);
	and(colunas[4], not_c, or0);
	
endmodule
