// Full Adder (1-bit)
module full_adder(
    input A, B, Cin,
    output SUM, CARRY
);
    assign SUM   = A ^ B ^ Cin;
    assign CARRY = (A & B) | (B & Cin) | (A & Cin);
endmodule


// N-bit Ripple Carry Adder
module ripple_carry_adder #(parameter N = 4) ( // default: 4-bit
    input  [N-1:0] A, B,
    input Cin,
    output [N-1:0] SUM,
    output Cout
);
    wire [N:0] C;  // carry chain

    assign C[0] = Cin;  // initial carry input

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : FA_CHAIN
            full_adder FA (
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i]),
                .SUM(SUM[i]),
                .CARRY(C[i+1])
            );
        end
    endgenerate

    assign Cout = C[N]; // final carry out
endmodule
