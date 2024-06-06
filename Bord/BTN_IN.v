module BTN_IN (
    input CLK, RST,
    input [10:0] nBIN,
    output reg [10:0] BOUTN, BOUTP
);

/* 50MHzを1250000分周して40Hzを作る */
/* en40hzはシステムクロック1周期分のパルスで40Hz */
reg [20:0] cnt;

wire en40hz = (cnt==1250000 - 1);

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        cnt <= 21'b0;
    end
    else if (en40hz) begin
        cnt <= 21'b0;
    end
    else begin
        cnt <= cnt + 21'b1;
    end
end

/* 入力をFF2個で受ける */
reg [10:0] ff1, ff2;

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        ff2 <= 11'b0;
        ff1 <= 11'b0;
    end
    else if (en40hz) begin
        ff2 <= ff1;
        ff1 <= nBIN;
    end
end

wire [10:0] tempN = ~ff1 & ff2 & {11{en40hz}};      // 立ち下がり検出
wire [10:0] tempP = ff1 & ~ff2 & {11{en40hz}};      // 立ち上がり検出

/* 念のためFFで受ける */
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        BOUTN <= 11'b0;
        BOUTP <= 11'b0;
    end
    else begin
        BOUTN <= tempN;
        BOUTP <= tempP;
    end
end
    
endmodule