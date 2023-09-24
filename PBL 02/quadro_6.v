module quadro_6(contador, colunas);
	input [2:0] contador;
	output [4:0] colunas;
	
	wire not_a, not_b, not_c;
	wire and0, and1, and2, and3;
	
	// A = contador[2]
	// B = contador[1]
	// C = contador[0]
	
	// Inverte os bits do contador para obter as variáveis A, B e C
	not(not_a, contador[2]);
	not(not_b, contador[1]);
	not(not_c, contador[0]);
	
	//Calcula a função lógica para as cinco colunas
	
	// C0 = A'B' + C'
	and(and0, not_a, not_b);
	or(colunas[0], and0, not_c);
	
	// C1 = B'C' + AC'
	and(and1, not_b, not_c);
	and(and2, contador[2], not_c);
	or(colunas[1], and1, and2);
	
	// C2 = A'B' + C'
	or(colunas[2], and0, not_c);
	
	// C3 = BC' + AC'
	and(and3, contador[1], not_c);
	or(colunas[3], and3, and2);
	
	// C4 = B' + C'
	or(colunas[4], not_b, not_c);
	
endmodule
