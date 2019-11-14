`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:38 03/15/2018 
// Design Name: 
// Module Name:    top_pipe 
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
module top_pipe(
    input clk,
    input rst,
    input [31:0] InstrIn,
	 input WriteEnable,
    output [31:0] Out
    );

	 // Stage 1 - Wire Declarations
    wire [4:0] S1_Reg_ReadSelect1;
    wire [4:0] S1_Reg_ReadSelect2;
	 wire [15:0]S1_S2_Imm;
	 wire S1_S2_DataSrc;
	 wire [2:0]S1_S2_ALUOp;
    wire [4:0] S1_S2_WriteSelect; 
	 wire S1_S2_WriteEnable;
	 
	 wire [31:0] Reg_S2_ReadData1;
	 wire [31:0] Reg_S2_ReadData2;
	 
	 // Stage 2 - Wire Declarations
	 wire [31:0] S2_ALU_ReadData1;
	 wire [31:0] S2_MUX_ReadData2;
	 wire [15:0]S2_MUX_Imm;
	 wire S2_MUX_DataSrc;
	 wire [2:0]S2_ALU_ALUOp;
	 wire [4:0] S2_S3_WriteSelect; 
	 wire S2_S3_WriteEnable;
	 
	 wire [31:0] MUX_ALU_ReadData3;
	 
	 wire [31:0] ALU_S3_ReadData1;
	 
	 // Stage 3 - Wire Declarations
	 
	 wire [4:0] S3_Reg_WriteSelect;
	 wire S3_Reg_WriteEnable;
	 wire [31:0]S3_Reg_WriteData;
	 
	 
/*	Begin Connecting Modules (Building Pipeline)*/	 
	 // Stage 1
	 S1_Register Stage1(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.WriteEnable(WriteEnable),
		
		.S1_ReadSelect1(S1_Reg_ReadSelect1),
		.S1_ReadSelect2(S1_Reg_ReadSelect2),
		.S1_Imm(S1_S2_Imm),
		.S1_DataSrc(S1_S2_DataSrc),
		.S1_ALUOp(S1_S2_ALUOp),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable)
   );
	 // Register File
	 n_bit_register_file RegFile (
									.write_data(S3_Reg_WriteData), 
                          .read_data_1(Reg_S2_ReadData1),
								  .read_data_2(Reg_S2_ReadData2), 
                          .read_sel_1(S1_Reg_ReadSelect1),
								  .read_sel_2(S1_Reg_ReadSelect2), 
                          .write_address(S3_Reg_WriteSelect), 
								  .RegWrite(S3_Reg_WriteEnable), 
								  .clk(clk)
								  );
	 
	 // Stage 2
	 S2_Register Stage2(
			.clk(clk),
			.rst(rst),
			.Reg_ReadData1(Reg_S2_ReadData1),
			.Reg_ReadData2(Reg_S2_ReadData2),
			.S1_Imm(S1_S2_Imm),
			.S1_DataSrc(S1_S2_DataSrc),
			.S1_ALUOp(S1_S2_ALUOp),
			.S1_WriteSelect(S1_S2_WriteSelect),
			.S1_WriteEnable(S1_S2_WriteEnable),
	 
			.S2_ReadData1(S2_ALU_ReadData1),
			.S2_ReadData2(S2_MUX_ReadData2),
			.S2_Imm(S2_MUX_Imm),
			.S2_DataSrc(S2_MUX_DataSrc),
			.S2_ALUOp(S2_ALU_ALUOp),
			.S2_WriteSelect(S2_S3_WriteSelect),
			.S2_WriteEnable(S2_S3_WriteEnable)
   );
	
	// Mux 
	mux mux_ALU(    
			.DataSrc(S2_MUX_DataSrc),
			.ReadData2(S2_MUX_ReadData2),
			.Imm(S2_MUX_Imm),
			.ReadData3(MUX_ALU_ReadData3)
	);
	
	// ALU
	Ideal_ALU alu_S3(
			.R1(ALU_S3_ReadData1), 
			.R2(S2_ALU_ReadData1), 
			.R3(MUX_ALU_ReadData3), 
			.ALUOp(S2_ALU_ALUOp)
			);
			
	// Stage 3
	S3_Register Stage3(
			.clk(clk),
			.rst(rst),
			.R1(ALU_S3_ReadData1),
			.S2_WriteSelect(S2_S3_WriteSelect),
			.S2_WriteEnable(S2_S3_WriteEnable),
	 
			.S3_WriteSelect(S3_Reg_WriteSelect),
			.S3_WriteEnable(S3_Reg_WriteEnable),
			.ALUOut(S3_Reg_WriteData)
			);
	assign Out = S3_Reg_WriteData;
endmodule
