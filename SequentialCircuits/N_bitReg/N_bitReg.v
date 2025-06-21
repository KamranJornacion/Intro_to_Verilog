module N_bitReg #(parameter N = 32) (
    input [N-1:0] pin,
    input sin_r, sin_l,
    input [2:0] mode, 
    input reset, clk,
    output reg [N-1:0] pout,//Default wire so must explicitly define as reg!
    output sout_r,sout_l
    );

    

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pout <=0;
        end else begin
        case(mode)
            0: pout<=pin;//paralell in out
            1: pout <= {sin_l,pout[N-1:1]};//serial out right
            2: pout <= {pout[N-2:0],sin_r};//serial out left
            default: pout <=pout;
        endcase
        end
    end
    assign sout_l = pout[N-1];
    assign sout_r = pout[0];

endmodule