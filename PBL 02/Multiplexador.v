module Multiplexador (quadros, contador, colunas);
	input [2:0] quadros, contador;
	
	output [4:0] colunas;
	
	wire f0, f1, f2, f3, f4, f5, f6, f7; // fios com a identificacao de cada quadro (000, 001, ..., 111)
	wire [4:0] q0, q1, q2, q3, q4, q5, q6, q7; // saida das colunas de cada quadro
	wire not_a, not_b, not_c;
	
	// A = quadros[2]
	// B = quadros[1]
	// C = quadros[0]
	
	// negacao dos bits do contador
	not(not_a, quadros[2]);
	not(not_b, quadros[1]);
	not(not_c, quadros[0]);
	
	and(f0, not_a, not_b, not_c);						// f0 = A'.B'.C'
	and(f1, not_a, not_b, quadros[0]); 				// f1 = A'.B'.C 
	and(f2, not_a, quadros[1], not_c);				// f2 = A'.B.C'
	and(f3, not_a, quadros[1], quadros[0]); 		// f3 = A'.B.C
	and(f4, quadros[2], not_b, not_c);				// f4 = A.B'.C'
	and(f5, quadros[2], not_b, quadros[0]);		// f5 = A.B'.C 
	and(f6, quadros[2], quadros[1], not_c);		// f6 = A.B.C'
	and(f7, quadros[2], quadros[1], quadros[0]);	// f7 = A.B.C 
	
	// chamadas dos quadros
	quadro_0(contador, q0);
	quadro_1(contador, q1);
	quadro_2(contador, q2);
	quadro_3(contador, q3);
	quadro_4(contador, q4);
	quadro_5(contador, q5);
	quadro_6(contador, q6);
	quadro_7(contador, q7);
	
	// MULTIPLEXACAO
	
	wire [7:0] col0;
	
	and(col0[0], q0[0], f0);
	and(col0[1], q1[0], f1);
	and(col0[2], q2[0], f2);
	and(col0[3], q3[0], f3);
	and(col0[4], q4[0], f4);
	and(col0[5], q5[0], f5);
	and(col0[6], q6[0], f6);
	and(col0[7], q7[0], f7);
	
	or(colunas[0], col0[0], col0[1], col0[2], col0[3], col0[4], col0[5],col0[6], col0[7]);
	
	
	wire [7:0] col1;
	
	and(col1[0], q0[1], f0);
	and(col1[1], q1[1], f1);
	and(col1[2], q2[1], f2);
	and(col1[3], q3[1], f3);
	and(col1[4], q4[1], f4);
	and(col1[5], q5[1], f5);
	and(col1[6], q6[1], f6);
	and(col1[7], q7[1], f7);
	
	or(colunas[1], col1[0], col1[1], col1[2], col1[3], col1[4], col1[5],col1[6], col1[7]);
	
	
	wire [7:0] col2;
	
	and(col2[0], q0[2], f0);
	and(col2[1], q1[2], f1);
	and(col2[2], q2[2], f2);
	and(col2[3], q3[2], f3);
	and(col2[4], q4[2], f4);
	and(col2[5], q5[2], f5);
	and(col2[6], q6[2], f6);
	and(col2[7], q7[2], f7);
	
	or(colunas[2], col2[0], col2[1], col2[2], col2[3], col2[4], col2[5],col2[6], col2[7]);
	
	
	wire [7:0] col3;
	
	and(col3[0], q0[3], f0);
	and(col3[1], q1[3], f1);
	and(col3[2], q2[3], f2);
	and(col3[3], q3[3], f3);
	and(col3[4], q4[3], f4);
	and(col3[5], q5[3], f5);
	and(col3[6], q6[3], f6);
	and(col3[7], q7[3], f7);
	
	or(colunas[3], col3[0], col3[1], col3[2], col3[3], col3[4], col3[5],col3[6], col3[7]);
	
	
	wire [7:0] col4;
	
	and(col4[0], q0[4], f0);
	and(col4[1], q1[4], f1);
	and(col4[2], q2[4], f2);
	and(col4[3], q3[4], f3);
	and(col4[4], q4[4], f4);
	and(col4[5], q5[4], f5);
	and(col4[6], q6[4], f6);
	and(col4[7], q7[4], f7);
	
	or(colunas[4], col4[0], col4[1], col4[2], col4[3], col4[4], col4[5],col4[6], col4[7]);
	
endmodule  
