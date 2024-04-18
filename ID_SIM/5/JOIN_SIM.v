`timescale 1ns / 100ps

module JOIN_SIM();
`include "common_param.vh"
reg clk, rst;
reg [31:0] ins, nextpc;
wire [31:0] newpc, test, sw_test;
//wire [31:0] rdata1, rdata2, ed32;

JOIN j0(
    .CLK(clk),
    .RST(rst),
    .Ins(ins),
    .nextPC(nextpc),
    .newPC(newpc),
    .TEST(test),
    .SW_TEST(sw_test)
);


always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end

initial begin
    rst = 0;
    nextpc = 32'd3758096384;
    //wdata = 32'd0;8
    ins[31:26] = R_FORM;//op
    ins[25:21] = 5'd10;//t2
    ins[20:16] = 5'd11;//t3
    ins[15:11] = 5'd9;//t1
    ins[10:6] = 5'd0;
    ins[5:0] = ADD;//func

    // ins[31:26] = R_FORM;//op
    // ins[25:21] = 5'd10;//t2
    // ins[20:16] = 5'd11;//t3
    // ins[15:11] = 5'd9;//t1
    // ins[10:6] = 5'd5;
    // ins[5:0] = SLT;//func

    // ins[31:26] = SW;//op
    // ins[25:21] = 5'd10;// rs t2
    // ins[20:16] = 5'd11;// rt t3
    // ins[15:0] = 16'd4;//immd

    // ins[31:26] = BEQ;//op
    // ins[25:21] = 5'd10;// rs t2
    // ins[20:16] = 5'd11;// rt t3
    // ins[15:0] = 16'd7;//immd

    // ins[31:26] = J;     //op
    // ins[25:0] = 26'd58; //address
end






endmodule