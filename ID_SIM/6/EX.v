module EX (
    input  CLK, RST,
    input [31:0] Ins, Rdata1, Rdata2, Ed32, nextPC,
    output [31:0] Result,
    output [31:0] newPC
);
`include "common_param.vh"
wire [5:0] op;
wire [4:0] shamt;
wire [5:0] funct;
wire [25:0] jadr;

assign op = Ins[31:26];
assign shamt = Ins[10:6];
assign funct = Ins[5:0];
assign jadr = Ins[25:0];

reg[31:0] hi, lo;
reg[63:0] re_64;

function [31:0] ALU;
    input[31:0]Rdata1;
    input[31:0]Rdata2;
    input[31:0]Ed32;
    input[5:0]op;
    input[5:0]funct;
    input[4:0] shamt;

    case(op)
        R_FORM:begin
            case(funct)
                ADD: ALU = Rdata1 + Rdata2;

                SUB: ALU = Rdata1 - Rdata2;

                // MULT:begin
                //     re_64 <= Rdata2 * Rdata1;//64bit
                //     hi <= re_64[63:32]; //32bit
                //     lo <= re_64[31:0];  //32bit
                // end

                // DIV:begin
                //     hi <= Rdata2 % Rdata1;
                //     lo <= Rdata2 / Rdata1;
                // end 

                AND: ALU = Rdata1 & Rdata2;

                OR: ALU = Rdata1 | Rdata2;

                NOR: ALU = !(Rdata1 | Rdata2);

                XOR: ALU = Rdata1 ^ Rdata2;

                SLL: ALU = Rdata1 << shamt;

                SRL: ALU = Rdata1 >> shamt;

                SLLV: ALU = Rdata2 << Rdata1;

                SRLV: ALU = Rdata2 >> Rdata1;

                SRA: ALU = $signed(Rdata2) >>> shamt;

                SLT:begin
                    if(Rdata1 < Rdata2)begin
                        ALU = 1;
                    end
                    else begin
                        ALU = 0;
                    end
                end

                SLTU:begin
                    if(Rdata1 < Rdata2)begin
                        ALU = 1;
                    end
                    else begin
                        ALU = 0;
                    end
                end

                JR: ALU = Rdata1;

                JALR: ALU = Rdata1;
            endcase
        end
        //I形式
        LW: ALU = Ed32 + Rdata1;//データメモリのアドレス計算

        SW: ALU = Ed32 + Rdata1;

        ADDI: ALU = Ed32 + Rdata1;

        ADDIU: ALU = Ed32 + Rdata1;

        SLTI:begin
            if(Rdata1 < Ed32)begin
                ALU = 1;
            end
            else begin
                ALU = 0;
            end
        end

        SLTIU:begin
            if(Rdata1 < Ed32)begin
                ALU = 1;
            end
            else begin
                ALU = 0;
            end
        end

        BEQ:begin
            if(Rdata1 == Rdata2)begin
                ALU = 1;
            end
            else begin
                ALU = 0;
            end
        end

        BNE:begin
            if(Rdata1 != Rdata2)begin
                ALU = 1;
            end
            else begin
                ALU = 0;
            end
        end
       //J形式
        J:ALU = ALU;

        JAL: ALU = ALU;

        //default: ALU = 32'b0;
    endcase
endfunction

function [31:0] Address;//プログラムカウンタにわたすアドレス計算
    input[31:0]nextPC;
    input[25:0]jadr;
    input[31:0]Ed32;
    input[5:0]op;
    input[5:0]funct;

    if(op == R_FORM)begin
        if(funct == JR || funct == JALR)begin
            Address = ALU(Rdata1, Rdata2, Ed32, op, funct, shamt);//Rdata1が選択される
        end
        else begin
            Address = nextPC; 
        end
    end
    else if(op == BEQ || op == BNE)begin
        if(ALU(Rdata1, Rdata2, Ed32, op, funct, shamt) == 1)begin
            Address = nextPC + (Ed32 << 2);
        end
        else begin
            Address = nextPC;
        end    
    end
    else if(op == J || op == JAL)begin
        Address = {nextPC[31:28] , jadr << 2};//PC[31-28]と4*addressの連接
        //Address = {nextPC[31:28], 28'b0}; 
    end
    else begin
        Address = 0;
    end
endfunction

// initial begin
//     newPC = 0;
// end

assign Result = ALU(Rdata1, Rdata2, Ed32, op, funct, shamt);
assign newPC = Address(nextPC, jadr, Ed32, op, funct);


endmodule