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

# METHODOLOGY
#
#  Only run "make run test=" or "make waves test=", since make build is
#  test dependant. Each test has the ability to have its own
#  unique testbench.
#
#  1) Each test is encapsulated in its own directory structure
#     	   ../mioc-top/tests/test-001-system-reset
#
#  2) Private testbench for each test
#     	   ../mioc-top/tests/test-001-system-reset/testbench.v
#
#  3) Each test stores its own golden verification test pattern
#     	   ../mioc-top/tests/test-001-system-reset/DATA_GOLD/waves.vcd
#
#  4) A simulations output data is stored in its respective DATA_OUT folder.
#     	   ../mioc-top/tests/test-001-system-reset/DATA_OUT/waves.vcd
#
#  5) Each test has its own GTKWAVE config file
#     	   ../mioc-top/tests/test-001-system-reset/waves.gtkw
#
#  6) Waves VCD files are also used as a method for regression checks

# STATUS
#
The soc block mioc-top, which is the toplevel is currently under construction.
The testbench is currently functioning, please try out some of the tests:

test-001-system-reset    - reset MIOC
test-002-memory-access   - sample memory access, triggers RAS and CAS


# HOW INSTALL TOOLS
#
# This install iverilog and gtkwave for viewing waveforms.

1) sudo apt install iverilog gtkwave 


# LIST TESTS
#
cd mioc-top
ls -la tests


# RUN A TEST
#
cd mioc-top

make run test="test-001-system-reset"
 or
make waves test="test-001-system-reset" 


# GTKWAVE FYI
#
1) Please note that once you have a wave session running, you can "make run"
   in the background, and then File->Reload Waveform in the tool. There is
   no need to restart the tool.


# HOW TO CREATE A NEW TEST
#
cd mioc-top/tests
cp -r test-002-memory-access test-XXX-YOUR-TEST-NAME
cd test-XXX-YOUR-TEST-NAME

*edit testbench.v and look for the folloing section: (modify that section)

(assignment and wait syntax should be obvious from test-002 example)

// #################  INSERT CUSTOM SEQUENCE BELOW #################
// #################  INSERT CUSTOM SEQUENCE BELOW #################
// #################  INSERT CUSTOM SEQUENCE BELOW #################     


# HOW TO CHECK A TESTS FUNCTIONALITY
#
# (The check does a diff between captured patterns
#  found in DATA_OUT vs DATA_GOLD)
#
cd mioc-top
make check test="test-001-system-reset"


# HOW TO BUILD SUB-BLOCKS
#
# (simple methodology, with no testbench structure)
#
cd mioc-flop
make clean
make build    # clean also executed
make run      # clean, build also executed
make waves    # clean, build, run also executed


