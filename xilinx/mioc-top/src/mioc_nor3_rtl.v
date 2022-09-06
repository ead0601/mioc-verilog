// mioc-nor3
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-nor3
//
module mioc_nor3_rtl(
    z,

    in1,            
    in2,
    in3		      
    );

   output z;

   input  in1;
   input  in2;
   input  in3;   

   assign z = ~(in1 | in2 | in3);

endmodule
