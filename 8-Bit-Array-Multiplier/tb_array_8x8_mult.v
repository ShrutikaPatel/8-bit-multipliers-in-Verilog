`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:34:37 02/13/2022
// Design Name:   main
// Module Name:   C:/_My Folders_/Verilog Projects/Trial Project/array_8x8_mult/tb_array_8x8_mult.v
// Project Name:  array_8x8_mult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_array_8x8_mult;

	// Inputs
	reg [7:0] x;
	reg [7:0] y;

	// Outputs
	wire [15:0] p;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.x(x), 
		.y(y), 
		.p(p)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		x = 8'd255;
		y = 8'd255;
		#100;
		
		x = 8'd5;
		y = 8'd3;
		#100;
		
		x = 8'd4;
		y = 8'd2;
		#100;
		
		x = 8'd2;
		y = 8'd2;
		#100;
		
		x = 8'd6;
		y = 8'd8;
		#100; $stop;
        
	end
      
endmodule

