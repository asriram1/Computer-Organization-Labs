`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:32 03/15/2018 
// Design Name: 
// Module Name:    n_bit_register_file 
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
module n_bit_register_file(
									write_data, 
                          read_data_1, read_data_2, 
                          read_sel_1, read_sel_2, 
                          write_address, RegWrite, clk );

    parameter data_width = 32;
    parameter select_width = 5; 

    input                             clk, RegWrite;
    input       [data_width-1:0]      write_data;
    input       [4:0]                 read_sel_1, read_sel_2, write_address;
    output      [data_width-1:0]      read_data_1, read_data_2;

    reg         [data_width-1:0]      register_file [0:data_width-1];

    // for loop initializes all registers to 10x the register number
    // no need to rst
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin 
            register_file[i] = i * 0;
        end     
    end


    assign read_data_1 = register_file[read_sel_1];
    assign read_data_2 = register_file[read_sel_2];


    always @ (posedge clk) begin
        if (RegWrite) 
            register_file[write_address] <= write_data;
    end
endmodule
