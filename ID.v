module ID(
 input CLK, RST,
 input [31:0] Ins,//命令
 input [31:0] Wdata,
 output reg [31:0] Rdata1,
 output reg [31:0] Rdata2,
 output reg [31:0] Ed32
 output reg [25:0] jadr;
);
`include "common_param.vh"//

reg [31:0] REGFILE [31:0];//レジスタファイル32bit x 32 レジスタのアドレスは0~31まで

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
assign rs = Ins[25:21];
assign rt = Ins[20:16];
assign rd = Ins[15:11];
assign shamt = Ins[10:6];
assign funct = Ins[5:0];
assign offset_immd = Ins[15:0];
assign address = Ins[25:0];

initial begin
    for(i = 0; i < REGFILE_SIZE - 1; i = i + 1) begin
        REGFILE[i] <= 32'd0;
    end
end

//レジスタの読み込み
always @(Ins or RST) begin
    if(RST == 1'b0) begin
	    Rdata1 <= 32'b0;
	    Rdata2 <= 32'b0;
	    Ed32   <= 32'b0;
    end 
    else begin
        case(op)
            R_FORM: begin
                case(funct) //synopsys full_case
	                ADD: begin//符号付き加算
	                Rdata1 <= REGFILE[rs];
	                Rdata2 <= REGFILE[rt];
	                Ed32 <= 32'd0;
	                end

                    ADDU: begin//符号なし加算
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SUB: begin//
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd2;
                    end

                    SUBU: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    AND: begin//論理積
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    OR: begin//論理和
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    XOR: begin//排他的論理和
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    NOR: begin//論理和否定
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLT: begin//符号付き比較
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLTU: begin//符号なし比較
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLL: begin//論理左シフト
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= shamt;
                    Ed32 <= 32'd0;
                    end

                    SRL: begin//論理右シフト
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= shamt;
                    Ed32 <= 32'd0;
                    end

                    SRA: begin//算術右シフト
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= shamt;
                    Ed32 <= 32'd0;
                    end

                    SLLV: begin
                    Rdata1 <= REGFILE[rt];
                    Rdata2 <= REGFILE[rs];
                    Ed32 <= 32'd0;
                    end

                    SRLV: begin
                    Rdata1 <= REGFILE[rt];
                    Rdata2 <= REGFILE[rs];
                    Ed32 <= 32'd0;
                    end

                    SRAV: begin
                    Rdata1 <= REGFILE[rt];
                    Rdata2 <= REGFILE[rs];
                    Ed32 <= 32'd0;
                    end

                    MFHI: begin
                    Rdata1 <= 32'd0;
                    Rdata2 <= 32'd0;
                    Ed32 <= 32'd0;
                    end

                    MTHI: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= 32'd0;
                    Ed32 <= 32'd0;
                    end

                    MFLO: begin
                    Rdata1 <= 32'd0;
                    Rdata2 <= 32'd0;
                    Ed32 <= 32'd0;
                    end

                    MTLO: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= 32'd0;
                    Ed32 <= 32'd0;
                    end

                    MULT: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    MULTU: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    DIV: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    DIVU: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    JR: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= 32'd0;
                    Ed32 <= 32'd0;
                    end

                    JALR: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= 32'd0;
                    Ed32 <= 32'd0;
                    end

                default: begin
                    Rdata1 <= Rdata1;
                    Rdata2 <= Rdata2;
                    Ed32 <= Ed32;
                    end
                endcase
                end//R形式ここまででおしまい

//------------I形式スタート--------------
            ADDI: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                if(Ins[15] == 1'd0) 
                    Ed32 <= {16'd0,offset_immd};//{}はビット結合演算子　符号拡張をしているので
                else if (Ins[15] == 1'd1)
                    Ed32 <= {16'b1111111111111111,offset_immd};
            end

            ADDIU: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= {16'd0,offset_immd};
            end

            SLTI: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                if(Ins[15] == 1'd0) 
                    Ed32 <= {16'd0,offset_immd};
                else if (Ins[15] == 1'd1)
                    Ed32 <= {16'b1111111111111111,offset_immd};
            end

            SLTIU: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= {16'd0,offset_immd};
            end

            ANDI: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                if(Ins[15] == 1'd0) 
                    Ed32 <= {16'd0,offset_immd};
                else if (Ins[15] == 1'd1)
                    Ed32 <= {16'b1111111111111111,offset_immd};
            end

            ORI: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                if(Ins[15] == 1'd0) 
                    Ed32 <= {16'd0,offset_immd};
                else if (Ins[15] == 1'd1)
                    Ed32 <= {16'b1111111111111111,offset_immd};
            end

            XORI: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                if(Ins[15] == 1'd0) 
                    Ed32 <= {16'd0,offset_immd};
                else if (Ins[15] == 1'd1)
                    d32 <= {16'b1111111111111111,offset_immd};
            end

            LW: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= {16'd0,offset_immd};
            end

            SW: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= {16'd0,offset_immd};
            end

            BLTZ: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= 32'd0;
            end

            BGEZ: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= 32'd0;
            end

            BLEZ: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= 32'd0;
            end

            BGTZ: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                Ed32 <= 32'd0;
            end

            BEQ: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= REGFILE[rt];
                Ed32 <= 32'd0;
            end

            BNE: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= REGFILE[rt];
                Ed32 <= 32'd0;
            end//I形式ここまで
            
//---------J形式スタート-----
            J: begin
                Rdata1 <= 32'd0;
                Rdata2 <= 32'd0;
                Ed32 <= 32'd0;
                jadr <= Ins[25:0];
            end
	
            JAL: begin
                Rdata1 <= 32'd0;
                Rdata2 <= 32'd0;
                Ed32 <= 32'd0;
                jadr <= Ins[25:0];

            end            

        endcase
    end 
end

//レジスタへの書き込み
always @(negedge CLK) begin
  case(op) //synopsys full_case
    R_FORM : REGFILE[rd] <= Wdata;
    ADDI   : REGFILE[rt] <= Wdata;
    ADDIU  : REGFILE[rt] <= Wdata;
    ANDI   : REGFILE[rt] <= Wdata;
    ORI    : REGFILE[rt] <= Wdata;
    XORI   : REGFILE[rt] <= Wdata;
    SLTI   : REGFILE[rt] <= Wdata;
    SLTIU  : REGFILE[rt] <= Wdata;
    LW     : REGFILE[rt] <= Wdata;
    SW     : REGFILE[rt] <= Wdata;
    JAL    : REGFILE[ra] <= Wdata;
    default: begin
    REGFILE[rd] <= REGFILE[rd];
    REGFILE[rt] <= REGFILE[rt];
    REGFILE[ra] <= REGFILE[ra];
	 end
  endcase
 end

endmodule