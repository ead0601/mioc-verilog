// mioc-flop-mos
//
// Edward Diaz , 08_21_22
//
// This is a RTL representation of the original mos layout
// configuration that uses an open drain configuration. This
// was created because of an issuesimulating the NMOS version 
// with ICARUS verilog
//

`timescale 1ns / 1 ns

// mioc-flop-rtl
//
module mioc_flop_rtl (
    q,
    qbar,

    in1,            // posedge reset
    in2,            // negedge reset (???)
    in3,            // inverted negedge reset  
    in4             // posedge set
    );

   output q;
   output qbar;

   input  in1;
   input  in2;
   input  in3;
   input  in4;

   reg    q1;

   // Assign latch case
   //
   always @ (posedge in1 or posedge in4 or negedge in2 or q) begin
      if ( (in1 == 1'b1) & (in4 == 1'b0) ) begin       // reset
	 q1 <= 1'b0;
      end
      else if ( (in1 == 1'b0) & (in4 == 1'b1) ) begin  // set
	 q1 <= 1'b1;
      end
      else if ( (in1 == 1'b0) & (in4 == 1'b0) & (in3 == 1'b0) ) begin   // reset
	 q1 <= 1'b0;
      end
      else if ( (in1 == 1'b0) & (in4 == 1'b0) & (in3 == 1'b1) ) begin   // reset
	 q1 <= 1'b1;
      end
      else begin
         q1 <= q; 
      end
   end // always @ (negedge in2 or q)
   
   assign q = q1;
   assign qbar = ~q1;
    
endmodule
