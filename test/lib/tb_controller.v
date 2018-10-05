//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`include "lib/utils.v"

`timescale 1ns/1ps

module tb_controller();
  parameter CLK_PERIOD = 10;
  parameter REG_DATA_WIDTH = 32;

  reg clk = 1'b0;
  reg nreset;

  reg [2:0] funct3;
  reg [6:0] funct7;
  reg [6:0] opcode;
  wire [1:0] alu_op;

  CONTROLLER controller (.*);

  always #(CLK_PERIOD/2) begin
    clk <= !clk;
  end

  `TESTARRAY(alu_test);
    nreset <= 1'b0;
    #(CLK_PERIOD)
    nreset <= 1'b1;
    #(CLK_PERIOD)

    `TEST(R_type);
      opcode <= 7'b0110011;

      #(CLK_PERIOD)
      
      `ASSERT_EQ(2'b10, alu_op);
    `ENDTEST;
  `ENDTESTARRAY;

endmodule // tb_controller

