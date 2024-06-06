module IF (
 input CLK, RST, WE, 
 input [31:0] W_Ins,
 input [31:0] newPC,
 //output reg [31:0] PC,
 output  [31:0] Ins,
 output  [31:0] nextPC,
 output  reg [31:0] PC
);

`include "common_param.vh"
reg [31:0] IMEM [0:IMEM_SIZE-1];//命令メモリ
integer i;
initial begin
  //$readmemh("addi_test2.txt",IMEM);
  for (i = 0; i < 64; i = i + 1) begin
          IMEM[i][31:0] = 32'd0;
  end
  $readmemh("Recursion.txt",IMEM);//命令が入ったテキストデータをレジスタ配列IMEMに読み込む
  //$readmemh("Function.txt",IMEM);
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
/* 命令メモリImemの更新処理 */
always @(posedge CLK) begin
    if (WE) begin
        // ほぼ同タイミング(CLK同期)でPCにnewPCが入るため，newPCを使用しないと上手くいかない可能性がある
        // initial文による初期化があるため，RSTによる命令メモリの初期化はなくす
        //最適化を防止
        IMEM[newPC >> 2'd2][31:0] <= W_Ins;
    end
end
//reg[31:0] pc;
// initial begin
//   nextPC <= 32'b0;
// end
always @(posedge CLK or posedge RST) begin//CLKはKEY入力からのクロック。posedge RSTで非同期リセット
  if (RST) begin
    PC <= 32'b0;
  end
  else begin
    PC <= newPC;  //newPCの値はEX.vが決める 
  end
end


assign Ins = IMEM[PC >> 2];//配列の添え字に変換するためにpcを1/4倍
assign nextPC = PC + 32'd4;



endmodule