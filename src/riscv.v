//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

module RV32I_CORE
#(
  parameter REG_DATA_WIDTH = 32
)
(
  input clk,
  input ncpurst
);

  GPREGS
    #( .REG_DATA_WIDTH(REG_DATA_WIDTH))
  gpregs
    ( .read_reg_0(),
      .read_reg_1(),
      .write_reg(),
      .din(),
      .din_enable(),
      .dout_reg_0(),
      .dout_reg_1());

endmodule // risc_v_core
