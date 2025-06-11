// Code your testbench here
// or browse Examples
module tb_FA();
  
  
  reg x1;
  reg x2;
  reg cin;
  
  wire sum;
  wire cout;
  
  FullAdder DUT (.x1(x1),
                 .x2(x2),
                 .cin(cin),
                 .cout(cout),
                 .sum(sum));
  task show;
    begin
      $display("Time: %t...sum= %d, cout= %d",$time,sum,cout);
    end
  endtask
  
  task test_1();
    begin
      $display("000");
      x1 = 0; x2 = 0; cin = 0;
      #10
      show;
      
      $display("100");
      x1 = 1; x2 = 0; cin = 0;
      #10
      show;
      
      $display("010");
      x1 = 0; x2 = 1; cin = 0;
      #10
      show;
      
      $display("110");
      x1 = 1; x2 = 1; cin = 0;
      #10
      show;
      
      $display("001");
      x1 = 0; x2 = 0; cin = 1;
      #10
      show;
      
      $display("101");
      x1 = 1; x2 = 0; cin = 1;
      #10
      show;
      
      $display("011");
      x1 = 0; x2 = 1; cin = 1;
      #10
      show;
      
      $display("111");
      x1 = 1; x2 = 1; cin = 1;
      #10
      show;
      
      
      
      
    end
  endtask
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    x1<=0;
    x2<=0;
    cin<=0;
    
    test_1();
    
    
    $finish();
  end
  
endmodule
