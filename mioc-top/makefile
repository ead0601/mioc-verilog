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


# Build design
#

tester_build : clean $(V_SRC)
	$(COMP) -DTESTER $(V_SRC) ./tests/$(test)/testbench.v

waves_build : clean $(V_SRC)
	$(COMP) $(V_SRC) ./tests/$(test)/testbench.v


# Used for wave viewing
#
# (used to capture all levels of signal transitions)
#

run :   waves_build
	@echo "Running test $(test)"
	$(RM) -f ./tests/$(test)/DATA_OUT/*.*
	$(RUN) a.out
	$(TL) -n +4 ./waves.vcd > ./tests/$(test)/DATA_OUT/waves.vcd 
	$(RM) -f ./waves.vcd 

waves:  run
	gtkwave ./tests/$(test)/DATA_OUT/waves.vcd ./tests/$(test)/waves.gtkw


# Used for regression testing
#
# (tester avoids capture on internal signals, and only captures the toplevel pins)
#
tester_run :   tester_build
	@echo "Running test $(test)"
	$(RM) -f ./tests/$(test)/DATA_OUT/*.*
	$(RUN) a.out
	$(TL) -n +4 ./waves.vcd > ./tests/$(test)/DATA_OUT/tester.vcd 
	$(RM) -f ./waves.vcd 

check:	tester_run ./tests/$(test)/DATA_GOLD/tester.vcd ./tests/$(test)/DATA_OUT/tester.vcd 
	$(eval ERRORS := $(shell diff ./tests/$(test)/DATA_OUT/tester.vcd  ./tests/$(test)/DATA_GOLD/tester.vcd | wc -l 2>/dev/null))
	@echo "\n\nCompared DATA_OUT vcd to DATA_GOLD vcd"
	@echo $(ERRORS) " errors found.\n"

# Clean
#
clean :
	$(RM) -f a.out *.xcf

# Remove builtin rules
#
.SUFFIXES:

.SECONDARY:
