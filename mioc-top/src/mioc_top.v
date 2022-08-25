// mioc-top
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-top
//
module mioc_top(
                                 //: pin 1 : VCC  
		
		RA7          ,   //: pin 2 : (goes to U9 , RAM Address 7.This is the multiplexed RAM address MSB.)	    
		BA15         ,	 //: pin 3 : Address line 15								    
		BA14         ,	 //: pin 4 : Address line 14								    
		BA13         ,	 //: pin 5 : Address line 13								    
				                                                                                            
		N_CVRST      ,	 //: pin 6 : Active low reset signal “Game Reset”					    
		BD0          ,	 //: pin 7 : Data line 0								    
		BD1          ,	 //: pin 8 : Data line 1								    
		BD2          ,	 //: pin 9 : Data line 2								    
		BD3          ,	 //: pin10 : Data line 3								    
		N_BWR        ,	 //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated by    
				 //:      by MA5,/IORQ, and A10								    
		BA6          ,	 //: pin12 : Address line 6								    
		BA7          ,	 //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)		    
		IORQ_N       ,	 //: pin14 : Active low Z80 IO Request							    
		WAIT_N       ,	 //: pin15 : Active low wait signal, Memory wait state					    
		BUSAK_N      ,	 //: pin16 : Active low bus acknowledge - Z80 Control					    
		DMA_N        ,	 //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM		    
		BUSRQ_N      ,	 //: pin18 : Active low bus request							    
		SPINDIS_N    ,	 //: pin19 : Active low Controller Spinner Interrupt Disable				    
		NETRST_N     ,	 //: pin20 : Active low - Reset for AdamNET                                                 

                                 //: pin 21 : GND
		
		AUXDECODE1_N ,   //: pin 22 : Active low - Disables the onboard mem decode on CV board?				 
		RST_N        ,	 //: pin 23 : Active low reset - System Reset circuitry						 
		CPRST_N      ,	 //: pin 24 : Active low reset - not used							 
		PBRST_N      ,	 //: pin 25 : Active low ADAM Reset switch for computer mode					 
		AUXROMCS_N   ,	 //: pin 26 : Active low aux rom chip select - Slot 2 Expansion ROM CS				 
		ADDRBUFEN_N  ,	 //: pin 27 : Active low address buffer enable - according to earlier docs, enables/disables	 
				 //:     /BRFSH, /BMREQ, /BM1, and /BIORQ (disabled during DMA cycle)				 
		BOOTROMCS_N  ,	 //: pin 28 : Active low boot ROM chip select - For Smartwriter ROM				 
		EN245_N      ,	 //: pin 29 : Active low 245 enable - CV onboard decode enable/disable?				 
		IS3_N        ,	 //: pin 30 : Active low IS3 To Master 6801							 
		OS3_N        ,	 //: pin 31 : Active low OS3 From Master 6801							 
		BMREQ_N      ,	 //: pin 32 : Active low Buffered Memory Request						 
		BRD_N        ,	 //: pin 33 : Active low Buffered Memory Read							 
		BRFSH_N      ,	 //: pin 34 : Active low Buffered Memory Refresh						 
		BM1_N        ,	 //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.				 
		B_PHI        ,	 //: pin 36 : Z80 Clock										 
		MUX          ,	 //: pin 37 : Output Mux signal for memory address signals for DRAM.				 
		RAS_N        ,	 //: pin 38 : Active low row address strobe							 
		CAS1_N       ,	 //: pin 39 : Active low column address strobe 1						 
		CAS2_N       	 //: pin 40 : Active low column address strobe 2                                                 
		);
   
                         //: pin 1 : VCC  

   output RA7          ; //: pin 2 : (goes to U9 , RAM Address 7.This is the multiplexed RAM address MSB.)	    
   input  BA15         ; //: pin 3 : Address line 15								    
   input  BA14         ; //: pin 4 : Address line 14								    
   input  BA13         ; //: pin 5 : Address line 13								    
	                                                                                                            
   input  N_CVRST      ; //: pin 6 : Active low reset signal “Game Reset”					    
   input  BD0          ; //: pin 7 : Data line 0								    
   input  BD1          ; //: pin 8 : Data line 1								    
   input  BD2          ; //: pin 9 : Data line 2								    
   input  BD3          ; //: pin10 : Data line 3								    
   input  N_BWR        ; //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated by    
                         //:      by MA5,/IORQ, and A10								    
   input  BA6          ; //: pin12 : Address line 6								    
   input  BA7          ; //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)		    
   input  IORQ_N       ; //: pin14 : Active low Z80 IO Request							    
   input  WAIT_N       ; //: pin15 : Active low wait signal, Memory wait state					    
   input  BUSAK_N      ; //: pin16 : Active low bus acknowledge - Z80 Control					    
   input  DMA_N        ; //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM		    
   output BUSRQ_N      ; //: pin18 : Active low bus request							    
   output SPINDIS_N    ; //: pin19 : Active low Controller Spinner Interrupt Disable				    
   output NETRST_N     ; //: pin20 : Active low - Reset for AdamNET                                                  

                         //: pin 21 : GND

   output AUXDECODE1_N ; //: pin 22 : Active low - Disables the onboard mem decode on CV board?				 
   output RST_N        ; //: pin 23 : Active low reset - System Reset circuitry						 
   output CPRST_N      ; //: pin 24 : Active low reset - not used							 
   input  PBRST_N      ; //: pin 25 : Active low ADAM Reset switch for computer mode					 
   output AUXROMCS_N   ; //: pin 26 : Active low aux rom chip select - Slot 2 Expansion ROM CS				 
   output ADDRBUFEN_N  ; //: pin 27 : Active low address buffer enable - according to earlier docs, enables/disables	 
                         //:     /BRFSH, /BMREQ, /BM1, and /BIORQ (disabled during DMA cycle)				 
   output BOOTROMCS_N  ; //: pin 28 : Active low boot ROM chip select - For Smartwriter ROM				 
   output EN245_N      ; //: pin 29 : Active low 245 enable - CV onboard decode enable/disable?				 
   output IS3_N        ; //: pin 30 : Active low IS3 To Master 6801							 
   input  OS3_N        ; //: pin 31 : Active low OS3 From Master 6801							 
   input  BMREQ_N      ; //: pin 32 : Active low Buffered Memory Request						 
   input  BRD_N        ; //: pin 33 : Active low Buffered Memory Read							 
   input  BRFSH_N      ; //: pin 34 : Active low Buffered Memory Refresh						 
   input  BM1_N        ; //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.				 
   input  B_PHI        ; //: pin 36 : Z80 Clock										 
   output MUX          ; //: pin 37 : Output Mux signal for memory address signals for DRAM.				 
   output RAS_N        ; //: pin 38 : Active low row address strobe							 
   output CAS1_N       ; //: pin 39 : Active low column address strobe 1						 
   output CAS2_N       ; //: pin 40 : Active low column address strobe 2                                                 

   // OUTPUT WIRES
   wire  RA7           ; //: pin 2 : (goes to U9 , RAM Address 7.This is the multiplexed RAM address MSB.)
   wire  BUSRQ_N       ; //: pin18 : Active low bus request
   wire  SPINDIS_N     ; //: pin19 : Active low Controller Spinner Interrupt Disable
   wire  NETRST_N      ; //: pin20 : Active low - Reset for AdamNET
   wire  AUXDECODE1_N  ; //: pin 22 : Active low - Disables the onboard mem decode on CV board?
   wire  RST_N         ; //: pin 23 : Active low reset - System Reset circuitry
   wire  CPRST_N       ; //: pin 24 : Active low reset - not used
   wire  AUXROMCS_N    ; //: pin 26 : Active low aux rom chip select - Slot 2 Expansion ROM CS
   wire  ADDRBUFEN_N   ; //: pin 27 : Active low address buffer enable - according to earlier docs, enables/disables
                         //:     /BRFSH, /BMREQ, /BM1, and /BIORQ (disabled during DMA cycle)
   wire  BOOTROMCS_N   ; //: pin 28 : Active low boot ROM chip select - For Smartwriter ROM
   wire  EN245_N       ; //: pin 29 : Active low 245 enable - CV onboard decode enable/disable?
   wire  IS3_N         ; //: pin 30 : Active low IS3 To Master 6801
   wire  MUX           ; //: pin 37 : Output Mux signal for memory address signals for DRAM.
   wire  RAS_N         ; //: pin 38 : Active low row address strobe
   wire  CAS1_N        ; //: pin 39 : Active low column address strobe 1
   wire  CAS2_N        ; //: pin 40 : Active low column address strobe 2


   // INPUT WIRES - POST IO PAD (pi = post "pad internal")
   //
   // IOPADS have two outputs each: BUF = INV + INV , so either the buffered or inverted signal is used.
   // re-asignment occurs below in the wire assignment section
   //
   wire  pi_BA15          ; //: pin 3 : Address line 15
   wire  pi_BA14          ; //: pin 4 : Address line 14
   wire  pi_BA13          ; //: pin 5 : Address line 13
   wire  pi_N_CVRST       ; //: pin 6 : Active low reset signal “Game Reset”
   wire  pi_BD0           ; //: pin 7 : Data line 0
   wire  pi_BD1           ; //: pin 8 : Data line 1
   wire  pi_BD2           ; //: pin 9 : Data line 2
   wire  pi_BD3           ; //: pin10 : Data line 3
   wire  pi_N_BWR         ; //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated by MA5,/IORQ, and A10
   wire  pi_BA6           ; //: pin12 : Address line 6
   wire  pi_BA7           ; //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)
   wire  pi_IORQ_N        ; //: pin14 : Active low Z80 IO Request
   wire  pi_WAIT_N        ; //: pin15 : Active low wait signal, Memory wait state
   wire  pi_BUSAK_N       ; //: pin16 : Active low bus acknowledge - Z80 Control
   wire  pi_DMA_N         ; //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM
   wire  pi_PBRST_N       ; //: pin 25 : Active low ADAM Reset switch for computer mode
   wire  pi_OS3_N         ; //: pin 31 : Active low OS3 From Master 6801
   wire  pi_BMREQ_N       ; //: pin 32 : Active low Buffered Memory Request
   wire  pi_BRD_N         ; //: pin 33 : Active low Buffered Memory Read
   wire  pi_BRFSH_N       ; //: pin 34 : Active low Buffered Memory Refresh
   wire  pi_BM1_N         ; //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.
   wire  pi_B_PHI         ; //: pin 36 : Z80 Clock
   
   // SOC BLOCK NAMES ( temp here for reference of module names )
   //    
   // mioc_nor3_nmos 
   // mioc_flop_rtl     (q is port on the right)
   // mioc_xnor2_nmos 
   // mioc_and2_nor_nmos 
   // mioc_nand2_nmos 
   // mioc_inv1_nmos 
   // mioc_nor2_nmos 

   // INTERNAL COMPONENT WIRES
   //
   wire  w_u1q, w_u1qb;           // u1 output wires 
   wire  w_u2q, w_u2qb;           // u2 output wires 
   wire  w_u3z;
   wire  w_u4z;
   wire  w_u5z;
   wire  w_u6z;
   wire  w_u7z;
   wire  w_u8z;   
   wire  w_u9z;
   wire  w_u10z;
   wire  w_u11z;
   wire  w_u12z;      
   wire  w_u13z;
   wire  w_u14q, w_u14qb;               

   wire  w_u18z;
   wire  w_u20z;
   wire  w_u23z;   
   wire  w_u24z;      
   wire  w_u25z;
   wire  w_u35z;
   wire  w_u39z;   
   wire  w_u42z;
   wire  w_u48z;      
   wire  w_u49z;
   wire  w_u50z;   
   wire  w_u53z;
   wire  w_u63z;   
   wire  w_u76z;
   wire  w_u79z;      
   wire  w_u86z;
   wire  w_u88z;
   wire  w_u89z;
   wire  w_u94z;         
   
  
   // COMPONENTS
   //

   // ################################### ROW 1 #############################
   //
   mioc_flop_rtl  u1 (.q(w_u1q),
		      .qbar(w_u1qb),

		      .in1(pi_PBRST_N),    // posedge reset	     
		      .in2(w_u39z),        // negedge reset (???)   
		      .in3(pi_BD3),        // inverted negedge reset
		      .in4(pi_BA13)        // posedge set           
		     );

   mioc_flop_rtl  u2 (.q(w_u2q),      
		      .qbar(w_u2q),

		      .in1(pi_PBRST_N),    // posedge reset	     
		      .in2(w_u39z),        // negedge reset (???)   
		      .in3(pi_BD2),	   // inverted negedge reset
		      .in4(pi_BA13)	   // posedge set           
	              );

   mioc_nor2_nmos u3 (.z(w_u3z),
		      .in1(pi_BA13),
		      .in2(pi_BA14)
		      );

   mioc_inv1_nmos u4 (.z(w_u4z),
		      .in1(w_u3z)
		      );

   mioc_nand2_nmos u5 (.z(w_u5z),
		       .in1(w_u4z),
		       .in2(w_u20z)
		       );
   
   mioc_nor2_nmos u6 (.z(w_u6z),
		      .in1(w_u25z),
		      .in2(w_u18z)
		      );

   mioc_inv1_nmos u7 (.z(w_u7z),
		      .in1(w_u6z)
		      ); 

   mioc_nand2_nmos u8 (.z(w_u8z),
		       .in1(w_u24z),
		       .in2(w_u7z)
		       );
   
   mioc_nand2_nmos u9 (.z(w_u9z),
		       .in1(w_u24z),
		       .in2(w_u10z)
		       );   
   
   mioc_inv1_nmos u10 (.z(w_u10z),
		      .in1(w_u13z)
		      );
   
   mioc_inv1_nmos u11 (.z(w_u11z),
		      .in1(pi_BA15)
		      );

   mioc_nor2_nmos u12 (.z(w_u12z),
		      .in1(w_u48z),
		      .in2(w_u11z)
		      );

   mioc_nor2_nmos u13 (.z(w_u13z),
		      .in1(w_u35z),
		      .in2(w_u48z)
		      );
   
   mioc_flop_rtl  u14 (.q(w_u14q),
		      .qbar(w_u14qb),

		      .in1(),              // posedge reset	     
		      .in2(pi_B_PHI),      // negedge reset (???)   
		      .in3(w_u49z),        // inverted negedge reset
		      .in4(pi_BRFSH_N)     // posedge set           
		     );
      

   // ################################### ROW 2 #############################
   //
   


   
   // WIRE ASSIGNMENTS
   //

   // OUTPUT ASSIGNMENTS
   //
   assign RA7           = w_u23z;   //: pin 2 : (goes to U9 , RAM Address 7.This is the multiplexed RAM address MSB.)	       
   assign BUSRQ_N       = w_u86z;   //: pin18 : Active low bus request
   assign SPINDIS_N     = w_u88z;   //: pin19 : Active low Controller Spinner Interrupt Disable
   assign NETRST_N      = w_u89z;   //: pin20 : Active low - Reset for AdamNET
   assign AUXDECODE1_N  = w_u42z;   //: pin 22 : Active low - Disables the onboard mem decode on CV board?
   assign RST_N         = w_u53z;   //: pin 23 : Active low reset - System Reset circuitry
   assign CPRST_N       = w_u94z;   //: pin 24 : Active low reset - not used
   assign AUXROMCS_N    = w_u48z;   //: pin 26 : Active low aux rom chip select - Slot 2 Expansion ROM CS
   assign ADDRBUFEN_N   = w_u50z;   //: pin 27 : Active low address buffer enable - according to earlier docs, enables/disables
                                    //:     /BRFSH, /BMREQ, /BM1, and /BIORQ (disabled during DMA cycle)
   assign BOOTROMCS_N   = w_u76z;   //: pin 28 : Active low boot ROM chip select - For Smartwriter ROM
   assign EN245_N       = w_u79z;   //: pin 29 : Active low 245 enable - CV onboard decode enable/disable?
   assign IS3_N         = w_u63z;   //: pin 30 : Active low IS3 To Master 6801
   assign MUX           = w_u14qb;  //: pin 37 : Output Mux signal for memory address signals for DRAM.
   assign RAS_N         = w_u49z;   //: pin 38 : Active low row address strobe
   assign CAS1_N        = w_u9z;    //: pin 39 : Active low column address strobe 1
   assign CAS2_N        = w_u8z;    //: pin 40 : Active low column address strobe 2

   // INPUT ASSIGNMENTS 
   //   
   // IOPADS have two outputs each: BUF = INV + INV , so either the buffered or inverted signal is used.
   //
   assign  pi_BA15     = BA15      ; //: pin 3 : Address line 15
   assign  pi_BA14     = BA14      ; //: pin 4 : Address line 14
   assign  pi_BA13     = BA13      ; //: pin 5 : Address line 13
   assign  pi_N_CVRST  = N_CVRST   ; //: pin 6 : Active low reset signal “Game Reset”
   assign  pi_BD0      = BD0       ; //: pin 7 : Data line 0
   assign  pi_BD1      = BD1       ; //: pin 8 : Data line 1
   assign  pi_BD2      = BD2       ; //: pin 9 : Data line 2
   assign  pi_BD3      = BD3       ; //: pin10 : Data line 3
   assign  pi_N_BWR    = N_BWR     ; //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated by MA5,/IORQ, and A10
   assign  pi_BA6      = BA6       ; //: pin12 : Address line 6
   assign  pi_BA7      = BA7       ; //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)
   assign  pi_IORQ_N   = IORQ_N    ; //: pin14 : Active low Z80 IO Request
   assign  pi_WAIT_N   = WAIT_N    ; //: pin15 : Active low wait signal, Memory wait state
   assign  pi_BUSAK_N  = BUSAK_N   ; //: pin16 : Active low bus acknowledge - Z80 Control
   assign  pi_DMA_N    = DMA_N     ; //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM
   assign  pi_PBRST_N  = PBRST_N   ; //: pin 25 : Active low ADAM Reset switch for computer mode
   assign  pi_OS3_N    = OS3_N     ; //: pin 31 : Active low OS3 From Master 6801
   assign  pi_BMREQ_N  = BMREQ_N   ; //: pin 32 : Active low Buffered Memory Request
   assign  pi_BRD_N    = BRD_N     ; //: pin 33 : Active low Buffered Memory Read
   assign  pi_BRFSH_N  = BRFSH_N   ; //: pin 34 : Active low Buffered Memory Refresh
   assign  pi_BM1_N    = BM1_N     ; //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.
   assign  pi_B_PHI    = B_PHI     ; //: pin 36 : Z80 Clock
   
endmodule
