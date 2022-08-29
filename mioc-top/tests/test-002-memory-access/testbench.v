`timescale 1ns / 1 ns

`define NULL 0    

// Generic testbench 
//
// MIOC ASIC top-level  Edward Diaz 
//
module testbench ();
   
   // INPUTS
   // 
   reg    BA15         ; //: pin 3 : Address line 15								    
   reg    BA14         ; //: pin 4 : Address line 14								    
   reg    BA13         ; //: pin 5 : Address line 13 	                                                                                                            
   reg    N_CVRST      ; //: pin 6 : Active low reset signal “Game Reset”					    
   reg    BD0          ; //: pin 7 : Data line 0								    
   reg    BD1          ; //: pin 8 : Data line 1								    
   reg    BD2          ; //: pin 9 : Data line 2								    
   reg    BD3          ; //: pin10 : Data line 3								    
   reg    N_BWR        ; //: pin11 : Active low write signal Buffered Write (according to earlier docs, gated MA5,/IORQ, and A10 		    
   reg    BA6          ; //: pin12 : Address line 6								    
   reg    BA7          ; //: pin13 : Address line 7 (according to earlier docs, gated by /ADDRBUFEN)		    
   reg    IORQ_N       ; //: pin14 : Active low Z80 IO Request							    
   reg    WAIT_N       ; //: pin15 : Active low wait signal, Memory wait state					    
   reg    BUSAK_N      ; //: pin16 : Active low bus acknowledge - Z80 Control					    
   reg    DMA_N        ; //: pin17 : Active low DMA transaction asserted by 6801 to signal DMA to RAM
   reg    PBRST_N      ; //: pin 25 : Active low ADAM Reset switch for computer mode					    
   reg    OS3_N        ; //:  pin 31 : Active low OS3 From Master 6801							 
   reg    BMREQ_N      ; //: pin 32 : Active low Buffered Memory Request						 
   reg    BRD_N        ; //: pin 33 : Active low Buffered Memory Read							 
   reg    BRFSH_N      ; //: pin 34 : Active low Buffered Memory Refresh						 
   reg    BM1_N        ; //: pin 35 : Active low Buffered M1, indicates M1 Z80 is in M1 state.				 
   reg    B_PHI        ; //: pin 36 : Z80 Clock										 

   // OUTPUTS
   //
   wire   RA7          ; //: pin 2 : (goes to U9 , RAM Address 7.This is the multiplexed RAM address MSB.)	        		    
   wire   BUSRQ_N      ; //: pin18 : Active low bus request							    
   wire   SPINDIS_N    ; //: pin19 : Active low Controller Spinner Interrupt Disable				    
   wire   NETRST_N     ; //: pin20 : Active low - Reset for AdamNET                                                  
   wire   AUXDECODE1_N ; //: pin 22 : Active low - Disables the onboard mem decode on CV board?				 
   wire   RST_N        ; //: pin 23 : Active low reset - System Reset circuitry						 
   wire   CPRST_N      ; //: pin 24 : Active low reset - not used							 
   wire   AUXROMCS_N   ; //: pin 26 : Active low aux rom chip select - Slot 2 Expansion ROM CS				 
   wire   ADDRBUFEN_N  ; //: pin 27 : Active low address buffer enable - according to earlier docs, enables/disables BMREQ, /BM1, and /BIORQ (disabled during DMA cycle) 
   wire   BOOTROMCS_N  ; //: pin 28 : Active low boot ROM chip select - For Smartwriter ROM				 
   wire   EN245_N      ; //: pin 29 : Active low 245 enable - CV onboard decode enable/disable?				 
   wire   IS3_N        ; //: pin 30 : Active low IS3 To Master 6801							 
   wire   MUX          ; //: pin 37 : Wire   Mux signal for memory address signals for DRAM.				 
   wire   RAS_N        ; //: pin 38 : Active low row address strobe							 
   wire   CAS1_N       ; //: pin 39 : Active low column address strobe 1						 
   wire   CAS2_N       ; //: pin 40 : Active low column address strobe 2                                                 

   // Instantiate Design
   //
   mioc_top mioc (

		  // OUTPUTS
		  //
		  .RA7(RA7),
		  .BUSRQ_N(BUSRQ_N),
		  .SPINDIS_N(SPINDIS_N),
		  .NETRST_N(NETRST_N),
		  .AUXDECODE1_N(AUXDECODE1_N),
		  .RST_N(RST_N),
		  .CPRST_N(CPRST_N),
		  .AUXROMCS_N(AUXROMCS_N),
		  .ADDRBUFEN_N(ADDRBUFEN_N),
		  .BOOTROMCS_N(BOOTROMCS_N),
		  .EN245_N(EN245_N),
		  .IS3_N(IS3_N),
		  .MUX(MUX),
		  .RAS_N(RAS_N),
		  .CAS1_N(CAS1_N),
		  .CAS2_N(CAS2_N),


		  // INPUTS
		  // 
		  .BA15(BA15),
		  .BA14(BA14),
		  .BA13(BA13),
		  .N_CVRST(N_CVRST),
		  .BD0(BD0),
		  .BD1(BD1),
		  .BD2(BD2),
		  .BD3(BD3),
		  .N_BWR(N_BWR),
		  .BA6(BA6),
		  .BA7(BA7),
		  .IORQ_N(IORQ_N),
		  .WAIT_N(WAIT_N),
		  .BUSAK_N(BUSAK_N),
		  .DMA_N(DMA_N),
		  .PBRST_N(PBRST_N),
		  .OS3_N(OS3_N),
		  .BMREQ_N(BMREQ_N),
		  .BRD_N(BRD_N),
		  .BRFSH_N(BRFSH_N),
		  .BM1_N(BM1_N),
		  .B_PHI(B_PHI)
		  
                  );


`ifdef TESTER
       initial begin
	  // Dump waves, and capture just the IO PINS
	  // (done to hide interna changes that wont affect overall functions)
	  //  	  
	  $display("Wave dumping for test.");	  
	  $dumpfile("waves.vcd");
	  $dumpvars(1, testbench);
       end
`else
   initial begin
      // Dump waves, and capture everything 
      // (all levels of hierarchy)
      //
      $display("Wave dumping for simulation.");	  
      $dumpfile("waves.vcd");
      $dumpvars(0, testbench);
   end   
`endif

   
   // Z80 reset
   //  
   initial begin

      // Init all inputs
      BA15    <= 1'b0;
      BA14    <= 1'b0;
      BA13    <= 1'b0;
      BD0     <= 1'b0;
      BD1     <= 1'b0;
      BD2     <= 1'b0;
      BD3     <= 1'b0;
      N_BWR   <= 1'b0;
      BA6     <= 1'b0;
      BA7     <= 1'b0;
      IORQ_N  <= 1'b1;
      WAIT_N  <= 1'b1;
      BUSAK_N <= 1'b1;
      DMA_N   <= 1'b1;
      OS3_N   <= 1'b1;
      BMREQ_N <= 1'b1;
      BRD_N   <= 1'b1;
      BRFSH_N <= 1'b1;
      BM1_N   <= 1'b1;
      B_PHI   <= 1'b0;
      
      
      // Toggle ADAM reset
      
      #100;

      // ############### Toggle ADAM reset      
      PBRST_N  <= 1'b0;
      N_CVRST  <= 1'b1;

      #1000;
      
      PBRST_N  <= 1'b1;
      N_CVRST  <= 1'b1;
      
      #1000;

   end

   // Toggle system clock
   //
   initial begin
      // Toggle clocks
      //
      while (1) begin
	 B_PHI = ~B_PHI;
         #150;             // 300ns duty cycle (3.3Mhz)
      end      
   end


   // #################  INSERT CUSTOM SEQUENCE BELOW #################
   // #################  INSERT CUSTOM SEQUENCE BELOW #################
   // #################  INSERT CUSTOM SEQUENCE BELOW #################     
   
   // Init file handles and waveform dumping
   //
   initial begin

      #2000; // Wait for ADAM reset (above) to complete

      @(negedge B_PHI);      
      BMREQ_N <= 1'b0;  //: pin 32 : Active low Buffered Memory Request						 
      BRD_N   <= 1'b0;  //: pin 33 : Active low Buffered Memory Read
      BA13    <= 1'b1;
      N_BWR   <= 1'b0; 
      BUSAK_N <= 1'b0;    
      
      @(negedge B_PHI);            
      BMREQ_N <= 1'b1;  //: pin 32 : Active low Buffered Memory Request						 
      BRD_N   <= 1'b1;  //: pin 33 : Active low Buffered Memory Read
      BA13    <= 1'b0;
      N_BWR   <= 1'b0;    
      BUSAK_N <= 1'b0;            

      @(negedge B_PHI);
      @(negedge B_PHI);
      @(negedge B_PHI);      

      BMREQ_N <= 1'b1;  //: pin 32 : Active low Buffered Memory Request						 
      BRD_N   <= 1'b1;  //: pin 33 : Active low Buffered Memory Read
      BA13    <= 1'b0;
      N_BWR   <= 1'b1; 
      BUSAK_N <= 1'b1;
      
      #2000;
      
      $display("\n\nSimulation end.");

      $finish();
      
      
   end // initial begin   

endmodule
