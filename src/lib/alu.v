//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

module ALU
#(
  parameter REG_DATA_WIDTH = 32
)
(
  input clk,
  input nreset,

  input signed [REG_DATA_WIDTH - 1:0] din_0,
  input signed [REG_DATA_WIDTH - 1:0] din_1,
  input [CTRL_WIDTH - 1: 0] ctrl,

  output reg signed [REG_DATA_WIDTH - 1:0] result
);

  localparam CTRL_WIDTH = 4;

  wire unsigned [REG_DATA_WIDTH - 1:0] din_u_0;
  wire unsigned [REG_DATA_WIDTH - 1:0] din_u_1;

  assign din_u_0 = din_0;
  assign din_u_1 = din_1;

  always @(posedge clk or negedge nreset) begin
    if (nreset != 1'b0) begin
      case (ctrl)
        4'b0000: result = din_0 + din_1; // ADD
	4'b0001: result = din_0 << din_1; // SLL
	4'b0010: result = (din_0 < din_1); // SLT
	4'b0011: result = ({1'b0, din_0} < {1'b0, din_1}); // SLTU (din_x will be unsigned)
	4'b0100: result = din_0 ^ din_1; // XOR
	4'b0101: result = din_0 >> din_1; // SRL
	4'b1101: result = din_0 >>> din_1; // SRA
	4'b0110: result = din_0 | din_1; // OR
	4'b0111: result = din_0 & din_1; // AND
      endcase
    end
    else begin
      result <= 32'd0;
    end
  end

endmodule // ALU
