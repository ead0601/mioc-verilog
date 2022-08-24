// mioc-top
//
// Edward Diaz , 08_21_22
//
// This is a mos representation of the original mos layout
//  configuration that uses an open drain configuration.

// mioc-top
//
module mioc_top(
		RA7          ,
		BA15         ,
		BA14         ,
		BA13         ,
		
		N_CVRST      ,
		BD0          ,
		BD1          ,
		BD2          ,
		BD3          ,
		N_BWR        ,
		
		BA6          ,
		BA7          ,
		IORQ_N       ,
		WAIT_N       ,
		BUSAK_N      ,
		DMA_N        ,
		BUSRQ_N      ,
		SPINDIS_N    ,
		NETRST_N     ,
		
		AUXDECODE1_N ,
		RST_N        ,
		CPRST_N      ,
		PBRST_N      ,
		AUXROMCS_N   ,
		ADDRBUFEN_N  ,
		
		BOOTROMCS_N  ,
		EN245_N      ,
		IS3_N        ,
		OS3_N        ,
		BMREQ_N      ,
		BRD_N        ,
		BRFSH_N      ,
		BM1_N        ,
		B_PHI        ,
		MUX          ,
		RAS_N        ,
		CAS1_N       ,
		CAS2_N       	
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
   wire  RA7          ; //: pin 2 : (goes to U9 , RAM Address 7.This is the multiplexed RAM address MSB.)
   wire  BUSRQ_N      ; //: pin18 : Active low bus request
   wire  SPINDIS_N    ; //: pin19 : Active low Controller Spinner Interrupt Disable
   wire  NETRST_N     ; //: pin20 : Active low - Reset for AdamNET
   wire  AUXDECODE1_N ; //: pin 22 : Active low - Disables the onboard mem decode on CV board?
   wire  RST_N        ; //: pin 23 : Active low reset - System Reset circuitry
   wire  CPRST_N      ; //: pin 24 : Active low reset - not used
   wire  AUXROMCS_N   ; //: pin 26 : Active low aux rom chip select - Slot 2 Expansion ROM CS
   wire  ADDRBUFEN_N  ; //: pin 27 : Active low address buffer enable - according to earlier docs, enables/disables
                         //:     /BRFSH, /BMREQ, /BM1, and /BIORQ (disabled during DMA cycle)
   wire  BOOTROMCS_N  ; //: pin 28 : Active low boot ROM chip select - For Smartwriter ROM
   wire  EN245_N      ; //: pin 29 : Active low 245 enable - CV onboard decode enable/disable?
   wire  IS3_N        ; //: pin 30 : Active low IS3 To Master 6801
   wire  MUX          ; //: pin 37 : Output Mux signal for memory address signals for DRAM.
   wire  RAS_N        ; //: pin 38 : Active low row address strobe
   wire  CAS1_N       ; //: pin 39 : Active low column address strobe 1
   wire  CAS2_N       ; //: pin 40 : Active low column address strobe 2


   // INPUT WIRES
   wire  BA15         ; //: pin 3 : Address line 15
   wire  BA14         ; //: pin 4 : Address line 14
   wire  BA13         ; //: pin 5 : Address line 13	                
   wire  N_CVRST      ; //: pin 6 : Active low reset signal “Game Reset”
   wire  BD0          ; //: pin 7 : Data line 0
   wire  BD1          ; //: pin 8 : Data line 1
   wire  BD2          ; //: pin 9 : Data line 2
   wire  BD3          ; //: pin10 : Data line 3
   wire  N_BWR        ; //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated by
                         //:      by MA5,/IORQ, and A10
   wire  BA6          ; //: pin12 : Address line 6
   wire  BA7          ; //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)
   wire  IORQ_N       ; //: pin14 : Active low Z80 IO Request
   wire  WAIT_N       ; //: pin15 : Active low wait signal, Memory wait state
   wire  BUSAK_N      ; //: pin16 : Active low bus acknowledge - Z80 Control
   wire  DMA_N        ; //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM
   wire  PBRST_N      ; //: pin 25 : Active low ADAM Reset switch for computer mode
   wire  OS3_N        ; //: pin 31 : Active low OS3 From Master 6801
   wire  BMREQ_N      ; //: pin 32 : Active low Buffered Memory Request
   wire  BRD_N        ; //: pin 33 : Active low Buffered Memory Read
   wire  BRFSH_N      ; //: pin 34 : Active low Buffered Memory Refresh
   wire  BM1_N        ; //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.
   wire  B_PHI        ; //: pin 36 : Z80 Clock

   // BLOCK NAMES
   //    
   //.././mioc-nor3/src/mioc_nor3_nmos.v
   //.././mioc-flop/src/mioc_flop_nmos.v
   //.././mioc-xnor2/src/mioc_xnor2_nmos.v
   //.././mioc-and2-nor/src/mioc_and2_nor_nmos.v
   //.././mioc-nand2/src/mioc_nand2_nmos.v
   //.././mioc-inv1/src/mioc_inv1_nmos.v
   //.././mioc-nor2/src/mioc_nor2_nmos.v
   //.././mioc-top/src/mioc_top.v	   

   
   // COMPONENTS
   //
   mioc_flop_nmos u1 (.q(w_u1q),
		      .qbar(w_u1qb),

		      .in1(PBRST_N),
		      .in2(w_u36z),
		      .in3(BD3),
		      .in4(BA13)
		     );
   
   
endmodule
