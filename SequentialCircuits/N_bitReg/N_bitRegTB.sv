`ifndef N
    `define N 8
`endif

`include "N_bitReg.v"

`timescale 1ns / 1ps

module N_bitRegTB();

parameter N = `N;

logic [N-1:0] pin, pout;
logic sin_r, sin_l;
logic [2:0] mode;
logic reset, clk, sout_r,sout_l;
logic flag;


N_bitReg #(N) DUT (
    .pin(pin),
    .sin_l(sin_l),
    .sin_r(sin_r),
    .mode(mode),
    .reset(reset),
    .clk(clk),
    .pout(pout),
    .sout_l(sout_l),
    .sout_r(sout_r)
    );

task rightShift();//TODO: sout l but it should be sout r im confused about how i assigned. Need to change clock delay so that sin_l is changed during clock highs!

    integer num_tests,i,j,test_val;
    num_tests = N*N;

    mode =1;
    sin_l = 0;
    
    for(i = 0; i<num_tests; i = i+1) begin
        @(posedge clk);
            reset = 1;
        test_val = $urandom_range(0,N);

        $display("vector = %b",test_val[N-1:0]);
        @(posedge clk);
            reset = 0;
        
        for(j=0;j<N;j=j+1) begin
            @(negedge clk);
                sin_l = test_val[j];
        end

        #10//Pause for one cycle before reset

        if(test_val[0] == sout_r) begin
            $display("\tCorrect: test[0] = sout_r = %d",sout_r);
        end else begin
            $display("\tFail: test[0] = %d, sout_r = %d",test_val[0],sout_r);
        end
        $display("\t\tRegister status: %b",pout);

    end


endtask

task leftShift();
    integer num_tests,j, i, test_val;

    num_tests = N*N;

    mode = 2;
    sin_r = 0;

    for(i = 0;i<num_tests;i= i+1)begin

        @(posedge clk);
            reset = 1;
        test_val = $urandom_range(0,N);
        
        $display("vector = %b",test_val[N-1:0]);
        @(posedge clk);
            reset = 0;

        for(j=0;j<N;j=j+1)begin
            @(negedge clk);
                sin_r = test_val[j];
        end

         #10//Pause for one cycle before reset

        if(test_val[0] == sout_l) begin
            $display("\tCorrect: test[0] = sout_l = %d",sout_l);
        end else begin
            $display("\tFail: test[0] = %d, sout_l = %d",test_val[0],sout_l);
        end
        $display("\t\tRegister status: %b",pout);



    end



endtask

task paralellShift();

integer num_tests,j, i;

    num_tests = N*N;

    mode = 0;

    for(i=0;i<num_tests;i=i+1) begin

        pin = $urandom_range(0,N);

        @(posedge clk);

        if(pout != pin) begin
            $display("uhoh");
        end


    end


endtask


initial begin 
    clk =0;
    forever #5 clk = ~clk;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(1);
@(posedge clk);
    flag=0;

rightShift();

@(negedge clk);
    flag=1;
@(posedge clk);
    flag=0;

leftShift();

@(negedge clk);
    flag=1;
@(posedge clk);
    flag=0;

paralellShift();

$finish();

end


endmodule