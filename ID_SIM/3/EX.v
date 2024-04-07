module EX (
    input  CLK, RST,
    input [31:0] Ins, Rdata1, Rdata2, Ed32,
    output reg [31:0] Result
);
`include "common_param.vh"
wire [5:0] op;
wire [4:0] shamt;
wire [5:0] funct;

assign op = Ins[31:26];
assign shamt = Ins[10:6];
assign funct = Ins[5:0];


function [31:0] MUX2;
    input [31:0] Ed32;
    input [31:0] Rdata2;
    input [5:0] op;
    //input [5:0] funct;

    if (op == R_FORM) begin
        MUX2 = Rdata2;
    end 
    else begin
        MUX2 = Ed32;
    end
endfunction



//演算部分
always @(posedge CLK) begin
    if(Rdata1 != 0 && MUX2(Ed32, Rdata2, op) != 0)begin
        //Result <= MUX2(Ed32, Rdata2, op) + Rdata1;
        case(op)
            R_FORM:begin
                case(funct)
                    ADD:Result <= MUX2(Ed32, Rdata2, op) + Rdata1;
                    SUB:Result <= MUX2(Ed32, Rdata2, op) - Rdata1;
                endcase
            end
            ADDI:Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

        endcase
    end
    else begin
        Result <= 32'b0;
    end
end



endmodule