`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2022 15:52:40
// Design Name: 
// Module Name: arithmetic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module arithmetic(input[31:0] A, input[31:0] B, input ALUOp, output[31:0] result);
    wire[31:0] b;
    assign b = ALUOp ? ~B : B; 
    assign result = A + b + ALUOp;
endmodule