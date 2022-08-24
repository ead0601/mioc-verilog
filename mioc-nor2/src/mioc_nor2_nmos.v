// mioc-and2-nor
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-nor2
//
module mioc_nor2_nmos(
    z,

    in1,            
    in2            
    );

   output z;

   input  in1;
   input  in2;

   supply0 GND;

   wire     m1d;   
   
   //nmos (drain,source,gate)

   // LEVEL 1
   pullup p1 (m1d);
   
   nmos   m1 (m1d,GND,in1);

   nmos   m2 (m1d,GND,in2);

   assign z = m1d;

endmodule
