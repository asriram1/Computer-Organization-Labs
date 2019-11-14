`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:59 02/16/2018 
// Design Name: 
// Module Name:    mux16to1 
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
module mux32to1(
 out, in0, in1, select
    );
	
    
   input select;
	input [31:0]in0;
	input [31:0]in1;
	output reg [31:0]out;

	
	wire select;
	//wire[1:0] in;
	always @(select or in0 or in1)
	begin
	  if (select == 0)
		 out = in0;
	  else
		 out = in1;
	end


endmodule
