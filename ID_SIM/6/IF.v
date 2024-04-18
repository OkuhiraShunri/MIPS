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
  $readmemb("IMEM_Data.txt",IMEM);//命令が入ったテキストデータをレジスタ配列IMEMに読み込む
  // IMEM[0] <= 32'b000000_01010_01011_01001_00000_100000;//add t1 t2 t3
  // IMEM[1] <= 32'b001000_10010_10001_0000000100000000;//addi s1 s2 256
  // IMEM[2] <= 32'b100011_10010_10001_0000000000000100;//lw s1, s2
  // //IMEM[3] <= 32'b000100_10010_10001_0000000001000000;//beq s1 s2 64
  // IMEM[3] <= 32'b000100_10011_10100_0000000001000000;//beq s3 s4 64
  // IMEM[4] <= 32'b000000_01010_01011_01001_00000_100000;//add t1 t2 t3

  // IMEM[0] <= 32'b000100_10010_10001_0000000001000000;//beq s1 s2 64
  // IMEM[1] <= 32'b001000_10010_10001_0000000100000000;//addi s1 s2 256
  // IMEM[2] <= 32'b100011_10010_10001_0000000000100000;//lw s1, s2
  // IMEM[3] <= 32'b000000_01010_01011_01001_00000_100000;//add t1 t2 t3
end

reg[31:0] pc;
// initial begin
//   nextPC <= 32'b0;
// end
always @(posedge CLK) begin
    pc <= newPC;  //newPCの値はEX.vが決める
    Ins <= IMEM[pc >> 2];//配列の添え字にするためにpcを1/4倍
    nextPC <= pc + 32'd4;
end

endmodule