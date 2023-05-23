`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:45 02/27/2022
// Design Name:   wallace_8x8_mult
// Module Name:   G:/Teaching Stuff/FPGA/Prototyping_with_FPGA/Wallace_tree/wallace_8x8_mult/wallace_tb.v
// Project Name:  wallace_8x8_mult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wallace_8x8_mult
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wallace_tb;

	// Inputs
	reg [7:0] m;
	reg [7:0] n;
	// Outputs
	wire [16:0] p;

	// Instantiate the Unit Under Test (UUT)
	wallace_8x8 uut (
		.m(m), 
		.n(n), 
		.p(p)
	);

	initial begin
	$dumpfile("power_test.vcd");
	$dumpvars(1,wallace_tb.uut);
		// Initialize Inputs
		m = 0;
		n = 0;

		#10;
      m = 8'd10;
      n = 8'd10;
 
		#10;
      m = 8'd50;
      n = 8'd20;

		#10;
      m = 8'd8;
      n = 8'd6;
		
		#10;
      m = 8'd18;
      n = 8'd18;

		#10;
      m = 8'd22;
      n = 8'd24;		

      #10;$stop;
		end
endmodule

