`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:22 03/01/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(
	output reg out,
	output reg c_out,
	input a,
	input b,
	input [2:0] opcode,
	input c_in
   );
	
	wire mov_out, not_out, add_out, add_cout, sub_out, sub_cout, or_out, and_out;
	assign mov_out = a;
	assign not_out = ~a;
	FA_str add1 (add_cout, add_out, a, b, c_in);
	alu_sub sub1 (sub_cout, sub_out, a, b, c_in);
	or(or_out, a, b);
	and(and_out, a, b);

always@(opcode or a or b or mov_out or not_out or add_out or sub_out or or_out or and_out or add_cout or sub_cout)
	begin
	case(opcode)
		0: {out, c_out} = {mov_out, 1'b0};
		1: {out, c_out} = {not_out, 1'b0};
		2: {out, c_out} = {add_out, add_cout};
		3: {out, c_out} = {sub_out, sub_cout};
		4: {out, c_out} = {or_out, 1'b0};
		5: {out, c_out} = {and_out, 1'b0};
		default: {out, c_out} = {mov_out, 1'b0};
	endcase
	end

endmodule
