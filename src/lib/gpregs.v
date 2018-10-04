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
  input clk,
  input nreset,
  
  input [4:0] read_reg_0,
  input [4:0] read_reg_1,
  input [4:0] write_reg,
  input [REG_DATA_WIDTH - 1:0] din,
  input din_enable,
  output reg [REG_DATA_WIDTH - 1:0] dout_reg_0,
  output reg [REG_DATA_WIDTH - 1:0] dout_reg_1
);

  reg [REG_DATA_WIDTH - 1:0] x_reg [0:32];

  always @(posedge clk or negedge nreset or posedge din_enable) begin
    if (nreset != 1'b0) begin
      // fetch
      dout_reg_0 <= x_reg[read_reg_0];
      dout_reg_1 <= x_reg[read_reg_1];

      // store
      if (din_enable == 1'b1 && write_reg != 5'd0) begin
        x_reg[write_reg] <= din;
      end
    end
    else begin
      x_reg[0] <= 32'd0;
      dout_reg_0 <= 32'd0;
      dout_reg_1 <= 32'd0;
    end
  end

endmodule // GPREGS
