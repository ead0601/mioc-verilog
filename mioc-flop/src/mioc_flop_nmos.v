// mioc-flop-mos
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-flop-mos
//
module mioc_flop_nmos(
    q,
    qbar,

    in1,
    in2,
    in3,
    in4);

   output q;
   output qbar;

   input  in1;
   input  in2;
   input  in3;
   input  in4;

   supply0 GND;

   //tri     m1d, m2d, m3d, m4d, m5d, m6d, m7d, m8d;
   //tri     m14d, m16d, m18d, m20d;

   tri1    m8d, m3d, m5d;
   tri0    m2d, m4d, m20d;
   
   //nmos (drain,source,gate)

   // LEVEL 1
   pullup p2 (m20d);
   
   nmos   m1 (m20d,GND,m8d);

   pullup p3 (m2d);
   nmos   m2 (m2d,GND,m5d);

   pullup m3 (m3d);
   nmos   m3 (m3d,GND,in2);

   pullup p5 (m4d);
   nmos   m4 (m4d,GND,m5d);
   
   pullup p6 (m5d);
   nmos   m5 (m5d,GND,in3);

   nmos   m6 (m5d,GND,in4);

   pullup p7 (m8d);
   nmos   m7 (m8d,GND,m20d);

   pullup p1 (m8d);
   pullup p8 (m20d);
   nmos   m8 (m8d,GND,m20d);

   // LEVEL 2
   nmos   m9 (m20d,GND,m3d);

   nmos   m10 (m20d,GND,in1);

   nmos   m11 (m2d,GND,in1);

   nmos   m12 (m2d,GND,m3d);

   nmos   m13 (m3d,GND,m2d);

   nmos   m14 (m3d,GND,in4);

   nmos   m15 (m4d,GND,in2);

   nmos   m16 (m4d,GND,m3d);

   nmos   m17 (m5d,GND,m4d);

   nmos   m18 (m8d,GND,in4);

   nmos   m19 (m8d,GND,m4d);

   nmos   m20 (m20d,GND,m8d);

   assign qbar = m20d;
   assign q    = m8d;

endmodule
