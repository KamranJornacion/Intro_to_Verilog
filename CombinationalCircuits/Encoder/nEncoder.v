
module  nEncoder  #(parameter N = 8) (
    input en,
    input [N-1:0] x,
    output [clog2(N)-1:0] y);
    localparam WIDTH = clog2(N);

    reg y;

    function integer clog2;
        input integer value;
        integer i;
        begin
            clog2 = 0;
            for (i = value - 1; i > 0; i = i >> 1)
                clog2 = clog2 + 1;
        end
    endfunction

    always@(*) begin
        integer i;
        if (en) begin
        
            for(i = 0;i< N;i = i+1) begin
                if(x == 2**i)
                    y=i;
            end
        end else begin
            y = {WIDTH{1'bx}};
        end

    end

endmodule
