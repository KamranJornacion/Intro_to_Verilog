// Testbench
`include "2_1_Mux.v"
module test;
  
  reg inA;
  reg inB;
  reg sel;
  wire out;
  
  // Instantiate design under test
  dff DFF(.inA(inA), .inB(inB),
          .sel(sel), .out(out));
          
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Sel off, inA");
    inA = 1;
    sel = 0;
    inB = 0;
    display;
    
    $display("Sel on, inA");
    inA = 1;
    sel = 1;
    inB = 0;
    display;
    
    $display("Sel off, inB");
    inA = 0;
    sel = 0;
    inB = 1;
    display;
    
    $display("Sel on, inB");
    inA = 0;
    sel = 1;
    inB = 1;
    display;
  end
  
  task display;
    #1 $display("inA:%0h, inB:%0h, out:%0h",
      inA, inB, out);
  endtask

endmodule
