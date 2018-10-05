#
# Copyright (c) 2018 Daichi Teruya @maruuusa83
# This project is released under the MIT license.
# https://github.com/maruuusa83/risc-v/blob/master/LICENSE
#

TEST_NAME=tb_riscv.v lib/tb_gpregs.v lib/tb_alu.v lib/tb_alu_controller.v lib/tb_controller.v

TEST_DIR=$(PROJECT_ROOT)/test
TEST_EXECUTABLE=$(TEST_NAME:.v=.o)

IV=iverilog
IVFLAGS=-g2005-sv -DDEBUG

.SUFFIXES: .o .v

.PHONY: all
all: $(TEST_EXECUTABLE)

.v.o:
	$(IV) $(IVFLAGS) -o $@  $< $(addprefix $(SRC_DIR)/, $(SRC))

tb_riscv.o: $(addprefix $(SRC_DIR)/, $(SRC))
lib/tb_gpregs.o: $(SRC_DIR)/lib/gpregs.v
lib/tb_alu.o: $(SRC_DIR)/lib/alu.v
lib/tb_controller.o: $(SRC_DIR)/lib/controller.v

.PHONY: clean
clean:
	$(RM) ./*.o ./lib/*.o
