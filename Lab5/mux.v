`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:47 03/16/2018 
// Design Name: 
// Module Name:    mux 
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
module mux( 
    
   input DataSrc,
	input [31:0]ReadData2,
	input [15:0]Imm,
	output reg [31:0]ReadData3
	);
	
	//wire DataSrc;
	always @(DataSrc or ReadData2 or Imm)
	begin
	  if (DataSrc == 0)
		 ReadData3 = ReadData2;
	  else
		 ReadData3 = Imm;
	end


endmodule
