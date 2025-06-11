`include "Dflip.v"



module DflipTB();

    logic [31:0] D, Q, notQ;
    logic reset;
    logic clk;

    Dflip DUT (
        .D(D),
        .Q(Q),
        .clk(clk),
        .notQ(notQ),
        .reset(reset)
        );

    task testout();

        integer i, numtests;
        numtests = 100;

        for(i = 0;i<numtests;i=i+1) begin

            D = $urandom;
            #5;
            if(clk && D==Q) begin
                $display("Clk: %0d, d = %0b = q, notQ = %0b",clk,D,notQ);
            end else if(D!=Q) begin
                $display("Clk: %0d, d= %0b, q= %0b, q' = %0b",clk,D,Q,notQ);
            end
            else begin
                 $display("ERROR: Clk: %0d, d= %0b, q= %0b, q' = %0b",clk,D,Q,notQ);
            end

        end



    endtask

    task testreset();//Why does rest at posedge turn notQ into 0000001 but Q into 00000000??? wheres the one from?
        integer i, numtests;
        numtests =15;
        reset = 0;
        for(i=0;i<numtests;i = i+1) begin
            reset = #2 ~reset;
            D = $urandom;
            #5;
            if(clk && D==Q) begin
                $display("Clk: %0d, d = %0b = q, notQ = %0b",clk,D,notQ);
            end else if(D!=Q) begin
                $display("Clk: %0d, d= %0b, q= %0b, q' = %0b",clk,D,Q,notQ);
            end
            else begin
                 $display("ERROR: Clk: %0d, d= %0b, q= %0b, q' = %0b",clk,D,Q,notQ);
            end

        end
    endtask
    
    initial begin
        clk = 0;
        forever #10 clk = ~clk;

    end

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(1);   

        testout();

        testreset();


        

        $display("You will get that internship king!");
        $finish();
    end


endmodule