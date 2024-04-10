module JOIN (
    input  CLK, RST,
    input [31:0] Ins,
    output [31:0] TEST,
    output [31:0] SW_TEST
);


wire[31:0] result, rdata1, rdata2, ed32, wdata;

ID i0(.CLK(CLK), .RST(RST), .Ins(Ins), .Wdata(wdata), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32), .TEST(TEST));
EX ex0(.CLK(CLK), .RST(RST), .Ins(Ins), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32), .Result(result));
DM d0(.CLK(CLK), .RST(RST), .Ins(Ins), .Result(result), .Rdata2(rdata2), .Wdata(wdata), .SW_TEST(SW_TEST));

endmodule