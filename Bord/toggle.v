module toggle(
    input CLK, RST,
    input [8:0] TINN, TINP,
    output reg [8:0] TOUT
);

// この方法では，SWを下げRSTしてから使い始める必要がある．
always @ (posedge CLK or posedge RST)begin
    if (RST) begin
        TOUT <= 9'b0;
    end
    else begin
        /* SWのnegedgeもしくはposedgeでTOUTを反転 */
        TOUT <= (TINN | TINP) ^ TOUT;
    end
end

endmodule