`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:58 03/29/2018 
// Design Name: 
// Module Name:    forwarding_unit 
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
module forwarding_unit(forwardA, forwardB, IDEX_Rs, IDEX_Rt, ExMemRd, MemWbRd, ExMemWrite, MemWbWrite  );
	input [4:0] IDEX_Rs;
	input [4:0] IDEX_Rt;
	input [4:0] ExMemRd;
	input [4:0] MemWbRd;
	input  ExMemWrite;
	input  MemWbWrite;
	output reg [1:0] forwardA;
	output reg [1:0] forwardB;
	
	always@(*) begin
	assign forwardA  = 2'b00;
	assign forwardB  = 2'b00;
	
	if((ExMemWrite != 1'b0) && ExMemRd !=5'b0 && IDEX_Rs == ExMemRd)
		assign forwardA = 2'b10;
	if(ExMemWrite != 1'b0 && ExMemRd !=5'b0 && IDEX_Rt == ExMemRd)
		assign forwardB = 2'b10;
	if(MemWbWrite != 1'b0  && MemWbRd !=5'b0 && ExMemRd != IDEX_Rs && MemWbRd == IDEX_Rs)
		assign forwardA = 2'b01;	
	if(MemWbWrite != 1'b0 && MemWbRd !=5'b0 && ExMemRd != IDEX_Rt && MemWbRd == IDEX_Rt)
		assign forwardB = 2'b01;
	end
	

endmodule
