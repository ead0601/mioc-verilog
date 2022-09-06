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

    in1,            // async   reset
    in2,            // negedge clk         // negedge reset (???)
    in3,            // sync    D          // inverted negedge reset  
    in4             // async   set
    );

   output q;
   output qbar;

   input  in1;
   input  in2;
   input  in3;
   input  in4;

   reg    qr, n_qr; 

   always @(negedge in2 or posedge in1 or posedge in4) begin
      if (in1) begin
	qr <= 1'b0;          // async reset
      end
      else if (in4) begin
	qr <= 1'b1;          // async set
      end
      else begin
	 qr <= in3;         // assign next value	 
      end      
   end
   
   //always @(in3) begin
//	 n_qr = in3;
  // end
   
   assign q = qr;
   assign qbar = ~qr;
    
endmodule
