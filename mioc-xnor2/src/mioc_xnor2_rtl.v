// mioc-xnor2
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-xnor2
//
module mioc_xnor2_rtl(
    z,

    in1,            
    in2            
    );

   output z;

   input  in1;
   input  in2;

   assign z = ~(in1 ^ in2);

endmodule
