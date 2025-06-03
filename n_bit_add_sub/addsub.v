
module AddSub #(parameter N =8) (input [N-1:0] x1,
                                  input [N-1:0] x2,
                                  input addSub,
                                  output [N-1:0] sum,
                                  output cout
                                  );

    reg [N:0] result;

    always @(*) begin
        if(addSub) begin
            result = x1 + (~x2 + 1);
        end else begin
            result = x1 + x2;
        end
        
    end
    assign cout = result[N];
    assign sum = result[N-1:0];

endmodule