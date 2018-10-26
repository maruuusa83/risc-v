//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`include "lib/utils.v"

module CONTROLLER
#(
  parameter REG_DATA_WIDTH = 32
)
(
  input clk,
  input nreset,

  input [2:0] funct3,
  input [6:0] funct7,
  input [6:0] opcode,
  output reg [1:0] alu_op,

  output reg alu_src_a,
  output reg alu_src_b
);

  always @(posedge clk or negedge nreset) begin
    if (nreset != 1'b0) begin
      case (opcode)
        OP_IMM: begin
	  alu_op <= 2'b10;
	end

        OP: begin
	  alu_op <= 2'b10;
	end
      endcase
    end
    else begin
      alu_op <= 2'd0;
    end
  end

endmodule // CONTROLLER

