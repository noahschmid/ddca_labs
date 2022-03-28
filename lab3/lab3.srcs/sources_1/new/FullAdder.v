`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2022 17:31:13
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(input a, input b, input ci, output s, output co);

    //For s
    xor s_res(s, a, b, ci);
    
    
    //For co
    wire a1, a2, a3;
    and and_inter1(a1, a, b);
    and and_inter2(a2, a, ci);
    and and_inter3(a3, b, ci);
    or co_res(co, a1, a2, a3);
    

endmodule
