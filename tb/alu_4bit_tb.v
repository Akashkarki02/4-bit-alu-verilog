`timescale 1ns/1ps

module alu_4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] OP;

    wire [3:0] Y;
    wire carry;
    wire zero;
    wire overflow;

    alu_4bit uut (
        .A(A),
        .B(B),
        .OP(OP),
        .Y(Y),
        .carry(carry),
        .zero(zero),
        .overflow(overflow)
    );

    initial begin

        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, alu_4bit_tb);

        $display("===== 4-BIT ALU TEST =====");

        // ADD: 5 + 3 = 8
        A = 4'b0101;
        B = 4'b0011;
        OP = 3'b000;
        #10;
        $display("ADD : A=%b B=%b Y=%b", A, B, Y);

        // SUB: 7 - 3 = 4
        A = 4'b0111;
        B = 4'b0011;
        OP = 3'b001;
        #10;
        $display("SUB : A=%b B=%b Y=%b", A, B, Y);

        // AND
        A = 4'b1010;
        B = 4'b1100;
        OP = 3'b010;
        #10;
        $display("AND : A=%b B=%b Y=%b", A, B, Y);

        // OR
        A = 4'b1010;
        B = 4'b0101;
        OP = 3'b011;
        #10;
        $display("OR  : A=%b B=%b Y=%b", A, B, Y);

        // XOR
        A = 4'b1010;
        B = 4'b1100;
        OP = 3'b100;
        #10;
        $display("XOR : A=%b B=%b Y=%b", A, B, Y);

        // NOT A
        A = 4'b1010;
        OP = 3'b101;
        #10;
        $display("NOT : A=%b Y=%b", A, Y);

        // PASS A
        A = 4'b0110;
        OP = 3'b110;
        #10;
        $display("PASS A : Y=%b", Y);

        // PASS B
        B = 4'b1111;
        OP = 3'b111;
        #10;
        $display("PASS B : Y=%b", Y);

        $display("===== TEST COMPLETE =====");

        $finish;

    end

endmodule
