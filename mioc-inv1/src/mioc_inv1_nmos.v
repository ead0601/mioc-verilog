// mioc-inv1
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-inv1
//
module mioc_inv1_nmos(
    z,

    in1
    );

   output z;

   input  in1;
   input  in2;

   supply0 GND;

   wire    m1d, m2d;
   
   //nmos (drain,source,gate)

   //INV
   pullup p1 (m1d);
   nmos   m1 (m1d,GND,in1);

   assign z = m1d;

endmodule
