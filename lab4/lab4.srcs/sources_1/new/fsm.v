module fsm(input clk, input reset, input left, input right, output LA, output LB, output LC, output RA, output RB, output RC);
    wire w_clk;
    reg[2:0] state, next_state;
    wire[5:0] w_lights;
    
    parameter S0 = 3'd0; parameter L1 = 3'd1; parameter L2 = 3'd2; parameter L3 = 3'd3;
    parameter R1 = 3'd4; parameter R2 = 3'd5; parameter R3 = 3'd6;
    
    clk_div(clk, reset, w_clk);
    
    always @(posedge w_clk, posedge reset)      // state register
        if(reset) state <= S0;
        else state <= next_state;
        
    always @(state)                             // next state logic
        case(state)
            S0: 
            begin
                if(left) next_state <= L1;
                else if(right) next_state <= R1;
                else next_state = S0;
            end
            L3: next_state = S0;
            R3: next_state = S0;
            default: next_state = state + 1;
        endcase
               
    assign LA = state == L1 || state == L2 || state == L3;     // output logic
    assign LB = state == L2 || state == L3;
    assign LC = state == L3;
    assign RA = state == R1 || state == R2 || state == R3;
    assign RB = state == R2 || state == R3;
    assign RC = state == R3;
endmodule