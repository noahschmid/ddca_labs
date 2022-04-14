`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2022 15:52:40
// Design Name: 
// Module Name: ALU
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

module ALU(input[31:0] A, input[31:0] B, input[3:0] ALUOp, output[31:0] result, output zero);
    // ARITHMETIC PART
    wire[31:0] ar_out;
    arithmetic ar(A, B, ALUOp[1], ar_out);
    
    wire[31:0] ext_slt, alu_res;
    assign ext_slt = {31'd0, ar_out[31]};
    assign alu_res = ALUOp[3] ? ext_slt : ar_out;
    
    // LOGIC PART
    wire[31:0] log_out;
    logic log(A, B, ALUOp, log_out);
    
    assign result = ALUOp[2] ? alu_res : log_out;
    assign zero = ~(|result);    
endmodule

