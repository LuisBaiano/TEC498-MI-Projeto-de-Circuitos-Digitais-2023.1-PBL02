// Módulo para implementar um contador de 3 bits usando flip-flops T
module Contador(clock, chaves, contador);

	input clock; // Entrada do sinal de clock
	input [1:0] chaves; // Entrada para as duas chaves CH0 e CH1
	
	output [2:0] contador; // Saída do contador com 3 bits
	
	// A = contador[0]
	// B = contador[1]
	// C = contador[2]
	
	// Definição dos sinais internos
	wire a, b, c, not_a, not_b, not_c;
	wire and0;
	wire clockf;
	
	// Seleção de sinal de clock para o flip-flop T
	assign clockf = (chaves == 2'b11)? 1'b0 : clock;
	
	// Configuração do primeiro flip-flop T com T = 1, Qn = 0 (reset)
	FF_T(clockf, 1'b1, chaves, a, not_a);
	// Configuração do segundo flip-flop T com T = Qa e Qna conectado na saída do primeiro flip-flop
	FF_T(clockf, a, chaves, b, not_b);
	// Conexão do sinal Qa e Qb na porta AND para gerar o sinal de entrada do terceiro flip-flop T
	and(and0, a, b);
	// Configuração do terceiro flip-flop T com T = Qa AND Qb e Qnc conectado na saída da porta AND
	FF_T(clockf, and0, chaves, c, not_c);
	
	// Seleção da saída do flip-flop T (Q ou Qn) baseado no valor da chave CH1
	assign contador[0] = (chaves[0] == 1'b1)?  ~a: a;
	assign contador[1] = (chaves[0] == 1'b1)?  ~b: b;
	assign contador[2] = (chaves[0] == 1'b1)?  ~c: c;
	
	
endmodule
