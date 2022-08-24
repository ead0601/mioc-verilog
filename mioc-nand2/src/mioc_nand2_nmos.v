// mioc-nand2
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-nand2
//
module mioc_nand2_nmos(
    z,

    in1,            
    in2            
    );

   output z;

   input  in1;
   input  in2;

   supply0 GND;

   wire    m1d, m2d;
   
   //nmos (drain,source,gate)

   //NAND
   pullup p1 (m2d);
   nmos   m1 (m1d,GND,in1);
   nmos   m2 (m2d,m1d,in2);

   assign z = m2d;

endmodule
