//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`include "lib/utils.v"

`timescale 1ns/1ps

module tb_alu();
  parameter CLK_PERIOD = 10;
  parameter REG_DATA_WIDTH = 32;
  
  localparam CTRL_WIDTH = 4;
  localparam NUM_OF_ITR = 100;

  reg clk = 1'b0;
  reg nreset;

  reg signed [REG_DATA_WIDTH - 1:0] din_0;
  reg signed [REG_DATA_WIDTH - 1:0] din_1;
  reg [CTRL_WIDTH - 1: 0] ctrl;
  wire signed [REG_DATA_WIDTH - 1:0] result;

  ALU alu (.*);

  always #(CLK_PERIOD/2) begin
    clk <= !clk;
  end

  int random_temp = 10;
  reg unsigned [REG_DATA_WIDTH - 1: 0] rand_u_0, rand_u_1;
  `TESTARRAY(tb_alu);
    nreset <= 1'b0;
    #(CLK_PERIOD)
    nreset <= 1'b1;
    #(CLK_PERIOD)

    // ADD
    `TEST(add_corner);
      nreset <= 1'b0;
      #(CLK_PERIOD)
      nreset <= 1'b1;
      #(CLK_PERIOD)

      ctrl <= 4'b0000;
      din_0 <= 32'hFFFFFFFF;
      din_1 <= 32'hFFFFFFFF;
      #(CLK_PERIOD)

      `ASSERT_EQ(32'hFFFFFFFE, result);

      din_0 <= 32'hFFFFFFFF;
      din_1 <= 32'd1;

      #(CLK_PERIOD)

      `ASSERT_EQ(32'd0, result);
    `ENDTEST;

    `TEST(random_add);
      ctrl <= 4'b0000;
      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp);

        #(CLK_PERIOD)

        `ASSERT_EQ(din_0 + din_1, result);
      end
    `ENDTEST;

    `TEST(random_sll);
      ctrl <= 4'b0001;

      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp) & 32'h0000001F;

        #(CLK_PERIOD)

        `ASSERT_EQ(din_0 << din_1, result);
      end
    `ENDTEST;

    `TEST(random_slt);
      ctrl <= 4'b0010;

      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp);

        #(CLK_PERIOD)

        `ASSERT_EQ(din_0 < din_1, result);
      end
    `ENDTEST;

    `TEST(random_sltu);
      ctrl <= 4'b0011;

      repeat (NUM_OF_ITR) begin
        din_0 <= $urandom(random_temp);
        din_1 <= $urandom(random_temp);

        #(CLK_PERIOD)

        `ASSERT_EQ(({1'b0, din_0} < {1'b0, din_1}), result);
      end
    `ENDTEST;

    `TEST(random_xor);
      ctrl <= 4'b0100;

      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp);

        #(CLK_PERIOD)

        `ASSERT_EQ((din_0 ^ din_1), result);
      end
    `ENDTEST;
    
    `TEST(random_srl);
      ctrl <= 4'b0101;

      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp) & 32'h0000001F;

        #(CLK_PERIOD)

        `ASSERT_EQ(din_0 >> din_1, result);
      end
    `ENDTEST;
    
    `TEST(random_sra);
      ctrl <= 4'b1101;

      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp) & 32'h0000001F;

        #(CLK_PERIOD)

        `ASSERT_EQ(din_0 >>> din_1, result);
      end
    `ENDTEST;

    // OR
    `TEST(random_or);
      ctrl <= 4'b0110;

      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp);

        #(CLK_PERIOD)

        `ASSERT_EQ((din_0 | din_1), result);
      end
    `ENDTEST;
    
    // AND
    `TEST(random_and);
      ctrl <= 4'b0111;

      repeat (NUM_OF_ITR) begin
        din_0 <= $random(random_temp);
        din_1 <= $random(random_temp);

        #(CLK_PERIOD)

        `ASSERT_EQ((din_0 & din_1), result);
      end
    `ENDTEST;
  `ENDTESTARRAY;

endmodule // tb_alu_controller


