// Modulo que descreve elemento biestavel basico (flip flop T)

module FF_T(clock, t, chaves, q, not_q);
	input clock, t;
	input [1:0] chaves;
	
	output reg q;
	output not_q;
	
	wire reset;
	// Verifica se as chaves CH0 e CH1 estão em nível baixo para realizar o reset
	assign reset = (chaves == 2'b00)? 1'b1 : 1'b0; 
	
	// Sempre que ocorre a borda de subida do sinal de clock ou um reset é acionado, é realizado um teste condicional
	always @(posedge clock, posedge reset) begin
		if (reset) begin // caso for realizado o reset, a saida q recebe nivel logico baixo
			q <= 1'b0;
		end
		
		else if (t) begin // Quando a entrada T é acionada, o estado atual da saída Q é alternado
			q <= !q;
		end
	end
	
	assign not_q = (reset)? 1'b0 : !q; // A saída NOT_Q é a negação da saída Q, exceto quando é acionado um reset

endmodule
