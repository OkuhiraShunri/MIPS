`default_nettype none
module EX (
    input wire CLK, RST,
    input wire [31:0] Ins, Rdata1, Rdata2, Ed32, nextPC,
    output wire [31:0] Result,
    output wire [31:0] newPC
);

// initial begin
//     nextPC <= 0;
// end
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

initial begin
    hi <= 0;
    lo <= 0;
end
wire [63:0] re_64;
assign re_64 = Rdata1 * Rdata2;

always @(posedge CLK) begin
    if(funct == MULT)begin
        lo = re_64[31:0]; //32bit
        hi = re_64[63:32]; //32bit
    end
    else if(funct == DIV)begin
        hi = Rdata2 % Rdata1;
        lo = Rdata2 / Rdata1;
    end
end



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
                ADD: ALU = $signed(Rdata1) + $signed(Rdata2);

                ADDU: ALU = $unsigned(Rdata1) + $unsigned(Rdata2);

                SUB: ALU = Rdata1 - Rdata2;

                SUBU: ALU = $unsigned(Rdata1) - $unsigned(Rdata2);

                MULT: ALU = ALU;

                DIV: ALU = ALU;

                AND: ALU = Rdata1 & Rdata2;

                OR: ALU = Rdata1 | Rdata2;

                NOR: ALU = !(Rdata1 | Rdata2);

                XOR: ALU = Rdata1 ^ Rdata2;

                SLL: ALU = Rdata1 << shamt;

                SRL: ALU = Rdata1 >> shamt;

                SLLV: ALU = Rdata2 << Rdata1;

                SRLV: ALU = Rdata2 >> Rdata1;

                SRA: ALU = $signed(Rdata2) >>> shamt;

                SRAV: ALU = $signed(Rdata2) >>> Rdata1;

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

        ANDI: ALU = Ed32 & Rdata1;

        ORI: ALU = Ed32 | Rdata1;

        XORI: ALU = Ed32 ^ Rdata1; 

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


// reg [31:0] r_JR;
// reg r_F = 0;
// always @(posedge CLK) begin
//     if(op == JR)begin
//         r_JR <= Rdata1;
//         r_F <= 1;
//     end
//     else begin
//         r_F <= 0;
//     end
// end




function [31:0] Address;//プログラムカウンタにわたすアドレス計さん
    input[31:0]Rdata1;
    input[31:0]Rdata2;
    input[31:0]nextPC;
    input[25:0]jadr;
    input[31:0]Ed32;
    input[5:0]op;
    input[5:0]funct;
    input[4:0]shamt;


    if(op == R_FORM)begin//R形式すべて
        if(funct == JR || funct == JALR)begin
            Address = ALU(Rdata1, Rdata2, Ed32, op, funct, shamt);//Rdata1が選択される
            //Address = r_JR;
            //Address = Rdata1;
        end
        else begin
            Address = nextPC; 
        end
    end
    else if(op == BEQ || op == BNE)begin//条件分岐
        if(ALU(Rdata1, Rdata2, Ed32, op, funct, shamt) == 1)begin
            Address = nextPC + (Ed32 << 2);
        end
        else begin
            Address = nextPC;
        end    
    end
    else if(op == J || op == JAL)begin//ジャンプ・関数呼び出し
        Address = {nextPC[31:28] , jadr << 2};//PC[31-28]と4*addressの連接
        //Address = {nextPC[31:28], 28'b0}; 
    end
    else if(op == ADDI || op == LW || op == SW || op == SLTI)begin
        Address = nextPC;
    end
    else begin
        Address = 0;//初期値のつもり
    end
endfunction

// initial begin
//     newPC = 0;
// end

assign Result = ALU(Rdata1, Rdata2, Ed32, op, funct, shamt);
assign newPC = Address(Rdata1, Rdata2, nextPC, jadr, Ed32, op, funct, shamt);


endmodule
`default_nettype wire