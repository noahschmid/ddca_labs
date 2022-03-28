`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2022 17:44:50
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(input [3:0] a, input [3:0] b, output [4:0] s);

    wire c1, c2, c3; 
    FullAdder f_zero(a[0], b[0], 0, s[0], c1);
    FullAdder f_one(a[1], b[1], c1, s[1], c2);
    FullAdder f_two(a[2], b[2], c2, s[2], c3);
    FullAdder f_three(a[3], b[3], c3, s[3], s[4]);
    
endmodule
