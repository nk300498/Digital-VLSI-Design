`timescale 1ns/1ps

module rca_tb;
    reg  [3:0] A, B;
    reg  Cin;
    wire [3:0] SUM;
    wire Cout;

    // Instantiate 4-bit RCA
    ripple_carry_adder #(4) RCA (
        .A(A), .B(B), .Cin(Cin),
        .SUM(SUM), .Cout(Cout)
    );

    initial begin
        $display("   A    B  Cin |  SUM  Cout");
        $monitor("%b %b  %b   |  %b   %b", A, B, Cin, SUM, Cout);

        // Test cases
        A=4'b0000; B=4'b0000; Cin=0; #10;
        A=4'b0001; B=4'b0010; Cin=0; #10;
        A=4'b0101; B=4'b0011; Cin=0; #10;
        A=4'b1111; B=4'b0001; Cin=0; #10;
        A=4'b1010; B=4'b1010; Cin=1; #10;
        A=4'b1111; B=4'b1111; Cin=1; #10;

        $stop;
    end
endmodule
