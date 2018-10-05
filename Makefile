#
# Copyright (c) 2018 Daichi Teruya @maruuusa83
# This project is released under the MIT license.
# https://github.com/maruuusa83/risc-v/blob/master/LICENSE
#

BIN_DIR=bin

PROJECT_ROOT=$(PWD)
BIN_DIR=$(PROJECT_ROOT)/bin
TEST_DIR=$(PROJECT_ROOT)/test

SRC_DIR=$(PROJECT_ROOT)/src
SRC_DIR_LST=$(shell find $(SRC_DIR) -type d)
SRC=$(foreach dir, $(SRC_DIR_LST), $(wildcard $(dir)/*.v))

export PROJECT_ROOT
export BIN_DIR
export SRC
export SRC_DIR

.PHONY: all
all: test

.PHONY: test
test:
	$(MAKE) -C $(TEST_DIR)

.PHONY: clean
clean:
	$(RM) -r $(BIN_DIR)
	$(MAKE) -C $(TEST_DIR) clean
