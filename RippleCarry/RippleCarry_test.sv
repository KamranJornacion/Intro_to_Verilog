// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb_FA();
  
  
  reg [7:0]x1;
  reg [7:0]x2;
  reg cin;
  reg cin_2;
  
  wire [7:0]sum;
  wire cout;
  
  RippleCarry DUT (.x1(x1),
                 .x2(x2),
                 .cin(cin),
                 .cout(cout),
                 .y(sum));

  
  
  task show;
    begin
      $display("Time: %t,%d + %d => sum= %d, cout= %d,cin=%d",
               $time,x1,x2,sum,cout,cin);
    end
  endtask
  
  task check_nums(input cin_local);
  	integer i,j;
    begin
    	cin = cin_local;
      	
   		
    
      //solution:
      	for(i=0;i<256;i=i+1) begin
        	x1=i;
        	for(j=0;j<256;j=j+1) begin
        		x2=j;
              	#5
          		show;
        	
        	end
     	end
      
      
      
    end
  endtask
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    x1=0;
    x2=0;
    cin=0;
    
    check_nums(0);
    
    check_nums(1);
    
    $finish;
  end
  
endmodule
