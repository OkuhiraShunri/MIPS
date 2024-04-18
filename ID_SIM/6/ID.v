module ID (
    input  CLK, RST,
    input  [31:0] Ins, Wdata,
    output [31:0] Rdata1, Rdata2, Ed32, TEST
);
`include "common_param.vh"
// レジスタファイル Read
reg [31:0] REG_FILE [31:0];

integer i;
initial begin
    REG_FILE[0] = {32{1'b0}};
    REG_FILE[10] = 32'd5;//t2
    REG_FILE[11] = 32'd9;//t3
    //REG_FILE[9] = 32'd45;//t1
    REG_FILE[16] = 32'd13;//s0
    REG_FILE[17] = 32'd13;//s1
    REG_FILE[18] = 32'd13;//s2
    REG_FILE[19] = 32'd5;
    REG_FILE[20] = 32'd5;
    REG_FILE[23] = 32'd23;//s7
    // for (i = 1; i < 32; i = i + 1) begin
    //     REG_FILE[i] <= 0;
    // end
end

wire [5:0] op;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [4:0] shamt;
wire [5:0] funct;
wire [15:0] offset_immd;
wire [25:0] address;
wire [4:0] ra = {5{1'b1}};

assign op = Ins[31:26];
assign rs = Ins[25:21];// Radr1 レジスタアドレスをもらう
assign rt = Ins[20:16];// Radr2
assign rd = Ins[15:11];
assign shamt = Ins[10:6];
assign funct = Ins[5:0];
assign offset_immd = Ins[15:0];
assign address = Ins[25:0];

// MUX1
function [4:0] MUX1;
    input [5:0] op;
    input [5:0] rt;
    input [5:0] rd;
    //input [5:0] funct;
    
    if (op == JAL) begin//関数呼び出し
        MUX1 = {5{1'b1}};
    end 
    else if (op == R_FORM) begin
        MUX1 = rd;
    end 
    else begin
        MUX1 = rt;
    end
endfunction

// レジスタファイル Write
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        REG_FILE[MUX1(op, rt, rd)] <= 32'b0;    
    end
    else if(op == SW || op == BEQ)begin
        REG_FILE[MUX1(op, rt, rd)] <= REG_FILE[MUX1(op, rt, rd)];//なにもしない
    end 
    else begin
        REG_FILE[MUX1(op, rt, rd)] <= Wdata;//レジスタファイルに書き込む処理。 opがJALのときはMUX1がraになっていてかつWdataがnextPCになっている。JALRのときはMUX1がrdになっていてかつWdataはnextPCになっている
    end
end


// SE/UE 
function [31:0] SE_UE;
    input [5:0] op;
    input [15:0] offset_immd;
    input [31:0] Ins;
    

    if (op == (ANDI || ORI || XORI)) begin
        SE_UE = {{16{1'b0}}, offset_immd};
    end 
    else begin
        SE_UE = {{16{Ins[15]}}, offset_immd};
    end
endfunction


assign Ed32 = SE_UE(op, offset_immd, Ins);
assign Rdata1 = REG_FILE[rs];
assign Rdata2 = REG_FILE[rt];
assign TEST = REG_FILE[rt];//レジスタファイルに書き込まれているかを見るだけのテスト出力

endmodule