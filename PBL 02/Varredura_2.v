module Varredura_2(clock_50MHz, chaves, linhas, colunas);

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

    // Verifica se as duas chaves estão em nível lógico baixo (0)
    wire desativar = (chaves[1] == 0) && (chaves[0] == 0);

	 /
	 assign colunas[0] = (desativar == 1'b1) ? 1'b1 : 1'b0;
	 assign colunas[1] = (desativar == 1'b1) ? 1'b1 : 1'b0;
	 assign colunas[2] = (desativar == 1'b1) ? 1'b1 : 1'b0;
	 assign colunas[3] = (desativar == 1'b1) ? 1'b1 : 1'b0;
	 assign colunas[4] = (desativar == 1'b1) ? 1'b1 : 1'b0;
	 
    // Divide o clock_50MHz em três clocks cada
    Divisor_Clock(clock_50MHz, clock0, clock1);
    // Conta de 0 a 7, ciclando a cada 8 pulsos do clock1
    Contador(clock1, 2'b01, contador);

    // Os sinais A, B e C são os bits do contador
    // A = contador[2]
    // B = contador[1]
    // C = contador[0]

    // Negação dos bits do contador
    not(not_a, contador[2]);
    not(not_b, contador[1]);
    not(not_c, contador[0]);

    // Gera os sinais das linhas da matriz usando portas NAND
    nand(linhas[6], not_a, not_b, not_c, desativar);           // L6 = A' + B' + C' + desativar
    nand(linhas[5], not_a, not_b, contador[0], desativar);     // L5 = A' + B' + C + desativar
    nand(linhas[4], not_a, contador[1], not_c, desativar);     // L4 = A' + B + C' + desativar
    nand(linhas[3], not_a, contador[1], contador[0], desativar);// L3 = A' + B + C + desativar
    nand(linhas[2], contador[2], not_b, not_c, desativar);      // L2 = A + B' + C' + desativar
    nand(linhas[1], contador[2], not_b, contador[0], desativar);// L1 = A + B' + C + desativar
    nand(linhas[0], contador[2], contador[1], not_c, desativar);	// L0 = A + B + C' + desativar
	 
	 // Conta de 0 a 7, ciclando a cada vez que a chave é pressionada
	 Contador(clock1, chaves, quadros);
 
endmodule
 