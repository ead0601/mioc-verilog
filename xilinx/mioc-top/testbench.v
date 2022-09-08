`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:41:23 09/07/2022
// Design Name:   mioc_top
// Module Name:   /build/repo/mioc-verilog/xilinx/mioc-top/testbench.v
// Project Name:  mioc-top
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mioc_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg BA15;
	reg BA14;
	reg BA13;
	reg N_CVRST;
	reg BD0;
	reg BD1;
	reg BD2;
	reg BD3;
	reg N_BWR;
	reg BA6;
	reg BA7;
	reg IORQ_N;
	reg WAIT_N;
	reg BUSAK_N;
	reg DMA_N;
	reg PBRST_N;
	reg OS3_N;
	reg BMREQ_N;
	reg BRD_N;
	reg BRFSH_N;
	reg BM1_N;
	reg B_PHI;

	// Outputs
	wire RA7;
	wire BUSRQ_N;
	wire SPINDIS_N;
	wire NETRST_N;
	wire AUXDECODE1_N;
	wire RST_N;
	wire CPRST_N;
	wire AUXROMCS_N;
	wire ADDRBUFEN_N;
	wire BOOTROMCS_N;
	wire EN245_N;
	wire IS3_N;
	wire MUX;
	wire RAS_N;
	wire CAS1_N;
	wire CAS2_N;

	// Instantiate the Unit Under Test (UUT)
	mioc_top uut (
		.RA7(RA7), 
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
		.BUSRQ_N(BUSRQ_N), 
		.SPINDIS_N(SPINDIS_N), 
		.NETRST_N(NETRST_N), 
		.AUXDECODE1_N(AUXDECODE1_N), 
		.RST_N(RST_N), 
		.CPRST_N(CPRST_N), 
		.PBRST_N(PBRST_N), 
		.AUXROMCS_N(AUXROMCS_N), 
		.ADDRBUFEN_N(ADDRBUFEN_N), 
		.BOOTROMCS_N(BOOTROMCS_N), 
		.EN245_N(EN245_N), 
		.IS3_N(IS3_N), 
		.OS3_N(OS3_N), 
		.BMREQ_N(BMREQ_N), 
		.BRD_N(BRD_N), 
		.BRFSH_N(BRFSH_N), 
		.BM1_N(BM1_N), 
		.B_PHI(B_PHI), 
		.MUX(MUX), 
		.RAS_N(RAS_N), 
		.CAS1_N(CAS1_N), 
		.CAS2_N(CAS2_N)
	);

	initial begin
	
		// Initialize Inputs
		BA15 = 0;
		BA14 = 0;
		BA13 = 0;
		N_CVRST = 0;
		BD0 = 0;
		BD1 = 0;
		BD2 = 0;
		BD3 = 0;
		N_BWR = 0;
		BA6 = 0;
		BA7 = 0;
		IORQ_N = 0;
		WAIT_N = 0;
		BUSAK_N = 0;
		DMA_N = 0;
		PBRST_N = 0;
		OS3_N = 0;
		BMREQ_N = 0;
		BRD_N = 0;
		BRFSH_N = 0;
		BM1_N = 0;
		B_PHI = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  
		// Add stimulus here
		
		// ############### Toggle ADAM reset      
      PBRST_N  <= 1'b0;
      N_CVRST  <= 1'b1;

      #100;
      
      PBRST_N  <= 1'b1;
      N_CVRST  <= 1'b1;
      
      #100;

	end
	
   // Toggle system clock
   //
   initial begin
      // Toggle clocks
      //
      while (1) begin
	      B_PHI = ~B_PHI;
         #50;             // 300ns duty cycle (3.3Mhz)
      end      
   end
	
	// #################  INSERT CUSTOM SEQUENCE BELOW #################
   // #################  INSERT CUSTOM SEQUENCE BELOW #################
   // #################  INSERT CUSTOM SEQUENCE BELOW #################     
   
   // Init file handles and waveform dumping
   //
   initial begin

      #1000; // Wait for ADAM reset (above) to complete

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
      
      #100;
      
      $display("\n\nSimulation end.");

      //$finish();
      
      
   end // initial begin   

	
      
endmodule

