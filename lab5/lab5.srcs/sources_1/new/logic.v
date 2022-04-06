`timescale 1ns / 1ps

module logic(input[31:0] A, input[31:0] B, input[3:0] ALUOp, output reg[31:0] result);
    wire[31:0] and_res, or_res, xor_res, nor_res;
    
    assign and_res = A&B;
    assign or_res = A|B;
    assign xor_res = A^B;
    assign nor_res = ~(A|B);
    
    always @(*)
    begin
        case(ALUOp)
            4'b0100: result = and_res;
            4'b0101: result = or_res;
            4'b0110: result = xor_res;
            4'b0111: result = nor_res;
            default: result = 32'd0;
        endcase
    end
endmodule
