module ID(
 input CLK, RST,
 input [31:0] Ins,//命令
 input [31:0] Wdata,
 output reg [31:0] Rdata1,
 output reg [31:0] Rdata2,
 output reg [31:0] Ed32
);

reg [31:0] REGFILE [31:0];//レジスタファイル32x32 レジスタのアドレスは0~31まで

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
	                ADD: begin
	                Rdata1 <= REGFILE[rs];
	                Rdata2 <= REGFILE[rt];
	                Ed32 <= 32'd0;
	                end

                    ADDU: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SUB: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd2;
                    end

                    SUBU: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    AND: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    OR: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    XOR: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    NOR: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLT: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLTU: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLT: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLTU: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= REGFILE[rt];
                    Ed32 <= 32'd0;
                    end

                    SLL: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= shamt;
                    Ed32 <= 32'd0;
                    end

                    SRL: begin
                    Rdata1 <= REGFILE[rs];
                    Rdata2 <= shamt;
                    Ed32 <= 32'd0;
                    end

                    SRA: begin
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

            ADDI: begin
                Rdata1 <= REGFILE[rs];
                Rdata2 <= 32'd0;
                if(Ins[15] == 1'd0) 
                    Ed32 <= {16'd0,offset_immd};
                else if (Ins[15] == 1'd1)
                    Ed32 <= {16'b1111111111111111,offset_immd};
                end
        endcase
    end 
end

endmodule