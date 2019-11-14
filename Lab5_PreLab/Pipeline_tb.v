`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [31:0] InstrIn;

    // Outputs
    wire [31:0] Out;

    // Instantiate the Unit Under Test (UUT)
    Pipeline uut (
        .clk(clk),
        .rst(rst),
        .InstrIn(InstrIn),
        .Out(Out)
    );

    // Define clk
    always #5 assign clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        InstrIn = 0;

        // Wait 10 ns for global reset to finish
        #10;
        rst = 0;
                  // Read out R8 and R7, write result to R8
        InstrIn = 32'b000000_01000_01000_00111_00000000000;

        #10;
                  // Read out R10 and R9, write result to R10
        InstrIn = 32'b000000_01010_01010_01001_00000000000;

        #10;
                  // Read out R12 and R11, write result to R12
        InstrIn = 32'b000000_01100_01100_01011_00000000000;

			
        // Alter the above and/or add additional tests here,
        // per the instructions in "Lab5 Pre Lab" PDF

    end

endmodule

