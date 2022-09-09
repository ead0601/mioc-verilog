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
   wire  PIN_IN_3         ; //: pin 3 : Address line 15
   wire  PIN_IN_4         ; //: pin 4 : Address line 14
   wire  PIN_IN_5         ; //: pin 5 : Address line 13
   wire  PIN_IN_6         ; //: pin 6 : Active low reset signal “Game Reset”
   wire  PIN_IN_7         ; //: pin 7 : Data line 0
   wire  PIN_IN_8         ; //: pin 8 : Data line 1
   wire  PIN_IN_9         ; //: pin 9 : Data line 2
   wire  PIN_IN_10        ; //: pin10 : Data line 3
   wire  PIN_IN_11        ; //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated by MA5,/IORQ, and A10
   wire  PIN_IN_12        ; //: pin12 : Address line 6
   wire  PIN_IN_13        ; //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)
   wire  PIN_IN_13B       ; //: pin13 : INVERTED Address line 7 (according to earlier docs, gated by /ADDRBUFEN)   
   wire  PIN_IN_14        ; //: pin14 : Active low Z80 IO Request
   wire  PIN_IN_15        ; //: pin15 : Active low wait signal, Memory wait state
   wire  PIN_IN_16        ; //: pin16 : Active low bus acknowledge - Z80 Control
   wire  PIN_IN_17        ; //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM
   wire  PIN_IN_25        ; //: pin 25 : Active low ADAM Reset switch for computer mode
   wire  PIN_IN_31        ; //: pin 31 : Active low OS3 From Master 6801
   wire  PIN_IN_32        ; //: pin 32 : Active low Buffered Memory Request
   wire  PIN_IN_33        ; //: pin 33 : Active low Buffered Memory Read
   wire  PIN_IN_34        ; //: pin 34 : Active low Buffered Memory Refresh
   wire  PIN_IN_35        ; //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.
   wire  PIN_IN_36        ; //: pin 36 : Z80 Clock
   
   // SOC BLOCK NAMES ( temp here for reference of module names )
   //    
   // mioc_nor3_rtl 
   // mioc_flop_xilinx     (q is port on the right)
   // mioc_xnor2_rtl 
   // mioc_nand4_nor2_rtl 
   // mioc_nand2_rtl 
   // mioc_inv1_rtl 
   // mioc_nor2_rtl 

   // INTERNAL COMPONENT WIRES
   //

   // row 1
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

   // row 2
   wire  w_u17q, w_u17qb;                  
   wire  w_u18z;
   wire  w_u19z;   
   wire  w_u20z;
   wire  w_u21z;
   wire  w_u22z;      
   wire  w_u23z;   
   wire  w_u24z;  
   wire  w_u25z;
   wire  w_u26z;   
   wire  w_u27z;	 
   wire  w_u28z;
   wire  w_u29z;
   wire  w_u30z;
   wire  w_u31z;
   wire  w_u32z;           
   wire  w_u33z;
   wire  w_u34z;                  
   wire  w_u35z;

   // row 3
   wire  w_u37z;   
   wire  w_u38q, w_u38qb;  
   wire  w_u39z;
   wire  w_u40z;
   wire  w_u41z;   
   wire  w_u42z;
   wire  w_u43q, w_u43qb;     
   wire  w_u44z;
   wire  w_u45q, w_u45qb;        
   wire  w_u46z;
   wire  w_u47z;
   wire  w_u48z;
   wire  w_u49z;            
   wire  w_u50z;

   // row 4
   wire  w_u52z;      
   wire  w_u53z;
   wire  w_u54q, w_u54qb;   
   wire  w_u55z;
   wire  w_u56z;   
   wire  w_u57q, w_u57qb;      
   wire  w_u58z;
   wire  w_u59z;
   wire  w_u60q, w_u60qb;         
   wire  w_u61z;
   wire  w_u62z;
   wire  w_u63z;      

   // row 4
   wire  w_u65z;         
   wire  w_u66z;
   wire  w_u67z;
   wire  w_u69z;
   wire  w_u70z;
   wire  w_u71z;         
   wire  w_u72z;         
   wire  w_u73z;         
   wire  w_u74z;         
   wire  w_u75z;         
   wire  w_u76z;            
   wire  w_u77q, w_u77qb;      
   wire  w_u78z;         
   wire  w_u79z;
   wire  w_u80z;
   wire  w_u81z;   
   wire  w_u82z;   
   wire  w_u83z;   
   wire  w_u84z;      

   // row 5
   wire  w_u85z;
   wire  w_u86z;
   wire  w_u87z;
   wire  w_u88q, w_u88qb;         
   wire  w_u89z;
   wire  w_u90q, w_u90qb;            
   wire  w_u91z;
   wire  w_u92q, w_u92qb;            
   wire  w_u93q, w_u93qb;               
   wire  w_u94z;            
   
 
   // COMPONENTS
   //

   // ################################### ROW 1 #############################
   //
   mioc_flop_xilinx  u1 (.q(w_u1q),
		      .qbar(w_u1qb),

		      .in1(PIN_IN_25),      // posedge reset	     
		      .in2(w_u39z),         // negedge reset (???)   
		      .in3(PIN_IN_10),      // inverted negedge reset
		      .in4(PIN_IN_6)        // posedge set           
		     );

   mioc_flop_xilinx  u2 (.q(w_u2q),      
		      .qbar(w_u2qb),

		      .in1(PIN_IN_25),     // posedge reset	     
		      .in2(w_u39z),        // negedge reset (???)   
		      .in3(PIN_IN_9),	   // inverted negedge reset
		      .in4(PIN_IN_6)	   // posedge set           
	              );

   mioc_nor2_rtl u3 (.z(w_u3z),
		      .in1(PIN_IN_5),
		      .in2(PIN_IN_4)
		      );

   mioc_inv1_rtl u4 (.z(w_u4z),
		      .in1(w_u3z)
		      );

   mioc_nand2_rtl u5 (.z(w_u5z),
		       .in1(w_u4z),
		       .in2(w_u20z)
		       );
   
   mioc_nor2_rtl u6 (.z(w_u6z),
		      .in1(w_u25z),
		      .in2(w_u18z)
		      );

   mioc_inv1_rtl u7 (.z(w_u7z),
		      .in1(w_u6z)
		      ); 

   mioc_nand2_rtl u8 (.z(w_u8z),
		       .in1(w_u24z),
		       .in2(w_u7z)
		       );
   
   mioc_nand2_rtl u9 (.z(w_u9z),
		       .in1(w_u24z),
		       .in2(w_u10z)
		       );   
   
   mioc_inv1_rtl u10 (.z(w_u10z),
		      .in1(w_u13z)
		      );
   
   mioc_inv1_rtl u11 (.z(w_u11z),
		      .in1(PIN_IN_3)
		      );

   mioc_nor2_rtl u12 (.z(w_u12z),
		      .in1(w_u48z),
		      .in2(w_u11z)
		      );

   mioc_nor2_rtl u13 (.z(w_u13z),
		      .in1(w_u35z),
		      .in2(w_u48z)
		      );
   
   mioc_flop_xilinx  u14 (.q(w_u14q),
		      .qbar(w_u14qb),

		      .in1(1'b0),          // posedge reset	     
		      .in2(PIN_IN_36),     // negedge reset (???)   
		      .in3(w_u49z),        // inverted negedge reset
		      .in4(PIN_IN_34)      // posedge set           
		     );   
      

   // ################################### ROW 2 #############################
   //
   mioc_flop_xilinx  u17 (.q(w_u17q),
		       .qbar(w_u17qb),
		       
		       .in1(PIN_IN_25),     // posedge reset	     
		       .in2(w_u39z),        // negedge reset (???)   
		       .in3(PIN_IN_7),      // inverted negedge reset
		       .in4(PIN_IN_6)       // posedge set           
		     );

   mioc_nor3_rtl u18 (.z(w_u18z),
		      .in1(w_u38qb),
		      .in2(w_u17q),
		      .in3(w_u19z)
		      );

   mioc_inv1_rtl u19 (.z(w_u19z),
		      .in1(w_u31z)
		      );

   mioc_nor3_rtl u20 (.z(w_u20z),
		      .in1(w_u38qb),
		      .in2(w_u17qb),
		      .in3(w_u19z)
		      );

   mioc_inv1_rtl u21 (.z(w_u21z),
		      .in1(w_u26z)
		      );

   mioc_nand2_rtl u22 (.z(w_u22z),
		       .in1(w_u3z),
		       .in2(w_u20z)
		       );      

   mioc_xnor2_rtl u23 (.z(w_u23z),
                        .in1(PIN_IN_13),    // ############# PIN 13 ############
                        .in2(w_u44z)
			);

   mioc_inv1_rtl u24 (.z(w_u24z),
		      .in1(w_u56z)
		      );

   mioc_nor3_rtl u25 (.z(w_u25z),
		      .in1(w_u1qb),
		      .in2(w_u2q),
		      .in3(w_u28z)
		      );
   
   mioc_nor3_rtl u26 (.z(w_u26z),
		      .in1(w_u1qb),
		      .in2(w_u2qb),
		      .in3(w_u28z)
		      );

   mioc_nor3_rtl u27 (.z(w_u27z),
		      .in1(w_u1q),
		      .in2(w_u2qb),
		      .in3(w_u28z)
		      );

   mioc_inv1_rtl u28 (.z(w_u28z),
		      .in1(w_u12z)
		      );   
   
   mioc_nand2_rtl u29 (.z(w_u29z),
		       .in1(w_u75z),
		       .in2(w_u60q)
		       );      

   mioc_nor3_rtl u30 (.z(w_u30z),
		      .in1(w_u1q),
		      .in2(w_u2q),
		      .in3(w_u28z)
		      );

   mioc_xnor2_rtl u31 (.z(w_u31z),
                        .in1(PIN_IN_3),
                        .in2(w_u48z)
			);   

   mioc_inv1_rtl u32 (.z(w_u32z),
		      .in1(w_u5z)
		      );   

   mioc_inv1_rtl u33 (.z(w_u33z),
		      .in1(PIN_IN_36)
		      );

   mioc_nor3_rtl u34 (.z(w_u34z),
		      .in1(w_u30z),
		      .in2(w_u32z),
		      .in3(w_u41z)
		      );   
   
   mioc_inv1_rtl u35 (.z(w_u35z),
		      .in1(w_u34z)
		      );
   
   
   // ################################### ROW 3 #############################
   //
   mioc_nand2_rtl u37 (.z(w_u37z),
		       .in1(PIN_IN_15),
		       .in2(PIN_IN_14)
		       );

   mioc_flop_xilinx  u38 (.q(w_u38q),
		       .qbar(w_u38qb),
		       
		       .in1(PIN_IN_25),     // posedge reset	     
		       .in2(w_u39z),        // negedge reset (???)   
		       .in3(PIN_IN_8),      // inverted negedge reset
		       .in4(PIN_IN_6)       // posedge set           
		     );
   
   mioc_inv1_rtl u39 (.z(w_u39z),
		      .in1(w_u52z)
		      );


   mioc_inv1_rtl u40 (.z(w_u40z),
		      .in1(w_u55z)
		      );

   mioc_nor3_rtl u41 (.z(w_u41z),
		      .in1(w_u38q),
		      .in2(w_u17qb),
		      .in3(w_u19z)
		      );
   
   mioc_nand2_rtl u42 (.z(w_u42z),
		       .in1(w_u21z),
		       .in2(w_u22z)
		       );

   mioc_flop_xilinx  u43 (.q(w_u43q),
		       .qbar(w_u43qb),
		       
		       .in1(w_u91z),        // posedge reset	     
		       .in2(w_u57qb),       // negedge reset (???)   
		       .in3(w_u43qb),       // inverted negedge reset
		       .in4(1'b0)           // posedge set           
		     );

   mioc_nor2_rtl u44 (.z(w_u44z),
		       .in1(w_u60q),
		       .in2(w_u43qb)		       
		      );

   mioc_flop_xilinx  u45 (.q(w_u45q),
		       .qbar(w_u45qb),
		       
		       .in1(1'b0),         // posedge reset	     
		       .in2(w_u33z),       // negedge reset (???)   
		       .in3(w_u14q),       // inverted negedge reset
		       .in4(w_u75z)        // posedge set           
		     );

   mioc_inv1_rtl u46 (.z(w_u46z),
		      .in1(w_u47z)
		      );

   mioc_nor2_rtl u47 (.z(w_u47z),
		       .in1(w_u54qb),
		       .in2(PIN_IN_36)		       
		      );

   mioc_inv1_rtl u48 (.z(w_u48z),
		      .in1(w_u78z)
		      );

   mioc_nand2_rtl u49 (.z(w_u49z),
		       .in1(w_u77q),
		       .in2(w_u29z)
		       );

   mioc_inv1_rtl u50 (.z(w_u50z),
		      .in1(w_u27z)
		      );

   
   // ################################### ROW 4 #############################
   //
   mioc_nand2_rtl u52 (.z(w_u52z),
		       .in1(PIN_IN_12),
		       .in2(w_u65z)
		       );
   
   mioc_nor2_rtl u53 (.z(w_u53z),
		       .in1(PIN_IN_6),
		       .in2(PIN_IN_25)		       
		      );

   
   mioc_flop_xilinx  u54 (.q(w_u54q),
		       .qbar(w_u54qb),
		       
		       .in1(1'b0),         // posedge reset	     
		       .in2(w_u46z),       // negedge reset (???)   
		       .in3(w_u37z),       // inverted negedge reset
		       .in4(w_u86z)        // posedge set           
		     );
   
   mioc_nor3_rtl u55 (.z(w_u55z),
		      .in1(w_u38q),
		      .in2(w_u17q),
		      .in3(w_u19z)
		      );

   mioc_nand2_rtl u56 (.z(w_u56z),
		       .in1(w_u72z),
		       .in2(w_u73z)
		       );
   
   mioc_flop_xilinx  u57 (.q(w_u57q),
		       .qbar(w_u57qb),
		       
		       .in1(w_u91z),        // posedge reset	     
		       .in2(w_u60qb),       // negedge reset (???)   
		       .in3(PIN_IN_12),     // inverted negedge reset
		       .in4(1'b0)           // posedge set           
		     );

   mioc_nor2_rtl u58 (.z(w_u58z),
		       .in1(w_u75z),
		       .in2(w_u40z)		       
		      );

   mioc_nor2_rtl u59 (.z(w_u59z),
		       .in1(w_u45q),
		       .in2(w_u14qb)		       
		      );
   
   mioc_flop_xilinx  u60 (.q(w_u60q),
		       .qbar(w_u60qb),
		       
		       .in1(1'b0),           // posedge reset	     
		       .in2(PIN_IN_36),       // negedge reset (???)   
		       .in3(w_u62z),         // inverted negedge reset
		       .in4(w_u91z)          // posedge set           
		     );

   mioc_nor2_rtl u61 (.z(w_u61z),
		       .in1(w_u78z),
		       .in2(w_u77q)		       
		      );   

  mioc_inv1_rtl u62 (.z(w_u62z),
		      .in1(w_u84z)
		      );

  mioc_inv1_rtl u63 (.z(w_u63z),
		      .in1(w_u61z)
		      );

   
   // ################################### ROW 5 #############################
   //
   mioc_nor2_rtl u65 (.z(w_u65z),
		       .in1(PIN_IN_11),
		       .in2(w_u67z)		       
		      );

   mioc_inv1_rtl u66 (.z(w_u66z),
		      .in1(PIN_IN_12)
		      );   

   mioc_nand2_rtl u67 (.z(w_u67z),
		       .in1(PIN_IN_13B),   // ############# PIN 13 ############
		       .in2(PIN_IN_14)
		       );

   mioc_nor2_rtl u69 (.z(w_u69z),
		       .in1(w_u86z),
		       .in2(w_u54q)		       
		      );

   mioc_nand2_rtl u70 (.z(w_u70z),
		       .in1(w_u67z), 
		       .in2(w_u89z)
		       );

   mioc_inv1_rtl u71 (.z(w_u71z),
		      .in1(w_u83z)
		      );      
   
   mioc_nor2_rtl u72 (.z(w_u72z),
		       .in1(PIN_IN_11),
		       .in2(w_u45q)		       
		      );

   mioc_nor2_rtl u73 (.z(w_u73z),
		       .in1(w_u71z),
		       .in2(w_u45q)		       
		      );

   mioc_nor2_rtl u74 (.z(w_u74z),
		       .in1(w_u75z),
		       .in2(w_u42z)		       
		      );
   
   mioc_inv1_rtl u75 (.z(w_u75z),
		      .in1(w_u81z)
		      );      

   mioc_inv1_rtl u76 (.z(w_u76z),
		      .in1(w_u58z)
		      );      
   

   mioc_flop_xilinx  u77 (.q(w_u77q),
		       .qbar(w_u77qb),
		       
		       .in1(1'b0),           // posedge reset	     
		       .in2(w_u33z),         // negedge reset (???)   
		       .in3(w_u45q),         // inverted negedge reset
		       .in4(w_u91z)          // posedge set           
		     );

   mioc_nor2_rtl u78 (.z(w_u78z),
		       .in1(PIN_IN_16),
		       .in2(w_u69z)		       
		      );

   mioc_nand2_rtl u79 (.z(w_u79z),
		       .in1(w_u70z),
		       .in2(w_u78z)		       
		      );
   
   mioc_inv1_rtl u80 (.z(w_u80z),
		      .in1(PIN_IN_36)
		      );      
   
   mioc_nand4_nor2_rtl  u81 (.z(w_u81z),		       
			       .in1(PIN_IN_32),           
			       .in2(w_u78z),         
			       .in3(w_u93q),         
			       .in4(w_u82z)          
			       );

   mioc_inv1_rtl u82 (.z(w_u82z),
		       .in1(w_u78z)
		       );      

   mioc_nand4_nor2_rtl  u83 (.z(w_u83z),		       
			       .in1(PIN_IN_33),           
			       .in2(w_u78z),         
			       .in3(w_u93q),         
			       .in4(w_u82z)          
			       );

   mioc_nor2_rtl u84 (.z(w_u84z),
		       .in1(w_u77q),
		       .in2(PIN_IN_35)		       
		      );

   
   // ################################### ROW 6 #############################
   //

   mioc_inv1_rtl u85 (.z(w_u85z),
		       .in1(w_u87z)
		       );      

   mioc_inv1_rtl u86 (.z(w_u86z),
		       .in1(PIN_IN_17)
		       );      

   mioc_nand2_rtl u87 (.z(w_u87z),
		       .in1(w_u66z),
		       .in2(w_u65z)		       
		      );

   mioc_flop_xilinx u88 (.q(w_u88q),      
		      .qbar(w_u88qb),

		      .in1(w_u91z),      // posedge reset	     
		      .in2(w_u85z),      // negedge reset (???)   
		      .in3(PIN_IN_8),	 // inverted negedge reset
		      .in4(1'b0)	 // posedge set           
	              );

   mioc_inv1_rtl u89 (.z(w_u89z),
		       .in1(w_u74z)
		       );         


   mioc_flop_xilinx u90 (.q(w_u90q),      
		      .qbar(w_u90qb),

		      .in1(w_u91z),      // posedge reset	     
		      .in2(w_u85z),      // negedge reset (???)   
		      .in3(PIN_IN_7),	 // inverted negedge reset
		      .in4(1'b0)	 // posedge set           
	              );

   mioc_inv1_rtl u91 (.z(w_u91z),
		       .in1(w_u53z)
		       );         

   mioc_flop_xilinx u92 (.q(w_u92q),      
		      .qbar(w_u92qb),

		      .in1(w_u91z),      // posedge reset	     
		      .in2(PIN_IN_31),   // negedge reset (???)   
		      .in3(1'b0),	 // inverted negedge reset
		      .in4(w_u59z)	 // posedge set           
	              );   

   mioc_flop_xilinx u93 (.q(w_u93q),      
		      .qbar(w_u93qb),

		      .in1(w_u91z),      // posedge reset	     
		      .in2(w_u80z),      // negedge reset (???)   
		      .in3(w_u92q),	 // inverted negedge reset
		      .in4(1'b0)	 // posedge set           
	              );

   mioc_inv1_rtl u94 (.z(w_u94z),
		       .in1(PIN_IN_25)
		       );  
   
   
   
   // WIRE ASSIGNMENTS
   //

   // OUTPUT ASSIGNMENTS
   //
   assign RA7           = w_u23z;   //: pin 2 : (goes to U9 , RAM Address 7.This is the multiplexed RAM address MSB.)	       
   assign BUSRQ_N       = w_u86z;   //: pin18 : Active low bus request
   assign SPINDIS_N     = w_u88qb;  //: pin19 : Active low Controller Spinner Interrupt Disable
   assign NETRST_N      = w_u90qb;   //: pin20 : Active low - Reset for AdamNET
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
   assign  PIN_IN_3    = BA15      ; //: pin 3 : Address line 15
   assign  PIN_IN_4    = BA14      ; //: pin 4 : Address line 14
   assign  PIN_IN_5    = BA13      ; //: pin 5 : Address line 13
   assign  PIN_IN_6    = ~N_CVRST   ; //: pin 6 : Active low reset signal “Game Reset”
   assign  PIN_IN_7    = BD0       ; //: pin 7 : Data line 0
   assign  PIN_IN_8    = BD1       ; //: pin 8 : Data line 1
   assign  PIN_IN_9    = BD2       ; //: pin 9 : Data line 2
   assign  PIN_IN_10   = BD3       ; //: pin10 : Data line 3
   assign  PIN_IN_11   = N_BWR     ; //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated by MA5,/IORQ, and A10
   assign  PIN_IN_12   = BA6       ; //: pin12 : Address line 6

   assign  PIN_IN_13   = BA7       ; //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)
   assign  PIN_IN_13B  = ~BA7      ; //: INVERTED pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)

   assign  PIN_IN_14   = ~IORQ_N    ; //: pin14 : Active low Z80 IO Request
   assign  PIN_IN_15   = ~WAIT_N    ; //: pin15 : Active low wait signal, Memory wait state
   assign  PIN_IN_16   = ~BUSAK_N   ; //: pin16 : Active low bus acknowledge - Z80 Control
   assign  PIN_IN_17   = ~DMA_N     ; //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM
   assign  PIN_IN_25   = ~PBRST_N   ; //: pin 25 : Active low ADAM Reset switch for computer mode

   assign  PIN_IN_31   = OS3_N     ; //: pin 31 : Active low OS3 From Master 6801
   assign  PIN_IN_32   = BMREQ_N   ; //: pin 32 : Active low Buffered Memory Request
   assign  PIN_IN_33   = BRD_N     ; //: pin 33 : Active low Buffered Memory Read
   assign  PIN_IN_34   = ~BRFSH_N   ; //: pin 34 : Active low Buffered Memory Refresh
   assign  PIN_IN_35   = BM1_N     ; //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.
   assign  PIN_IN_36   = ~B_PHI     ; //: pin 36 : Z80 Clock
   
endmodule
