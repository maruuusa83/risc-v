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

  reg [6:0] opcode;
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

    `ASSERT_EQ(1'h0, 1'h0);

    `FINISH_TEST();
  end

endmodule // test


