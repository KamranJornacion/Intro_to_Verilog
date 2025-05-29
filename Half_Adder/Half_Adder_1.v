// Code your design here
//Half-adder Behavioral Model

module HalfAdder( input	x1,
                 		x2,
                 output sum,
                 carry);

  assign sum = x1^x2;
  assign carry = x1&x2;
  
endmodule
