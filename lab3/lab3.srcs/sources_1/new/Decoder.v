`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 16:45:23
// Design Name: 
// Module Name: Decoder
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


module Decoder(input[3:0] s, output reg [6:0] D);
    always @(*)
      case(s)
        4'd0: D = 7'b000_0001;
        4'd1: D = 7'b100_1111;
        4'd2: D = 7'b001_0010;
        4'd3: D = 7'b000_0110;
        4'd4: D = 7'b100_1100;
        4'd5: D = 7'b010_0100;
        4'd6: D = 7'b010_0000;
        4'd7: D = 7'b000_1111;
        4'd8: D = 7'b000_0000;
        4'd9: D = 7'b000_0100;
        4'd10: D = 7'b000_1000;
        4'd11: D = 7'b110_0000;
        4'd12: D = 7'b011_0001;
        4'd13: D = 7'b100_0010;
        4'd14: D = 7'b011_0000;
        4'd15: D = 7'b011_1000;
        default: D = 7'b111_1111;
      endcase

endmodule
