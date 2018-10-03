#
# Copyright (c) 2018 Daichi Teruya @maruuusa83
# This project is released under the MIT license.
# https://github.com/maruuusa83/risc-v/blob/master/LICENSE
#

TEST_NAME=tb_riscv.v
TEST_EXECUTABLE=$(BIN_DIR)/$(TEST_NAME:.v=.o)

SRC_DIR=$(PROJECT_ROOT)/src
SRC=riscv.v lib/gpregs.v

IV=iverilog

.PHONY: all
all:
	$(IV) -o $(TEST_EXECUTABLE) $(TEST_NAME) $(addprefix $(SRC_DIR)/, $(SRC))
