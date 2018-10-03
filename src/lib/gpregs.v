//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

module GPREGS
#(
  parameter REG_DATA_WIDTH = 32
)
(
  input CLK,
  input RESET,
  
  input [4:0] read_reg_0,
  input [4:0] read_reg_1,
  input [4:0] write_reg,
  input [REG_DATA_WIDTH - 1:0] din,
  input din_enable,
  output [REG_DATA_WIDTH - 1:0] dout_reg_0,
  output [REG_DATA_WIDTH - 1:0] dout_reg_1
);

endmodule // GPREGS
