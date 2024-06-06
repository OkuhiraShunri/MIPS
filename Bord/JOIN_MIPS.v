module JOIN_MIPS (
    input  CLK, RST,
    input [31:0] W_Ins, 
    input [10:0] KEY,
    //input [31:0] Ins,nextPC,
    //output [31:0] TEST,
    //output [31:0] SW_TEST,
    output [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

reg WE = 1'b0;
wire[31:0] result, rdata1, rdata2, ed32, wdata, nextpc, ins, newpc, pc;
wire[9:0] bout;
wire [10:0] BOUTN, BOUTP;
BTN_IN b0 (.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUTN(BOUTN), .BOUTP(BOUTP));//BOUTNとBOUTPはチャタリング除去後の信号
wire [8:0] TOUT;
toggle t0 (.CLK(CLK), .RST(RST), .TINN(BOUTN[10:2]), .TINP(BOUTP[10:2]), .TOUT(TOUT));
//BTN_IN b0(.CLK(CLK), .nBIN(KEY), .BOUT(bout));//boutがチャタリング除去後の信号
ID i0(.CLK(BOUTN[1]), .RST(RST), .Ins(ins), .Wdata(wdata), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32));
EX ex0(.CLK(BOUTN[1]), .RST(RST), .Ins(ins), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32), .nextPC(nextpc), .Result(result), .newPC(newpc));//nextPCをインプット
DM d0(.CLK(BOUTN[1]), .RST(RST), .Ins(ins), .Result(result), .Rdata2(rdata2), .nextPC(nextpc), .Wdata(wdata));//nextPCをインプット
IF f0(.CLK(BOUTN[1]), .RST(RST), .newPC(newpc), .Ins(ins), .nextPC(nextpc), .PC(pc), .WE(WE), .W_Ins(W_Ins));//nextPCをアウトプット、newPCをインプット

wire [3:0] DIN0, DIN1, DIN2, DIN3, DIN4, DIN5;
// seg7dec_3 seg1(.DIN(pc[3:0]), .nHEX(HEX0));
// seg7dec_3 seg2(.DIN(pc[7:4]), .nHEX(HEX1));
seg7dec_3 seg0(.DIN(DIN0), .nHEX(HEX0));
seg7dec_3 seg1(.DIN(DIN1), .nHEX(HEX1));
seg7dec_3 seg2(.DIN(DIN2), .nHEX(HEX2));
seg7dec_3 seg3(.DIN(DIN3), .nHEX(HEX3));
seg7dec_3 seg4(.DIN(DIN4), .nHEX(HEX4));
seg7dec_3 seg5(.DIN(DIN5), .nHEX(HEX5));


assign {DIN5, DIN4, DIN3, DIN2, DIN1, DIN0} = MUX(pc, nextpc, ins, rdata1, rdata2, ed32, result, newpc, wdata);//MUXの引数のうち、どれかが選び出される

function [23:0] MUX (input [31:0] pc, nextpc, ins, rdata1, rdata2, ed32, result, newpc, wdata);
    case (TOUT)
        9'b0:      MUX = pc[23:0];
        9'b1 << 0: MUX = nextpc[23:0];//SW[0]
        9'b1 << 1: MUX = ins[23:0];//SW[1]
        9'b1 << 2: MUX = rdata1[23:0];//SW[2]
        9'b1 << 3: MUX = rdata2[23:0];//SW[3]
        9'b1 << 4: MUX = ed32[23:0];//SW[4]
        9'b1 << 5: MUX = result[23:0];//SW[5]
        9'b1 << 6: MUX = newpc[23:0];//SW[6]
        9'b1 << 7: MUX = wdata[23:0];//SW[7]
        default:   MUX = 24'hffffff;
    endcase
endfunction


endmodule