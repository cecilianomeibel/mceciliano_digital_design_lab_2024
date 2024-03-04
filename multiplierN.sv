module multiplierN
    #(parameter N = 4) (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [2*N-1:0] result
);

    logic [2*N-1:0] acumulador;            
    logic [N-1:0] shift_multiplicando;
                                                        
    always_comb begin
        acumulador = '0;
        shift_multiplicando = a;
        for (int i = 0; i < N; i++) begin
            if (b[i] == 1) begin
                for (int j = 0; j < N; j++) begin
                    acumulador[2*N-1-j-i] = acumulador[2*N-1-j-i] ^ shift_multiplicando[N-1-j];
                end
            end
            shift_multiplicando = shift_multiplicando << 1;
        end
        result = acumulador;
    end

endmodule
