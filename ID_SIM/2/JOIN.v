module JOIN (
    input  CLK, RST,
    input [31:0] Ins
);


wire[31:0] result, rdata1, rdata2, ed32;

ID i0(.CLK(CLK), .RST(RST), .Ins(Ins), .Wdata(result), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32));
EX ex0(.CLK(CLK), .RST(RST), .Ins(Ins), .Rdata1(rdata1), .Rdata2(rdata2), .Ed32(ed32), .Result(result));

endmodule