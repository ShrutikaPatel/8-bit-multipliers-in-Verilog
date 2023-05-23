`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:13:19 02/27/2022 
// Design Name: 
// Module Name:    wallace_8x8_mult 
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
module wallace_8x8(m,n,p);
    parameter width = 8;
    input [width-1:0] n,m;
    output [width*2:0] p;
   
	 wire [(width**2)-1:0] pp_sig;
	 wire [62:0] c;
	 wire [52:0] s;
	 
	genvar j,k;
   generate
      for (j=0; j < width; j=j+1) 
      begin: outer_loop
         for (k=0; k < width; k=k+1) 
         begin: inner_loop
            assign pp_sig[8*j+k] = m[j] & n[k];
         end
      end
   endgenerate
	 
	// Level 1 -stage 1
	half_adder HA1_l1 (pp_sig[1],pp_sig[8],s[0],c[0]);
	
	generate
      for (j=0; j< 6; j=j+1) 
      begin: l1_s1
         full_adder FA1_l1(pp_sig[2+j],pp_sig[9+j],pp_sig[16+j],s[1+j],c[1+j]);
      end
   endgenerate
	 
	half_adder HA2_l1 (pp_sig[15],pp_sig[22],s[7],c[7]);
	
	//level 1 -stage 2
	half_adder HA3_l1 (pp_sig[25],pp_sig[32],s[8],c[8]);
	
	generate
      for (j=0; j< 6; j=j+1) 
      begin: l1_s2
         full_adder FA1_l1(pp_sig[26+j],pp_sig[33+j],pp_sig[40+j],s[9+j],c[9+j]);
      end
   endgenerate
	 
	half_adder HA4_l1 (pp_sig[39],pp_sig[46],s[15],c[15]);
	
	//level 2 -stage 1
	half_adder HA1_l2 (s[1],c[0],s[16],c[16]);
	full_adder FA1_l2(s[2],c[1],pp_sig[24],s[17],c[17]);
	generate
      for (j=0; j< 5; j=j+1) 
      begin: l2_s1
         full_adder FA2_l2(s[3+j],c[2+j],s[8+j],s[18+j],c[18+j]);
      end
   endgenerate
	 
	full_adder FA3_l2(pp_sig[23],c[7],s[13],s[23],c[23]);
	//level 2 -stage 2
	
	half_adder HA2_l2 (c[9],pp_sig[48],s[24],c[24]);
	
	generate
      for (j=0; j< 6; j=j+1) 
      begin: l2_s2
         full_adder FA4_l2(c[10+j],pp_sig[49+j],pp_sig[56+j],s[25+j],c[25+j]);
      end
   endgenerate
	 
	half_adder HA3_l2 (pp_sig[55],pp_sig[62],s[31],c[31]);
	
	//level 3 -stage 1
	half_adder HA1_l3 (s[17],c[16],s[32],c[32]);
	half_adder HA2_l3 (s[18],c[17],s[33],c[33]);
	full_adder FA1_l3(s[19],c[18],c[8],s[34],c[34]);
	generate
      for (j=0; j< 4; j=j+1) 
      begin: l3_s1
         full_adder FA2_l3(s[20+j],c[19+j],s[24+j],s[35+j],c[35+j]);
      end
   endgenerate
	full_adder FA3_l3(s[14],c[23],s[28],s[39],c[39]);
	half_adder HA3_l3 (s[15],s[29],s[40],c[40]);
	half_adder HA4_l3 (pp_sig[47],s[30],s[41],c[41]);
	
	//level 4 -stage 1
	assign p[0] = pp_sig[0];
	assign p[1] = s[0];
	assign p[2] = s[16];
	assign p[3] = s[32];
	
	generate
      for (j=0; j< 3; j=j+1) 
      begin: l4_ha
         half_adder HA1_l4 (s[33+j],c[32+j],s[42+j],c[42+j]);
      end
   endgenerate
	
	generate
      for (j=0; j<6 ; j=j+1) 
      begin: l4_fa
         full_adder FA1_l4(c[24+j],s[36+j],c[35+j],s[45+j],c[45+j]);
      end
   endgenerate
	full_adder FA2_l4(c[30],s[31],c[41],s[51],c[51]);
	half_adder HA2_l4 (c[31],pp_sig[63],s[52],c[52]);
	
	// //level 5 -stage 1
	assign p[4] = s[42];
	half_adder HA1_l5 (s[43],c[42],p[5],c[53]);
	generate
      for (j=0; j<9 ; j=j+1) 
      begin: l5_fa
         full_adder FA1_l5(s[44+j],c[43+j],c[53+j],p[6+j],c[54+j]);
      end
   endgenerate
	half_adder HA2_l5 (c[52],c[62],p[15],p[16]);
endmodule
