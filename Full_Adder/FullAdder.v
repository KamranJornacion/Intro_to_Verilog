// Code your design here
module FullAdder(input  x1,
                 		x2,
                 		cin,
                 output cout,
                 		sum);
  
  assign sum  = x1^x2^cin;
  assign cout = x1&x2 | x1&cin | x2&cin;
  
endmodule
