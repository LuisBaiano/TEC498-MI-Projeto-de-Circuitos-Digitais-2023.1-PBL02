// Modulo responsável por realizar a divisão do clock de 50 MHz
// Sua entrada é um pulso e sua saída é também um pulso mas com frequência menor do que o pulso de entrada
module Divisor_Clock (clock_in, clock0, clock1);
	
	input clock_in;
	output clock0, clock1;
	
	wire [49:0] out; // Fio para armazenar os estados dos flip-flops
	wire [23:0] ands; // Fio para armazenar os resultados das operações AND
   
	// Divisão do clock
	FF_T(clock_in, 1'b1, 2'b10, out[0], out[1]);
	FF_T(clock_in, out[0], 2'b10, out[2], out[3]);
	
	// Geração dos clocks divididos com sequencia de flip-flops
	assign ands[0] = out[0] & out[2];
	FF_T(clock_in, ands[0], 2'b10, out[4], out[5]); // clock 0
	
	assign ands[1] = ands[0] & out[4];
	FF_T(clock_in, ands[1], 2'b10, out[6], out[7]);
	
	assign ands[2] = ands[1] & out[6];
	FF_T(clock_in, ands[2], 2'b10, out[8], out[9]); // clock 1
	
	assign ands[3] = ands[2] & out[8];
	FF_T(clock_in, ands[3], 2'b10, out[10], out[11]);
	
	assign ands[4] = ands[3] & out[10];
	FF_T(clock_in, ands[4], 2'b10, out[12], out[13]);
	
	assign ands[5] = ands[4] & out[12];
	FF_T(clock_in, ands[5], 2'b10, out[14], out[15]);
	
	assign ands[6] = ands[5] & out[14];
	FF_T(clock_in, ands[6], 2'b10, out[16], out[17]);
	
	assign ands[7] = ands[6] & out[16];
	FF_T(clock_in, ands[7], 2'b10, out[18], out[19]);
	
	assign ands[8] = ands[7] & out[18];
	FF_T(clock_in, ands[8], 2'b10, out[20], out[21]);
	
	assign ands[9] = ands[8] & out[20];
	FF_T(clock_in, ands[9], 2'b10, out[22], out[23]);
	
	assign ands[10] = ands[9] & out[22];
	FF_T(clock_in, ands[10], 2'b10, out[24], out[25]);
	
	assign ands[11] = ands[10] & out[24];
	FF_T(clock_in, ands[11], 2'b10, out[26], out[27]);
	
	assign ands[12] = ands[11] & out[26];
	FF_T(clock_in, ands[12], 2'b10, out[28], out[29]);
	
	assign ands[13] = ands[12] & out[28];
	FF_T(clock_in, ands[13], 2'b10, out[30], out[31]);
	
	assign ands[14] = ands[13] & out[30];
	FF_T(clock_in, ands[14], 2'b10, out[32], out[33]);
	
	assign ands[15] = ands[14] & out[32];
	FF_T(clock_in, ands[15], 2'b10, out[34], out[35]);
	
	assign ands[16] = ands[15] & out[34];
	FF_T(clock_in, ands[16], 2'b10, out[36], out[37]);
	
	assign ands[17] = ands[16] & out[36];
	FF_T(clock_in, ands[17], 2'b10, out[38], out[39]);
	
	assign ands[18] = ands[17] & out[38];
	FF_T(clock_in, ands[18], 2'b10, out[40], out[41]);
	
	assign ands[19] = ands[18] & out[40];
	FF_T(clock_in, ands[19], 2'b10, out[42], out[43]);
	
	assign ands[20] = ands[19] & out[42];
	FF_T(clock_in, ands[20], 2'b10, out[44], out[45]);
	
	assign ands[21] = ands[20] & out[44];
	FF_T(clock_in, ands[21], 2'b10, out[46], out[47]);
	
	assign ands[22] = ands[21] & out[46];
	FF_T(clock_in, ands[22], 2'b10, out[48], out[49]); // clock 2
	
	// Atribuição dos clocks divididos às saídas
	assign clock0 = out[9]; // frequencia de 6,25 MHz
	assign clock1 = out[49]; // frequencia de 1,49 Hz
	
endmodule 