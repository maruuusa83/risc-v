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

UTILITY_SRC=$(SRC_DIR)/lib/utils.v $(TEST_DIR)/lib/utils.v

.SUFFIXES: .o .v

.PHONY: all
all: $(TEST_EXECUTABLE)

.PHONY: run
run: all
	$(foreach e, $(TEST_EXECUTABLE), $(e);)

.v.o:
	$(IV) $(IVFLAGS) -o $@  $< $(SRC)

$(TEST_DIR)/tb_riscv.o: $(UTILITY_SRC) $(SRC)
$(TEST_DIR)/lib/tb_gpregs.o: $(UTILITY_SRC) $(SRC_DIR)/lib/gpregs.v
$(TEST_DIR)/lib/tb_alu.o: $(UTILITY_SRC) $(SRC_DIR)/lib/alu.v
$(TEST_DIR)/lib/tb_controller.o: $(UTILITY_SRC) $(SRC_DIR)/lib/controller.v


.PHONY: clean
clean:
	$(RM) ./*.o ./lib/*.o
