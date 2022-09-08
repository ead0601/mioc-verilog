// mioc-inv1
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-inv1
//
module mioc_inv1_rtl(
    z,

    in1
    );

   output z;

   input  in1;

   assign z = ~in1;

endmodule
