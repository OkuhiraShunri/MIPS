module DM(
    input  CLK, RST,
    input [31:0] Result,
    input [31:0] Rdata2,
    input [31:0] Ins,nextPC,
    output [31:0] Wdata,
    output [31:0] SW_TEST
);

`include "common_param.vh"

//integer i;
reg [31:0] DMEM [0:DMEM_SIZE-1];
wire [5:0] op;
assign op = Ins[31:26];
wire [5:0] funct;
assign funct = Ins[5:0];

integer i;
initial begin
    for (i = 0; i < 1024; i = i + 1) begin
        DMEM[i] <= 32'd777;
    end
end

wire [31:0] Rdata;
assign Rdata = DMEM[Result];

function [31:0] MUX3;
    input [31:0] Result;
    input [31:0] nextPC;
    input [5:0] op;
    input [31:0] Rdata;
    input [5:0] funct;
    
    if (op == LW) begin
        //MUX3 = DMEM[Result];//メモリからのデータを取得
        MUX3 = Rdata;
    end
    else if(op == JAL || op == JALR)begin//関数呼び出し命令における、戻りアドレス
        MUX3 = nextPC;
    end 
    // else if(funct == JR)begin
    //     MUX3 = MUX3;
    // end
    else begin
        MUX3 = Result;  //演算結果のみ取得
    end
endfunction

// always @(posedge CLK) begin
//     Wdata <= Result;
// end

always @(posedge CLK) begin
    if(op == SW)begin
        DMEM[Result] <= Rdata2;//メモリに書き込み
        //SW_TEST = DMEM[Result];
    end
    // else begin
    //     if(funct == MFHI)begin
    //         DMEM[Rdata2] <= 
    //     end
    // end
    // else begin
    //     Wdata <= MUX3(Result, nextPC, op);//
    // end
end

assign Wdata = MUX3(Result, nextPC, op, Rdata, funct);
assign SW_TEST = DMEM[Result];


endmodule