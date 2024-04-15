module JOIN (
    input  CLK, RST,
    //input [31:0] Ins,nextPC,
    output [31:0] TEST,
    output [31:0] SW_TEST
);


wire[31:0] result, rdata1, rdata2, ed32, wdata, nextpc, ins, newpc;

ID i0(.CLK(CLK), .RST(RST), .Ins(ins), .Wdata(wdata), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32), .TEST(TEST));
EX ex0(.CLK(CLK), .RST(RST), .Ins(ins), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32), .nextPC(nextpc), .Result(result), .newPC(newpc));
DM d0(.CLK(CLK), .RST(RST), .Ins(ins), .Result(result), .Rdata2(rdata2), .nextPC(nextpc), .Wdata(wdata), .SW_TEST(SW_TEST));
IF f0(.CLK(CLK), .RST(RST), .newPC(newpc), .Ins(ins), .nextPC(nextpc));

endmodule