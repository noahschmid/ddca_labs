module fsm(input clk, input rst, output[2:0] left, output[2:0] right);
    wire w_clk;
    clk_div new_clk(clk, rst, w_clk);
endmodule