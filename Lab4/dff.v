`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    dff 
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

module dff#(parameter BW = 32)(q, d, clk);
	input clk;
	input [BW-1:0] d;
	output [BW-1:0] q;

//parameter D = 0;		

//input		d, clk; //declare inputs d and clk, 1 bit each
//output reg	q;          //declare output q, 1 bit


	reg [BW-1:0] Reg;
	assign q = Reg;
	
	always@(posedge clk)
		begin
		Reg <= d;
		end

endmodule
