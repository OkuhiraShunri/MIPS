module IF (
 input CLK, RST, 
 //input [31:0] W_Ins,
 input [31:0] newPC,
 //output reg [31:0] PC,
 output reg [31:0] Ins,
 output reg [31:0] nextPC
);

`include "common_param.vh"
reg [31:0] IMEM [0:IMEM_SIZE-1];//命令メモリ

initial begin
  //$readmemh("IMEM_Data.txt",IMEM);//命令が入ったテキストデータをレジスタ配列IMEMに読み込む
  IMEM[0] <= 32'b00000001010010110100100000100000;
  IMEM[4] <= 32'b00100010010100010000000100000000;
end

reg[31:0] pc;
always @(posedge CLK) begin
    pc <= newPC;
    Ins <= IMEM[newPC];
    nextPC <= pc + 32'd4;
end

endmodule