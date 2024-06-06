module SEG7DEC_2(
     input [31:0] DIN,
     output reg [6:0] nHEX
);
//PCの値の10の位を表示させる
always @* begin
    case(DIN / 10)
        32'h0:	nHEX = 7'b1000000;
		32'h1:	nHEX = 7'b1111001;
		32'h2:	nHEX = 7'b0100100;
		32'h3:	nHEX = 7'b0110000;
		32'h4:	nHEX = 7'b0011001;
		32'h5:	nHEX = 7'b0010010;
		32'h6:	nHEX = 7'b0000010;
		32'h7:	nHEX = 7'b1011000;
		32'h8:	nHEX = 7'b0000000;
		32'h9:	nHEX = 7'b0010000;
		default:nHEX = 7'b1111111;
    endcase
end

endmodule