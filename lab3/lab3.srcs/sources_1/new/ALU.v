`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 16:50:34
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


module ALU(input [3:0] a, input [3:0] b, input [1:0] switch, output [6:0] D, output overflow, output[3:0] AN);
    wire[4:0] s; 
    FourBitAdder FBA(a, b, s);
    assign overflow = s[4];
    Decoder De(s[3:0], D);
    DispChoiceDecoder DCD(switch, AN);
endmodule
