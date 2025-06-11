// Code your design here


module HalfAdder( input	x1,
                 		x2,
                 output sum,
                 carry);

  assign sum = x1^x2;
  assign carry = x1&x2;
  
endmodule

module FullAdder(input  x1,
                 		x2,
                 		cin,
                 output cout,
                 		sum);
  
  wire w1,w2,w3;
  
  HalfAdder HA1(.x1(x1),
                .x2(x2),
                .sum(w2),
                .carry(w1));
  
  HalfAdder HA2(.x1(w2),
                .x2(cin),
                .sum(sum),
                .carry(w3));
  
  assign cout = w1|w3;
  
                
  
endmodule
