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

  localparam CTRL_WIDTH = 3;

  wire unsigned [REG_DATA_WIDTH - 1:0] din_u_0;
  wire unsigned [REG_DATA_WIDTH - 1:0] din_u_1;

  assign din_u_0 = din_0;
  assign din_u_1 = din_1;

  always @(posedge clk or negedge nreset) begin
    if (nreset != 1'b0) begin
      case (ctrl)
        3'b000: result = din_0 + din_1; // ADD
	3'b010: result = (din_0 < din_1); // SLT
	3'b011: result = ({1'b0, din_0} < {1'b0, din_1}); // SLTU (din_x will be unsigned)
	3'b100: result = din_0 ^ din_1; // XOR
	3'b110: result = din_0 | din_1; // OR
	3'b111: result = din_0 & din_1; // AND
      endcase
    end
    else begin
      result <= 32'd0;
    end
  end

endmodule // ALU
