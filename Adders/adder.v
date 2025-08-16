// Half Adder
module half_adder(
    input A, B,
    output SUM, CARRY
);
    assign SUM = A ^ B;     // XOR
    assign CARRY = A & B;   // AND
endmodule


// Full Adder
module full_adder(
    input A, B, Cin,
    output SUM, CARRY
);
    assign SUM   = A ^ B ^ Cin;                  // XOR chain
    assign CARRY = (A & B) | (B & Cin) | (A & Cin); // Majority logic
endmodule
