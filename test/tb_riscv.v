//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`include "lib/utils.v"

`timescale 1ns/1ps

module test();
  parameter CLK_PERIOD = 10;

  reg clk;
  reg ncpurst;

  RV32I_CORE
    #( .REG_DATA_WIDTH(32) )
  rv32
    ( .clk(clk),
      .ncpurst(ncpurst));

  always #(CLK_PERIOD/2) begin
    clk <= !clk;
  end

  `TESTARRAY(tb_riscv);
    ncpurst = 1'b1;
  `ENDTESTARRAY;

endmodule // test
