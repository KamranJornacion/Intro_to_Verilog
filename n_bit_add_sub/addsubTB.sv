`ifndef N
    `define N 8
`endif

`include "addsub.v"

module addsubTB ();
    parameter N = `N;

    logic [N-1:0] x1;
    logic [N-1:0] x2;
    logic addsub;
    logic [N-1:0] sum;
    logic cout;
    logic [N:0] expected_result;


    AddSub #(N) DUT (
        .x1(x1),
        .x2(x2),
        .addSub(addsub),
        .sum(sum),
        .cout(cout)
    );



    task automatic testaddsub(input addsub_local);
        int num_tests =1000;
        addsub = addsub_local;
        
        $display("Beginning <addsub=%0d> Tests for %0dbits",addsub,N);

        for(int i=0;i<num_tests;i++) begin
            
            x1 = $urandom;
            x2 = $urandom;

            #1;
            if(addsub) begin
                expected_result = x1 - x2;
            end else begin
                expected_result = x1 + x2;
            end 

            if({cout, sum} !== expected_result) begin
                
                $display("Test %0d Failed: x1=%0h x2=%0h | DUT={%0b,%0h} Expected={%0b, %0h}",
                i, x1, x2, cout, sum, expected_result[N], expected_result[N-1:0]);
            end else begin
                $display("Test %0d PASSED", i);
            end    
        end

        $display("Testing Complete! ");

    endtask
    
    

    
    
    initial begin //main simulation

    $dumpfile("dump.vcd");
    $dumpvars(1);

    testaddsub(0);

    testaddsub(1);


    end


endmodule