module fsm(input clk, input rst, input left, input right, output reg[2:0] l_light, output reg[2:0] r_light);
    wire w_clk;
    clk_div new_clk(clk, rst, w_clk);
endmodule