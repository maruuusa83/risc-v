//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`ifdef DEBUG

`define INFO(_msg) \
  $display(`"INFO %s %4d:\n _msg`", `__FILE__, `__LINE__)

`define ERROR(_msg) \
  $display(`"ERROR %s %4d:\n _msg`", `__FILE__, `__LINE__)

`define ASSERT_EQ(_expected, _actual) \
  if ((_expected) !== (_actual)) begin \
    $display(`"INFO %s %4d:\n assertion failed: \n\t expected:\t %h \n\t actual:\t %h`", `__FILE__, `__LINE__, _expected, _actual); \
    $finish(-1); \
  end

`define FINISH_TEST \
  `INFO(test succeed); $finish

`else

`define ERROR(msg)
`define ASSERT_EQ(_expected, _actual)

`endif
