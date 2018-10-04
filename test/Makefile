#
# Copyright (c) 2018 Daichi Teruya @maruuusa83
# This project is released under the MIT license.
# https://github.com/maruuusa83/risc-v/blob/master/LICENSE
#

TEST_NAME=tb_riscv.v lib/tb_gpregs.v

TEST_DIR=$(PROJECT_ROOT)/test
# TEST_EXECUTABLE=$(addprefix $(BIN_DIR)/, $(TEST_NAME:.v=.o))
TEST_EXECUTABLE=$(TEST_NAME:.v=.o)

SRC_DIR=$(PROJECT_ROOT)/src
SRC=riscv.v lib/gpregs.v

IV=iverilog

.SUFFIXES: .o .v

.PHONY: all
all: $(TEST_EXECUTABLE)

.v.o:
	$(IV) -o $@  $< $(addprefix $(SRC_DIR)/, $(SRC))

.PHONY: clean
clean:
	$(RM) ./*.o ./lib/*.o
