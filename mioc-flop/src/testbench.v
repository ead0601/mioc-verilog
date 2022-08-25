`timescale 1ns / 1 ns

`define NULL 0    

// Generic testbench to drive inputs from a file
//
// MIOC ASIC testing of mos register - Edward Diaz 
//
module testbench ();
   
   wire q, qbar;
 
   reg in1,in2,in3,in4;
   reg [3:0] input_data;

   integer   i,count;
   integer   file_r, file_w;

   // Init file handles and waveform dumping
   //
   initial begin
      // Dump waves
      $dumpfile("waves.vcd");
      $dumpvars(0, testbench);

      // Open file handle
      file_r = $fopen("./DATA_IN/pat.txt", "r");
      file_w = $fopen("./DATA_OUT/pat.txt", "w");
      
      if (file_r == `NULL) begin
	 $display("Error: File handle was NULL");
	 $finish;
      end

      // Write header
      $fwrite(file_w, "in1 in2 in3 in4 - q qbar\n");

      // STDOUT as well
      $display("in1 in2 in3 in4 - q qbar\n");      

      // Give a reset value
      //
      in1 <= 0;
      in2 <= 0;
      in3 <= 0;
      in4 <= 0;  

      // Drive patterns
      //
      while (1) begin
	 count = $fscanf(file_r, "%b\n", input_data);
	 #100;
	 if (!$feof(file_r)) begin
	    in1 <= input_data[3];
	    in2 <= input_data[2];	    
	    in3 <= input_data[1];
	    in4 <= input_data[0];
	    $fwrite(file_w, "%b %b %b %b - %b %b\n",in1,in2,in3,in4,q,qbar);
    	    $display("%b %b %b %b - %b %b",in1,in2,in3,in4,q,qbar); 
	 end
	 else begin
	    $fclose(file_r);
	    $fclose(file_w);	    
	    $finish;
	 end
      end
   end
   
   // Design
   //
   mioc_flop_nmos reg1(.q(q),
   //mioc_flop_rtl reg1(.q(q),
		       .qbar(qbar),
		       .in1(in1),
		       .in2(in2),
		       .in3(in3),
		       .in4(in4)
		       );

endmodule
