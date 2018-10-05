//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`include "lib/utils.v"

`timescale 1ns/1ps

module tb_alu_controller();
  parameter CLK_PERIOD = 10;
  parameter REG_DATA_WIDTH = 32;

  reg clk = 1'b0;
  reg nreset;

  reg [2:0] funct3;
  reg [6:0] funct7;
  reg [1:0] alu_op;
  wire [3:0] alu_ctrl;

  ALU_CONTROLLER alu_controller (.*);

  always #(CLK_PERIOD/2) begin
    clk <= !clk;
  end

  initial begin
    nreset <= 1'b0;
    #(CLK_PERIOD)
    nreset <= 1'b1;
    #(CLK_PERIOD)
    
    //// Integer Register-Register Operations
    //// ALU_OP = 2'b10
    // XOR
    funct3 <= 3'b100;
    funct7 <= 7'b0000000;
    alu_op <= 2'b10;

    #(CLK_PERIOD)

    `ASSERT_EQ(4'b0100, alu_ctrl);

    // ADD
    funct3 <= 3'b000;
    funct7 <= 7'b0000000;
    alu_op <= 2'b10;

    #(CLK_PERIOD)

    `ASSERT_EQ(4'b0000, alu_ctrl);
    
    // SRA
    funct3 <= 3'b101;
    funct7 <= 7'b0100000;
    alu_op <= 2'b10;

    #(CLK_PERIOD)

    `ASSERT_EQ(4'b1101, alu_ctrl);

    `FINISH_TEST();
  end

endmodule // test


