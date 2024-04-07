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

reg[31:0] hi, lo;
reg[63:0] re_64;

//演算部分
always @(posedge CLK) begin
    if(Rdata1 != 0 && MUX2(Ed32, Rdata2, op) != 0)begin
        //Result <= MUX2(Ed32, Rdata2, op) + Rdata1;
        case(op)
            R_FORM:begin
                case(funct)
                    ADD: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

                    SUB: Result <= MUX2(Ed32, Rdata2, op) - Rdata1;

                    MULT:begin
                        re_64 <= MUX2(Ed32, Rdata2, op) * Rdata1;
                        hi <= re_64[63:32];
                        lo <= re_64[31:0];
                    end

                    DIV:begin
                        hi <= MUX2(Ed32, Rdata2, op) % Rdata1;
                        lo <= MUX2(Ed32, Rdata2, op) / Rdata1;
                    end 

                    AND: Result <= MUX2(Ed32, Rdata2, op) & Rdata1;

                    OR: Result <= MUX2(Ed32, Rdata2, op) | Rdata1;

                    NOR: Result <= !(MUX2(Ed32, Rdata2, op) | Rdata1);

                    XOR: Result <= MUX2(Ed32, Rdata2, op) ^ Rdata1;

                    SLL: Result <= Rdata1 << shamt;

                    SRL: Result <= Rdata1 >> shamt;
                    
                endcase
            end

            ADDI: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

            ADDIU: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

            SLTI:begin
                if(MUX2(Ed32, Rdata2, op) > Rdata1)begin
                    Result <= 1;
                end
                else begin
                    Result <= 0;
                end
            end

            SLTIU:begin
                if(MUX2(Ed32, Rdata2, op) > Rdata1)begin
                    Result <= 1;
                end
                else begin
                    Result <= 0;
                end
            end


        endcase
    end
    else begin
        Result <= 32'b0;
    end
end



endmodule