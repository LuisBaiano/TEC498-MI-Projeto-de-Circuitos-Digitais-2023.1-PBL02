module quadro_7(contador, colunas);
	input [2:0] contador;
	output [4:0] colunas;
	
	wire not_a, not_b, not_c;
	wire and0, and1, and2;
	
	// A = contador[2]
	// B = contador[1]
	// C = contador[0]
	
	// Inverte os bits do contador para obter as variáveis A, B e C
	not(not_a, contador[2]);
	not(not_b, contador[1]);
	not(not_c, contador[0]);
	
	//Calcula a função lógica para as cinco colunas
	
	// C0 = C'
	assign colunas[0] = not_c;
	
	// C1 = B.C' + A.C'
	and(and0, contador[1], not_c);
	and(and1, contador[2], not_c);
	or(colunas[1], and0, and1);
	
	// C2 = C'
	assign colunas[2] = not_c;
	
	// C3 = C'
	assign colunas[3] = not_c;
	
	// C4 = C'+ A'B
	and(and2, not_a, contador[1]);
	or(colunas[4], not_c, and2);
	
endmodule
