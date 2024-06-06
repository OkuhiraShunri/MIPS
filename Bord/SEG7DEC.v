module SEG7DEC(
     input [31:0] DIN,
     output reg [6:0] nHEX
);
//PCの値の一の位を表示させる
always @* begin
    case(DIN % 5)
        32'd0:	nHEX = 7'b1000000;//0
		32'd1:	nHEX = 7'b0000010;//6
		32'd2:	nHEX = 7'b0100100;//2
		32'd3:	nHEX = 7'b0000000;//8
		32'd4:	nHEX = 7'b0011001;//4
		default:nHEX = 7'b1111111;
    endcase
end

endmodule