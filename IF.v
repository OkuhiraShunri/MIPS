module IF (
 input CLK, RST, WE,
 //input [31:0] W_Ins,
 input [31:0] newPC,
 //output reg [31:0] PC,
 output reg [31:0] Ins,
 output reg [31:0] nextPC
);


reg [31:0] IMEM [0:IMEM_SIZE-1];//命令メモリ

initial begin
  $readmemh("IMEM_Data.txt",IMEM);//命令が入ったテキストデータをレジスタ配列IMEMに読み込む
end

reg[31:0] pc;
always @(posedge CLK) begin
    pc <= newPC;
    nextPC <= pc + 32'd4;
    Ins <= IMEM[newPC>>2];
end

endmodule