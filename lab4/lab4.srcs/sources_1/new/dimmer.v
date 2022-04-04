`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 06:46:32 PM
// Design Name: 
// Module Name: dimmer
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


module dimmer(input clk, input switch, input[7:0] dim, output reg light);
    reg[7:0] state;
    
    always @(posedge clk)
    begin
        if(state < 8'd255)     
            state <= state + 1;
        else
            state <= 8'd0;
    end
    
    always @(*)
    begin
        if(switch == 1) light <= state > dim ? 1 : 0;
        if(switch == 0) light <= 0;
    end
endmodule
