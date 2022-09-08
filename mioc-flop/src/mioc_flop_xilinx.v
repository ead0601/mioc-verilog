
module mioc_flop_xilinx(in1, 
                        in2, 
                        in3, 
                        in4, 
                        q, 
                        qb);

   input in1;
   input in2;
   input in3;
   input in4;

   output q;
   output qb;
   
   wire in1_b;
   wire in2_n;
   wire in4_b;
   wire q_DUMMY;
   
   assign q = q_DUMMY;
   (* HU_SET = "XLXI_2_1" *) 
   FDRS_MXILINX_mioc_flop_xilinx #( .INIT(1'b0) ) XLXI_2 (.C(in2_n), 
                                         .D(in3), 
                                         .R(in1_b), 
                                         .S(in4_b), 
                                         .Q(q_DUMMY));
   INV  XLXI_3 (.I(in2), 
               .O(in2_n));
   INV  XLXI_5 (.I(in1), 
               .O(in1_b));
   INV  XLXI_6 (.I(in4), 
               .O(in4_b));
   INV  XLXI_7 (.I(q_DUMMY), 
               .O(qb));

endmodule
