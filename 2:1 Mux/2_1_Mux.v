// Design
// 2:1 Mux
module dff (input inA,
            		inB,
            		sel,
            output out);
 
  assign out = (sel&inA)|((~sel)&inB);
  
  
endmodule
