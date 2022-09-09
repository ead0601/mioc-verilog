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

V_SRC = $(shell ls src/*.v | grep "nmos"  2>/dev/null)

build : clean $(V_SRC) 
	$(COMP) -v $(V_SRC) ./src/testbench.v

run :   build
	$(RUN) a.out

waves:  run
	gtkwave waves.vcd waves.gtkw

# Clean
#
clean : 
	$(RM) -f ./DATA_OUT/*.*
	$(RM) -f a.out waves.vcd *.xcf

# Remove builtin rules
#
.SUFFIXES:

.SECONDARY:
