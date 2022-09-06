// mioc-flop-mos
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

`timescale 1ns / 1 ns

// mioc-flop-mos
//
module mioc_flop_nmos(
    q,
    qbar,

    in1,            // posedge reset
    in2,            // negedge reset (???)
    in3,            // inverted negedge reset  
    in4             // posedge set
    );

   output q;
   output qbar;

   input  in1;
   input  in2;
   input  in3;
   input  in4;

   supply0 GND;

   wire     m8d, m3d, m5d;
   wire     m2d, m4d, m20d;   
   
   //nmos (drain,source,gate)

   // LEVEL 1
   pullup p2 (m20d);
   
   nmos #1    m1 (m20d,GND,m8d);

   pullup p3 (m2d);
   nmos #1    m2 (m2d,GND,m5d);

   pullup p4 (m3d);
   nmos #1    m3 (m3d,GND,in2);

   pullup p5 (m4d);
   nmos #1    m4 (m4d,GND,m5d);
   
   pullup p6 (m5d);
   nmos #1    m5 (m5d,GND,in3);

   nmos #1    m6 (m5d,GND,in4);

   pullup p7 (m8d);
   nmos #1    m7 (m8d,GND,m20d);

   pullup p1 (m8d);
   pullup p8 (m20d);
   nmos #1    m8 (m8d,GND,m20d);

   // LEVEL 2
   nmos #1    m9 (m20d,GND,m3d);

   nmos #1    m10 (m20d,GND,in1);

   nmos #1    m11 (m2d,GND,in1);

   nmos #1    m12 (m2d,GND,m3d);

   nmos #1    m13 (m3d,GND,m2d);

   nmos #1    m14 (m3d,GND,in4);

   nmos #1    m15 (m4d,GND,in2);

   nmos #1    m16 (m4d,GND,m3d);

   nmos #1    m17 (m5d,GND,m4d);

   nmos #1    m18 (m8d,GND,in4);

   nmos #1    m19 (m8d,GND,m4d);

   nmos #1    m20 (m20d,GND,m8d);

   assign q    = m20d;
   assign qbar = m8d;

endmodule
