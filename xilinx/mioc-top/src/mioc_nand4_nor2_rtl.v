// mioc-and2-nor
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-and2-nor
//
module mioc_nand4_nor2_rtl(
    z,

    in1,            
    in2,            
    in3,            
    in4             
    );

   output z;

   input  in1;
   input  in2;
   input  in3;
   input  in4;

   assign z = ~( ~(in1 & in2) | ~(in3 & in4) );

endmodule
