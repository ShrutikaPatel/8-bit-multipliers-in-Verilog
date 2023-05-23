`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:09 02/27/2022 
// Design Name: 
// Module Name:    full_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module full_adder(
    input a_in,
    input b_in, c_in,
    output sum,
    output carry
    );
	 
	 assign sum = a_in ^ b_in ^ c_in ;
	 assign carry = (a_in & b_in) | (b_in & c_in) | (c_in &a_in);

endmodule
