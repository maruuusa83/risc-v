//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`ifdef DEBUG

`define ERROR(_msg) \
  $display(`"ERROR %s %4d:\n _msg`", `__FILE__, `__LINE__)

`define ASSERT_EQ(_expected, _actual) \
  if ((_expected) !== (_actual)) \
    `ERROR(assertion failed: \n\t expected: _expected \n\t actual: _actual)

`else

`define ERROR(msg)
`define ASSERT_EQ(_expected, _actual)

`endif
