////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : sch2hdl
//  /   /         Filename : mioc_flop_xilinx.vf
// /___/   /\     Timestamp : 09/08/2022 10:33:32
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: /build/tools/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family xc9500xl -verilog mioc_flop_xilinx.vf -w /build/repo/mioc-verilog/xilinx/mioc-top/mioc_flop_xilinx.sch
//Design Name: mioc_flop_xilinx
//Device: xc9500xl
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module FD_MXILINX_mioc_flop_xilinx(C, 
                                   D, 
                                   Q);

   parameter INIT = 1'b0;
   
    input C;
    input D;
   output Q;
   
   wire XLXN_4;
   
   GND  I_36_43 (.G(XLXN_4));
   FDCP  U0 (.C(C), 
            .CLR(XLXN_4), 
            .D(D), 
            .PRE(XLXN_4), 
            .Q(Q));
endmodule
`timescale 1ns / 1ps

module FDRS_MXILINX_mioc_flop_xilinx(C, 
                                     D, 
                                     R, 
                                     S, 
                                     Q);

   parameter INIT = 1'b0;
   
    input C;
    input D;
    input R;
    input S;
   output Q;
   
   wire XLXN_6;
   wire XLXN_7;
   wire XLXN_8;
   
   AND2B1  I_36_112 (.I0(R), 
                    .I1(S), 
                    .O(XLXN_6));
   AND2B1  I_36_113 (.I0(R), 
                    .I1(D), 
                    .O(XLXN_8));
   OR2  I_36_120 (.I0(XLXN_6), 
                 .I1(XLXN_8), 
                 .O(XLXN_7));
   (* HU_SET = "U0_0" *) 
   FD_MXILINX_mioc_flop_xilinx  U0 (.C(C), 
                                   .D(XLXN_7), 
                                   .Q(Q));
endmodule
`timescale 1ns / 1ps

module mioc_flop_xilinx (in1, 
                        in2, 
                        in3, 
                        in4, 
                        q, 
                        qbar);

    input in1;
    input in2;
    input in3;
    input in4;
   output q;
   output qbar;
   
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
               .O(qbar));
endmodule
