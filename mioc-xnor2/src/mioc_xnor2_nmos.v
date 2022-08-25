// mioc-xnor2
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-xnor2
//
module mioc_xnor2_nmos(
    z,

    in1,            
    in2            
    );

   output z;

   input  in1;
   input  in2;

   supply0 GND;

   wire    m1d, m3d, m5d, m7d;   
   
   //nmos (drain,source,gate)

   //NOR1
   pullup p1 (m1d);
   nmos   m1 (m1d,GND,in1);
   nmos   m2 (m1d,GND,in2);

   //NOR2
   pullup p2 (m3d);   
   nmos   m3 (m3d,GND,in1);
   nmos   m4 (m3d,GND,m1d);

   //NOR3
   pullup p3 (m5d);      
   nmos   m5 (m5d,GND,in2);
   nmos   m6 (m5d,GND,m1d);

   //NOR4
   pullup p4 (m7d);      
   nmos   m7 (m7d,GND,m3d);
   nmos   m8 (m7d,GND,m5d);
   
   assign z = m7d;

endmodule
