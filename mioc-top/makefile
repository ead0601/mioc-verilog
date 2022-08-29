# MIOC verilog make file
#
#

COMP  = $(shell which iverilog)
RUN   = $(shell which vvp)
WAVES = $(shell which )

# Define variables
#
CWD = $(shell pwd)

RM = /usr/bin/rm
MD = /usr/bin/mkdir
TL = /usr/bin/tail

V_SRC = $(shell find ../. -name "*mioc*.v" 2>/dev/null)

build : clean $(V_SRC)
	$(COMP) $(V_SRC) tests/$(test)/testbench.v

run :   build
	@echo "Running test $(test)"
	$(RM) -f DATA_OUT/*.*
	$(RM) -f DATA_GOLD/*.*
	$(RUN) a.out
	$(TL) -n +4 ./waves.vcd > ./DATA_OUT/waves.vcd 
	$(RM) -f ./waves.vcd 

waves:  run
	gtkwave ./DATA_OUT/waves.vcd waves.gtkw

check:	run ./tests/$(test)/DATA_GOLD/waves.vcd
	$(eval ERRORS := $(shell diff ./DATA_OUT/waves.vcd ./tests/$(test)/DATA_GOLD/waves.vcd | wc -l 2>/dev/null))
	@echo "\n\nCompared DATA_OUT vcd to DATA_GOLD vcd"
	@echo $(ERRORS) " errors found.\n"

# Clean
#
clean :
	$(RM) -f ./DATA_OUT/*.*
	$(RM) -f a.out *.xcf

# Remove builtin rules
#
.SUFFIXES:

.SECONDARY:
