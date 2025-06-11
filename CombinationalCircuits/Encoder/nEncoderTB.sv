`ifndef N
    `define N 8
`endif

`include "nEncoder.v"

module nEncoderTB();
    parameter N =`N;

    logic [N-1:0] x;
    logic [clog2(N)-1:0] y;
    logic en;


    function integer clog2;
        input integer value;
        integer i;
        begin
            clog2 = 0;
            for (i = value - 1; i > 0; i = i >> 1)
                clog2 = clog2 + 1;
        end
    endfunction

    nEncoder #(N) DUT(
        .x(x),
        .y(y),
        .en(en)        
    );



    task testEn();

        integer i;
        integer numTest;
        numTest=15;
        en = 0;

        $display("Testing enable functionality");

        
        for(i = 0; i<numTest;i=i+1) begin
            x = $urandom;

            #1
            $display("x= %0d, y=%0d",x,y);
        end

    endtask

    task testEnoding();

        integer i;
        en =1;

        for(i = 0;i<N;i=i+1) begin
            x=2**i;
            #1
            if(2**y == x)
                $display("Correct! 2^Y = %0d = x, y = %0d",x,y);
            else
                $display("Error: en = %0d, 2^Y = %0d, x = %0d",en,2**y,x);
        end

    endtask




    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        $display("Using N=%0d", N);

        testEn();

        testEnoding();

        $finish();

    end

endmodule