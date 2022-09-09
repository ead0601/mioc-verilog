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
module mioc_flop_gates (
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

   //reg    qr, n_qr; 

   wire   w_i1z;
   wire   w_i2z;   
   wire   w_n1z;   
   wire   w_n2z;
   wire   w_n3z;
   wire   w_n4z;   
   wire   w_n5z;
   wire   w_n6z;  

   // INST I1
   assign w_i1z = ~w_n2z;

   // INST I2
   assign w_i2z = ~w_n3z;

   // INST N1
   assign w_n1z = ~(in3 | in4 | w_n6z);
   
   // INST N2
   assign w_n2z = ~(w_n6z | in4 | w_i1z);

   // INST N3
   assign w_n3z = ~(w_n2z | w_n5z | in1);

   // INST N4
   assign w_n4z = ~(in1 | w_n1z | w_n5z);

   // INST N5
   assign w_n5z = ~(w_n4z | in4 | in2);

   // INST N6
   assign w_n6z = ~(w_n5z | in2 | w_n1z);
      
   assign q = w_i1z;
   assign qbar = w_n2z;
   
    
endmodule
