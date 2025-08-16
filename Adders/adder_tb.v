`timescale 1ns/1ps

module adder_tb;
    reg A, B, Cin;
    wire SUM_half, CARRY_half;
    wire SUM_full, CARRY_full;

    // Instantiate Half Adder
    half_adder HA (.A(A), .B(B), .SUM(SUM_half), .CARRY(CARRY_half));

    // Instantiate Full Adder
    full_adder FA (.A(A), .B(B), .Cin(Cin), .SUM(SUM_full), .CARRY(CARRY_full));

    initial begin
        $display("A B Cin | HA_SUM HA_CARRY | FA_SUM FA_CARRY");
        $monitor("%b %b %b   |   %b       %b     |   %b      %b", 
                 A, B, Cin, SUM_half, CARRY_half, SUM_full, CARRY_full);

        // Apply all input combinations
        A=0; B=0; Cin=0; #10;
        A=0; B=1; Cin=0; #10;
        A=1; B=0; Cin=0; #10;
        A=1; B=1; Cin=0; #10;
        A=0; B=0; Cin=1; #10;
        A=0; B=1; Cin=1; #10;
        A=1; B=0; Cin=1; #10;
        A=1; B=1; Cin=1; #10;

        $stop;
    end
endmodule
