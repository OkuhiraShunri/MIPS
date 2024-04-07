`timescale 1ns / 100ps

module JOIN_SIM();
`include "common_param.vh"
reg clk, rst;
reg [31:0] ins;
//wire [31:0] rdata1, rdata2, ed32;

JOIN j0(
    .CLK(clk),
    .RST(rst),
    .Ins(ins)
);


always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end

initial begin
    rst = 0;
    
    // ins[31:26] = R_FORM; //op
    // ins[25:21] = 5'd10;  //t2
    // ins[20:16] = 5'd11;  //t3
    // ins[15:11] = 5'd9;   //t1
    // ins[10:6] = 5'd0;
    // ins[5:0] = ADD;      //func

    ins[31:26] = ADDI;
    ins[25:21] = 5'd10; //t2
    ins[20:16] = 5'd9;  //t1
    ins[15:0] = 16'd16; //immd
end






endmodule