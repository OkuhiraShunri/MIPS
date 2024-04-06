module EX (
    input  CLK, RST,
    input [31:0] Ins, Rdata1, Rdata2, Ed32,
    output [31:0] Result
);
`include "common_param.vh"
wire [5:0] op;
assign op = Ins[31:26];
function [31:0] MUX2;
    input [31:0] Ed32;
    input [31:0] Rdata2;
    input [5:0] op;
    input [5:0] funct;

    if (op == R_FORM) begin
        MUX2 = Radr2;
    end 
    else begin
        MUX2 = Ed32;
    end
endfunction

endmodule