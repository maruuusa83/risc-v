//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

module ALU_CONTROLLER
#(
  parameter REG_DATA_WIDTH = 32
)
(
  input clk,
  input nreset,

  input [6:0] opcode,
  input [1:0] alu_op,
  output reg [3:0] alu_ctrl
);

  always @(posedge clk or negedge nreset) begin
    if (nreset != 1'b0) begin
    end
    else begin
    end
  end

endmodule // CONTROLLER

