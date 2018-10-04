//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`include "lib/utils.v"

`timescale 1ns/1ps

module tb_gpregs();
  parameter CLK_PERIOD = 10;
  parameter REG_DATA_WIDTH = 32;

  reg clk = 1'b0;
  reg nreset;

  reg [4:0] read_reg_0;
  reg [4:0] read_reg_1;
  reg [4:0] write_reg;
  reg [REG_DATA_WIDTH - 1:0] din;
  reg din_enable;
  wire [REG_DATA_WIDTH - 1:0] dout_reg_0;
  wire [REG_DATA_WIDTH - 1:0] dout_reg_1;

  GPREGS gpregs (.*);

  always #(CLK_PERIOD/2) begin
    clk <= !clk;
  end

  initial begin
    nreset <= 1'b0;
    #(CLK_PERIOD)
    nreset <= 1'b1;
    #(CLK_PERIOD)

    read_reg_0 <= 5'd0;
    read_reg_1 <= 5'd0;
    write_reg  <= 1'b0;
    din        <= 32'h0;
    din_enable <= 1'b0;

    #(CLK_PERIOD)

    `ASSERT_EQ(32'd0, dout_reg_0);
    `ASSERT_EQ(32'd0, dout_reg_1);

    write_reg <= 1'b0;
    din       <= 32'hFF;

    #(CLK_PERIOD)

    `ASSERT_EQ(32'd0, dout_reg_0);

    write_reg  <= 1'd1;
    din        <= 32'h12;
    read_reg_0 <= 1'd1;
    din_enable <= 1'b1;

    #(CLK_PERIOD)

    din_enable <= 1'b0;

    `ASSERT_EQ(32'h12, dout_reg_0);

    `FINISH_TEST();
  end

endmodule // test

