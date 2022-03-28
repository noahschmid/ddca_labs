`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 07:49:53 PM
// Design Name: 
// Module Name: DispChoiceDecoder
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


module DispChoiceDecoder(input[1:0] switch, output reg[3:0] display);
    always @(*)
      case(switch)
        2'b00: display = 4'b1110;
        2'b01: display = 4'b1101;
        2'b10: display = 4'b1011;
        2'b11: display = 4'b0111;
        default: display = 4'b1111;
      endcase
endmodule
