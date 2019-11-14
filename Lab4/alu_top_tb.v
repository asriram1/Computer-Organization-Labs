`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:56:35 10/07/2015
// Design Name:   alu_top
// Module Name:   /ad/eng/users/b/p/bphan/comp org/lab5/alu_top_tb.v
// Project Name:  lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_top_tb;

	// Inputs
	reg clk;
	reg [31:0] a;
	reg [31:0] b;
	reg c_in;
	reg [2:0] opcode;

	// Outputs
	wire [31:0] sum;
	wire c_out;
	//wire c_out_verify;
	wire [31:0] sum_verify;
	wire error_flag;
	wire c_out_verify;
	parameter BW = 32;
	// Instantiate the Unit Under Test (UUT)
	alu_top#(.BW(BW)) uut (
		.clk(clk), 
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.opcode(opcode), 
		.out(sum), 
		.c_out(c_out)
	);

// Verification module
	Verification_nbit#(.BW(BW)) Verification (
		
		.R0(sum_verify), 
		.R2(a), 
		.R3(b), 
		.c_in(c_in),
		.opcode(opcode),
		.c_out(c_out_verify),
		.clk(clk)
	);
	
	// Assign Error_flag
	assign error_flag = (sum != sum_verify);
	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		a = 0;
		b = 0;
		c_in = 0;
		opcode = 0;
		#100;
		// Wait 100 ns for global reset to finish
		
      a = 7; 
		b = 12;
		c_in = 0;
		opcode = 0;
		#100;	
		
		a = 15; 
		b = 5;
		c_in = 0;
		opcode = 1;
		#100;			
		
		a = 12; 
		b = 8;
		c_in = 0;
		opcode = 2;
		#100;	
		
		a = 20; 
		b = 3;
		c_in = 0;
		opcode = 3;
		#100;	
		// Add stimulus here
		
		a = 13; 
		b = 12;
		c_in = 0;
		opcode = 4;
		#100;	
		
		a = 34; 
		b = 20;
		c_in = 0;
		opcode = 5;
		#100;	
		
	end
      
endmodule

