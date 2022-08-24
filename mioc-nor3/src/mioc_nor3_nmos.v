// mioc-nor3
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-nor3
//
module mioc_nor3_nmos(
    z,

    in1,            
    in2,
    in3		      
    );

   output z;

   input  in1;
   input  in2;
   input  in3;   

   supply0 GND;

   wire     m1d;   
   
   //nmos (drain,source,gate)

   // LEVEL 1
   pullup p1 (m1d);
   
   nmos   m1 (m1d,GND,in1);

   nmos   m2 (m1d,GND,in2);

   nmos   m3 (m1d,GND,in3);   

   assign z = m1d;

endmodule
