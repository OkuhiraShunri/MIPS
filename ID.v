module ID(
 input CLK, RST,
 input [31:0] Ins,
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

                    end
            I_FORM: begin
                
                    end
            J_FORM: begin
                
                    end
        endcase
    end 
end

endmodule