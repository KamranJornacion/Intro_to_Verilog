module Dflip (
    input [31:0] D,
    input clk,reset,
    output reg [31:0]Q, notQ
    );

    always@(posedge clk)begin
        if(reset)begin
            Q<=32'b0;
            notQ<={32{1'b1}};
        end else begin
            Q<=D;
            notQ<=~D;
        end
    end

endmodule