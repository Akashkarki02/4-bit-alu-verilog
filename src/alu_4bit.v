`timescale 1ns/1ps

module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] OP,
    output reg [3:0] Y,
    output reg       carry,
    output reg       zero,
    output reg       overflow
);

    reg [4:0] temp;

    always @(*) begin

        // Default values
        Y        = 4'b0000;
        carry    = 1'b0;
        zero     = 1'b0;
        overflow = 1'b0;
        temp     = 5'b00000;

        case (OP)

            // 000: Addition
            3'b000: begin
                temp = {1'b0, A} + {1'b0, B};
                Y = temp[3:0];
                carry = temp[4];

                // Signed overflow
                overflow = (~(A[3] ^ B[3])) &
                           (Y[3] ^ A[3]);
            end

            // 001: Subtraction
            3'b001: begin
                Y = A - B;

                // 1 = no borrow, 0 = borrow
                carry = (A >= B);

                // Signed overflow
                overflow = (A[3] ^ B[3]) &
                           (Y[3] ^ A[3]);
            end

            // 010: AND
            3'b010: begin
                Y = A & B;
            end

            // 011: OR
            3'b011: begin
                Y = A | B;
            end

            // 100: XOR
            3'b100: begin
                Y = A ^ B;
            end

            // 101: NOT A
            3'b101: begin
                Y = ~A;
            end

            // 110: Pass A
            3'b110: begin
                Y = A;
            end

            // 111: Pass B
            3'b111: begin
                Y = B;
            end

        endcase

        // Zero flag
        if (Y == 4'b0000)
            zero = 1'b1;
        else
            zero = 1'b0;

    end

  end module 
