module fsm(input clk, input reset, input left, input right, output LA, output LB, output LC, output RA, output RB, output RC);
    wire w_clk;
    reg[3:0] state, next_state;
    wire[5:0] w_lights;
    
    reg[7:0] iA, iB, iC; // intensity of the different lights
    
    wire sLA, sLB, sLC, sRA, sRB, sRC;
    
    parameter S0 = 4'd0;
    parameter L1 = 4'd1; parameter L2 = 4'd2; parameter L3 = 4'd3; parameter L4 = 4'd4; parameter L5 = 4'd5; parameter L6 = 4'd6; parameter L7 = 4'd7;
    parameter R1 = 4'd8; parameter R2 = 4'd9; parameter R3 = 4'd10; parameter R4 = 4'd11; parameter R5 = 4'd12; parameter R6 = 4'd13; parameter R7 = 4'd14;
    
    clk_div(clk, reset, w_clk);
    
    // STATE REGISTER
    always @(posedge w_clk, posedge reset)      
        if(reset) state <= S0;
        else state <= next_state;
        
    // NEXT STATE LOGIC    
    always @(state)                            
        case(state)
            S0: 
            begin
                if(left) next_state <= L1;
                else if(right)next_state <= R1;
                else next_state <= S0;
            end
            
            L7: next_state <= S0;
            R7: next_state <= S0;
            default: next_state = state + 1;
        endcase
        
        
    /*
    S0
    R1 .
    R2 x
    R3 x .
    R4 x x
    R5 x x .
    R6 x x x
    S1 . . .
    */
    always @(*)
    begin
        if(state == L1 || state == R1 || state == L7 || state == R7) iA = 8'd240;
        else iA = 8'd0;
        
        if(state == L3 || state == R3 || state == L7 || state == R7) iB = 8'd240;
        else iB = 8'd0;
        
        if(state == L5 || state == R5 || state == L7 || state == R7) iC = 8'd240;
        else iC = 8'd0;
    end
    
    // OUTPUT LOGIC
    assign sLA = state == L1 || state == L2 || state == L3 || state == L4 || state == L5 || state == L6 || state == L7;  
    assign sLB = state == L3 || state == L4 || state == L5 || state == L6 || state == L7;
    assign sLC = state == L5 || state == L6 || state == L7;
    assign sRA = state == R1 || state == R2 || state == R3 || state == R4 || state == R5 || state == R6 || state == R7;
    assign sRB = state == R3 || state == R4 || state == R5 || state == R6 || state == R7;
    assign sRC = state == R5 || state == R6 || state == R7;
    
    dimmer dla(clk, sLA, iA, LA);
    dimmer dlb(clk, sLB, iB, LB);
    dimmer dlc(clk, sLC, iC, LC);
    dimmer dra(clk, sRA, iA, RA);
    dimmer drb(clk, sRB, iB, RB);
    dimmer drc(clk, sRC, iC, RC);
endmodule