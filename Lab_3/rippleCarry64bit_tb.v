`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:22:56 02/16/2018
// Design Name:   fullAdder_64bit
// Module Name:   /ad/eng/users/a/s/asan/Documents/EC413/preLab_lab3/rippleCarry64bit_tb.v
// Project Name:  preLab_lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullAdder_64bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rippleCarry64bit_tb;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;
		reg clk = 0;
	integer i;


	// Outputs
	wire c_out;
	wire [63:0] sum;
	wire c_out_verify;
	wire [63:0]sum_verify;

	// Instantiate the Unit Under Test (UUT)
	fullAdder_64bit uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	always #20 clk = ~clk;
	
	// Assign Error_flag
	assign {c_out_verify, sum_verify} = a+b+c_in;
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			// Use $display here instead of $monitor
			// $monitor will display the message whenever there's a change of a, b, c_in
			// $display will only display once when it's been executed
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
	//always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c_in = 0;
		for (i = 0; i < 5120; i=i+100)
			begin
				a=i;
				#40 b=i;
				
					//		$display("values = a = %d, b = %d, c_in = %d\n", a, b, c_in);

			end

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

