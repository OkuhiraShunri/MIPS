module DM(
    input  CLK, RST,
    input [31:0] Result,
    input [31:0] Rdata2,
    input [31:0] Ins,
    output reg [31:0] Wdata,
    output [31:0] SW_TEST
);

`include "common_param.vh"

//integer i;
reg [31:0] DMEM [0:DMEM_SIZE-1];
wire [5:0] op;
assign op = Ins[31:26];

integer i;
initial begin
    for (i = 1; i < 32; i = i + 1) begin
        DMEM[i] <= 32'd777;
    end
end

function [31:0] MUX3;
    input [31:0] Result;
    //input [31:0] Rdata;
    //input [31:0] nextPC;
    input [5:0] op;
    
    if (op == LW) begin
        MUX3 = DMEM[Result];//メモリからのデータを取得
    end
    // else if(op == JAL)begin
    //     MUX3 = nextPC;
    // end 
    else begin
        MUX3 = Result;  //演算結果のみ取得
    end
endfunction

always @(posedge CLK) begin
    if(op == SW)begin
        DMEM[Result] <= Rdata2;//メモリに書き込み
        //SW_TEST = DMEM[Result];
    end
    else begin
        Wdata <= MUX3(Result, op);//
    end
end

assign SW_TEST = DMEM[Result];
// always @(posedge CLK) begin
//     // if (RST == 1'b0) begin
// 	//     Wdata <= 32'd0;
//     // end 
//     // else
//     //if(RST == 1'b1 ) begin
//         case(op)
// 	        LW: Wdata <= DMEM[Result]; // rt = mem[(rs)+offset]32)

// 	        SW: begin
// 	            Wdata <= 32'd0;
// 	            DMEM[Result] <= Rdata2; // mem[(rs)+offset]32) = rt
// 	        end
// 	        default: Wdata <= Result;
//         endcase
//     //end
// end


endmodule