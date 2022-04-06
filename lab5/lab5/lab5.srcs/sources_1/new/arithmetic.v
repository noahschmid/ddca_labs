`timescale 1ns / 1ps

module arithmetic(input[31:0] A, input[31:0] B, input ALUOp, output[31:0] result);
    wire[31:0] b;
    assign b = ALUOp ? ~B : B;
    assign result = A + b + ALUOp;
endmodule