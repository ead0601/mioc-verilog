# README.TXT
#
1) In this project we will be simulating the MIOC ASIC in verilog.
2) Each module is a directory, with its own make file and verification env.
3) The top-level block will be called "mioc_top", currently work in progress.

# HISTORY
#
This ASIC is used in the ADAM computer system. It is a custom timing and control
ASIC. In order to source a replacement part, a CPLD version will be created
from die snapshots that were taken.

# STATUS
#
The soc block mioc-top, which is the toplevel is currently under construction.
This testbench is not currently functioning. The other soc blocks may be used, use the
same makefile (located in its respective directory), with similar build
targets as shown below in, # HOW TO BUILD.

# INSTALL TOOLS
#
# This install iverilog and gtkwave for viewing waveforms.

1) sudo apt install iverilog gtkwave 

# GTKWAVE FYI
#
1) Please note that once you have a wave session running, you can "make run"
   in the background, and then File->Reload Waveform in the tool. There is
   no need to restart the tool.

# HOW TO BUILD
#
cd mioc-flop
make clean
make build    # clean also executed
make run      # clean, build also executed
make waves    # clean, build, run also executed

# HOW TO RUN TOP (in development)
#
#  (make build is not directly callable)

cd mioc-top
ls -la tests

make run test="test-001-system-reset"
 or
make waves test="test-001-system-reset" 
