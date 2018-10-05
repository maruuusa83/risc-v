//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

typedef enum bit [6:0] {
  OP_IMM = 'b0010011,
  OP     = 'b0110011
  } OPCODE;

typedef enum bit [2:0] {
  ADD  = 'b000,
  SLL  = 'b001,
  SLT  = 'b010,
  SLTU = 'b011,
  XOR  = 'b100,
  SRX  = 'b101,
  OR   = 'b110,
  AND  = 'b111
  } FUNC3;

