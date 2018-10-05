#
# Copyright (c) 2018 Daichi Teruya @maruuusa83
# This project is released under the MIT license.
# https://github.com/maruuusa83/risc-v/blob/master/LICENSE
#

TEST_DIR=$(PROJECT_ROOT)/test
TEST_DIR_LST=$(shell find $(TEST_DIR) -type d)
TEST_SRC=$(foreach dir, $(TEST_DIR_LST), $(wildcard $(dir)/tb_*.v))

TEST_EXECUTABLE=$(TEST_SRC:.v=.o)

IV=iverilog
IVFLAGS=-g2005-sv -DDEBUG

.SUFFIXES: .o .v

.PHONY: all
all: $(TEST_EXECUTABLE)

.PHONY: run
run: $(TEST_EXECUTABLE)
	$(foreach e, $(TEST_EXECUTABLE), $(e);)

.v.o:
	$(IV) $(IVFLAGS) -o $@  $< $(SRC)

tb_riscv.o: $(SRC)
lib/tb_gpregs.o: $(SRC_DIR)/lib/gpregs.v
lib/tb_alu.o: $(SRC_DIR)/lib/alu.v
lib/tb_controller.o: $(SRC_DIR)/lib/controller.v

.PHONY: clean
clean:
	$(RM) ./*.o ./lib/*.o
