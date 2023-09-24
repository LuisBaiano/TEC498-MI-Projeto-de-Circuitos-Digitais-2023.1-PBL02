module quadro_2(contador, colunas);
	input [2:0] contador;
	output [4:0] colunas;
	
	wire not_a, not_b, not_c;
	wire and0, and1;
	wire or0;
	
	// A = contador[2]
	// B = contador[1]
	// C = contador[0]
	
	// Inverte os bits do contador para obter as variáveis A, B e C
	not(not_a, contador[2]);
	not(not_b, contador[1]);
	not(not_c, contador[0]);
	
	//Calcula a função lógica para as cinco colunas
	
	// C0 = C’ + B’
	or(colunas[0], not_c, not_b);
	
	// C1 = B’C’
	and(colunas[1], not_b, not_c);

	// C2 = C’ + B’
	or(colunas[2], not_c, not_b);
	
	// C3 = B’C’
	and(colunas[3], not_b, not_c);
	
	// C4 = C’(A’+B’)+B’A’
	or(or0, not_a, not_b);
	and(and0, not_a, not_b);
	and(and1, not_c, or0);
	or(colunas[4], and1, and0);
	
endmodule
