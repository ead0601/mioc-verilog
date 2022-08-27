// mioc-and2-nor
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-and2-nor
//
module mioc_nand4_nor2_nmos(
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

   supply0 GND;

   wire     m1d, m2d, m4d;   
   
   //nmos (drain,source,gate)

   // LEVEL 1
   pullup p1 (m2d);
   
   nmos   m1 (m1d,GND,in1);

   nmos   m2 (m2d,m1d,in2);

   nmos   m3 (m2d,m4d,in3);

   nmos   m4 (m4d,GND,in4);
   
   assign z = m2d;

endmodule
