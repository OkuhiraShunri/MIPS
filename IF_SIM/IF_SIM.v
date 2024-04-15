`timescale 1ns / 100ps

module IF_SIM();
`include "common_param.vh"
reg clk, rst;
reg [31:0] newpc;
wire [31:0] ins, nextpc;

IF f0(
    .CLK(clk),
    .RST(rst),
    .Ins(ins),
    .newPC(newpc),
    .nextPC(nextpc)
);


always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end

initial begin
    rst = 0;
    newpc = 32'b0;
end

endmodule