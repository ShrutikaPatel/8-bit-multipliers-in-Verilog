`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:15 02/13/2022 
// Design Name: 
// Module Name:    FA 
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
module FA(a,b,c,cy,sm);

	input a,b,c;
	output cy,sm;
	wire x,y,z;
	HA h1(a,b,x,z);
	HA h2(z,c,y,sm);
	or o1(cy,x,y);

endmodule 