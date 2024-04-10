module EX (
    input  CLK, RST,
    input [31:0] Ins, Rdata1, Rdata2, Ed32,
    output [31:0] Result
);
`include "common_param.vh"
wire [5:0] op;
wire [4:0] shamt;
wire [5:0] funct;

assign op = Ins[31:26];
assign shamt = Ins[10:6];
assign funct = Ins[5:0];

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

    endcase
endfunction


assign Result = ALU(Rdata1, Rdata2, Ed32, op, funct, shamt);


// always @(posedge CLK) begin
    
// end




// function [31:0] MUX2;
//     input [31:0] Ed32;
//     input [31:0] Rdata2;
//     input [5:0] op;
//     //input [5:0] funct;

//     if (op == R_FORM) begin
//         MUX2 = Rdata2;
//     end 
//     else begin
//         MUX2 = Ed32;
//     end
// endfunction


//演算部分
// always @(posedge CLK) begin
//     if(Rdata1 != 0 && MUX2(Ed32, Rdata2, op) != 0)begin
//         //Result <= MUX2(Ed32, Rdata2, op) + Rdata1;
//         case(op)
//             R_FORM:begin
//                 case(funct)
//                     ADD: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

//                     SUB: Result <= MUX2(Ed32, Rdata2, op) - Rdata1;

//                     MULT:begin
//                         re_64 <= MUX2(Ed32, Rdata2, op) * Rdata1;//64bit
//                         hi <= re_64[63:32]; //32bit
//                         lo <= re_64[31:0];  //32bit
//                     end

//                     DIV:begin
//                         hi <= MUX2(Ed32, Rdata2, op) % Rdata1;
//                         lo <= MUX2(Ed32, Rdata2, op) / Rdata1;
//                     end 

//                     AND: Result <= MUX2(Ed32, Rdata2, op) & Rdata1;

//                     OR: Result <= MUX2(Ed32, Rdata2, op) | Rdata1;

//                     NOR: Result <= !(MUX2(Ed32, Rdata2, op) | Rdata1);

//                     XOR: Result <= MUX2(Ed32, Rdata2, op) ^ Rdata1;

//                     SLL: Result <= Rdata1 << shamt;

//                     SRL: Result <= Rdata1 >> shamt;

//                     SLLV: Result <= MUX2(Ed32, Rdata2, op) << Rdata1;

//                     SRLV: Result <= MUX2(Ed32, Rdata2, op) >> Rdata1;

//                     SRA: Result <= $signed(MUX2(Ed32, Rdata2, op)) >>> shamt;

//                     SRAV: Result <= $signed(MUX2(Ed32, Rdata2, op)) >>> Rdata1;

//                     SLT:begin
//                         if(Rdata1 < MUX2(Ed32, Rdata2, op))begin
//                             Result <= 1;
//                         end
//                         else begin
//                             Result <= 0;
//                         end
//                     end

//                     SLTU:begin
//                         if(Rdata1 < MUX2(Ed32, Rdata2, op))begin
//                             Result <= 1;
//                         end
//                         else begin
//                             Result <= 0;
//                         end
//                     end
                    
//                 endcase
//             end
//             //I形式
//             LW: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

//             SW: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

//             ADDI: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

//             ADDIU: Result <= MUX2(Ed32, Rdata2, op) + Rdata1;

//             SLTI:begin
//                 if(Rdata1 < MUX2(Ed32, Rdata2, op))begin
//                     Result <= 1;
//                 end
//                 else begin
//                     Result <= 0;
//                 end
//             end

//             SLTIU:begin
//                 if(Rdata1 < MUX2(Ed32, Rdata2, op))begin
//                     Result <= 1;
//                 end
//                 else begin
//                     Result <= 0;
//                 end
//             end


//         endcase
//     end
//     else begin
//         Result <= 32'b0;
//     end
// end



endmodule