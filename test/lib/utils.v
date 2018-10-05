//
// Copyright (c) 2018 Daichi Teruya @maruuusa83
// This project is released under the MIT license.
// https://github.com/maruuusa83/risc-v/blob/master/LICENSE
//

`ifdef DEBUG

`define INFO(_msg) \
  $display(`"[ INFO ] %s %4d:\n _msg`", `__FILE__, `__LINE__)

`define ERROR(_msg) \
  $display(`"[ ERROR ] %s %4d:\n _msg`", `__FILE__, `__LINE__)

`define ASSERT_EQ(_expected, _actual) \
  if ((_expected) !== (_actual)) begin \
    $display(`"### TEST FAILED ###`" ); \
    $display(`"[ TEST ] assertion failed in %s > %s`", __TEST_ARY_NAME__, __TEST_NAME__); \
    $display(`"(%s, %4d)`", `__FILE__, `__LINE__); \
    $display(`"\texpected:\t%h \n\tactual:\t\t%h`", _expected, _actual); \
    $finish(-1); \
  end

`define TESTARRAY(_arynam) \
  string __TEST_ARY_NAME__ = "_arynam"; \
  string __TEST_NAME__; \
  int __TEST_COUNT__ = 0; \
  initial begin

`define TEST(_testnam) \
  __TEST_COUNT__ = __TEST_COUNT__ + 1; \
  __TEST_NAME__ = "_testnam"

`define ENDTEST

`define ENDTESTARRAY \
  $display("[ TEST ] PASSED\t%s\t%t", __TEST_ARY_NAME__, $time); \
  $display("[ TEST ] %4d tests passed in %s", __TEST_COUNT__, __TEST_ARY_NAME__); \
  $finish(); \
  end \
  reg __endtestarray

`endif
