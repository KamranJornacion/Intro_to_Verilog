// Code your design here
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
//8-bit ripple carry!
module RippleCarry(input [7:0] x1,
                   input [7:0] x2,
                   input cin,
                   output cout,
                   output [7:0] y);
  
  wire [6:0] w_cin;
  //Create first Adder
  FullAdder FA_0 (.x1(x1[0]),
                .x2(x2[0]),
                .cin(cin),
                  .cout(w_cin[0]),
                  .sum(y[0]));
  //Create last Adder
  FullAdder FA_7 (.x1(x1[7]),
                  .x2(x2[7]),
                  .cin(w_cin[6]),
                  .cout(cout),
                  .sum(y[7]));
  
  
  genvar i;
  
  generate
    for(i=1;i<7;i=i+1) begin
      FullAdder FA (.x1(x1[i]),
                    .x2(x2[i]),
                    .cin(w_cin[i-1]),
                    .cout(w_cin[i]),
                    .sum(y[i]));
    end
  endgenerate
  
  
  
  
endmodule
                   
