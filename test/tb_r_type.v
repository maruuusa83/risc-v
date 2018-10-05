//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`include "lib/utils.v"

`timescale 1ns/1ps

module tb_r_type();
  parameter CLK_PERIOD = 10;
  parameter REG_DATA_WIDTH = 32;
  
  localparam CTRL_WIDTH = 4;
  localparam NUM_OF_ITR = 100;

  reg clk = 1'b0;
  reg nreset;

  reg [31:0] instruction;

  wire [6:0] opcode;
  wire [4:0] rd;
  wire [2:0] funct3;
  wire [4:0] rs1, rs2;
  wire [6:0] funct7;

  wire signed [REG_DATA_WIDTH - 1:0] din_0;
  wire signed [REG_DATA_WIDTH - 1:0] din_1;
  wire signed [REG_DATA_WIDTH - 1:0] result;

  wire [3:0] alu_ctrl;
  wire [1:0] alu_op;

  reg [4:0]  gpregs_write_reg;
  reg [31:0] gpregs_din;
  reg        gpregs_din_enable = 1'b0;

  assign opcode = instruction[6:0];
  assign rd     = instruction[11:7];
  assign funct3 = instruction[14:12];
  assign rs1    = instruction[19:15];
  assign rs2    = instruction[24:20];
  assign funct7 = instruction[31:25];

  ALU alu (.*, .ctrl(alu_ctrl));
  ALU_CONTROLLER alu_controller(.*);
  CONTROLLER controller(.*);
  GPREGS gpregs
    ( .*,
      .read_reg_0(rs1),
      .read_reg_1(rs2),
      .write_reg(gpregs_write_reg),
      .din(gpregs_din),
      .din_enable(gpregs_din_enable),
      .dout_reg_0(din_0),
      .dout_reg_1(din_1));

  always #(CLK_PERIOD/2) begin
    clk <= !clk;
  end

  initial begin
    nreset <= 1'b0;
    gpregs_din_enable <= 1'b0;
    #(CLK_PERIOD)
    nreset <= 1'b1;
    #(CLK_PERIOD)

    // LOAD x1, 10
    gpregs_din <= 32'd10;
    gpregs_write_reg <= 5'd1;
    gpregs_din_enable <= 1'b1;
    #(CLK_PERIOD)

    // LOAD x2, 5
    gpregs_din <= 32'd5;
    gpregs_write_reg <= 5'd2;
    gpregs_din_enable <= 1'b1;
    #(CLK_PERIOD)

    // ADD x1, x2
    instruction <= 32'b0000000_00010_00001_000_00001_0110011;

    $display(din_0, din_1, result);
    #(CLK_PERIOD)
    $display(din_0, din_1, result);
    #(CLK_PERIOD)
    $display(din_0, din_1, result);
    #(CLK_PERIOD)

    `ASSERT_EQ(32'd15, result);

    `FINISH_TEST();
  end

endmodule // tb_r_type

