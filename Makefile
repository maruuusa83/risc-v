#
# Copyright (c) 2018 Daichi Teruya @maruuusa83
# This project is released under the MIT license.
# https://github.com/maruuusa83/risc-v/blob/master/LICENSE
#

BIN_DIR=bin

PROJECT_ROOT=$(PWD)
BIN_DIR=$(PROJECT_ROOT)/bin
TEST_DIR=$(PROJECT_ROOT)/test

export PROJECT_ROOT
export BIN_DIR

.PHONY: all
all: test

.PHONY: bindir
bindir:
	@if [ ! -d $(BIN_DIR) ]; \
		then echo "mkdir -p $(BIN_DIR)"; mkdir -p $(BIN_DIR); \
		fi

.PHONY: test
test: bindir
	$(MAKE) -C $(TEST_DIR)

.PHONY: clean
clean:
	$(RM) -r $(BIN_DIR)
