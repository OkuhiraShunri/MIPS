module EX (
 input CLK, RST,
 input [31:0] Rdata1, Rdata2, //Rdata1 = rs, Rdata2 = rt
 input [31:0] Ed32, 
 input [25:0] jadr,
 input [31:0] Ins, //
 input [31:0] nextPC, //newPC+4
 output reg [31:0] Result,
 output reg [31:0] newPC
);

`include "common_param.vh"
wire [5:0] op;
assign op = Ins[31:26];


endmodule