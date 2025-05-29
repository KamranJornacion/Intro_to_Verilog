// Code your testbench here
// or browse Examples
module tb_HalfAdder;
  
  reg x1;
  reg x2;
  
  wire sum;
  wire carry;
  
  HalfAdder dut(.x1(x1),
                .x2(x2),
                .sum(sum),
                .carry(carry));
  
  
  task test_1();
    x1<=0;
    x2<=0;
    
    checker(x1,x2,sum,carry);
      
    x1<=0;
    x2<=1;
      
    checker(x1,x2,sum,carry);
      
    x1<=1;
    x2<=0;
      
    checker(x1,x2,sum,carry);
      
    x1<=1;
    x2<=1;
      
    checker(x1,x2,sum,carry);
  endtask
      
      function checker(input x1,x2,sum,carry);
      	begin
          if(x1==0)begin
            
            if(x2==0)begin
              if((sum | carry) ==1) $error("~x1, ~x2");
            end
            
            else begin
              if(sum !=1 | carry ==1) $error("x1, ~x2");
            end
          end
            
          else begin
            
            if(x2==0)begin
              if(sum !=1 | carry ==1) $error("x1, ~x2");
            end
            
            else if(x2==1) begin
              if(sum !=0 | carry !=1) $error("x1, x2");
            end

  
  initial begin
    
    x1<=0;
    x2<=0;
    
    test_1();
  end
endmodule
    
