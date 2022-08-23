# README.TXT
#
1) In this project we will be simulating the MIOC ASIC in verilog.
2) Each module is a directory, with its own make file and verification env.
3) The top-level block will be called "mioc_top", but does not currently exist

# INSTALL TOOLS
#
sudo apt install iverilog gtkwave 

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

#TBD (to be done)
#
make compare  # compare DATA_OUT to DATA_GOLD
make cpld     # compile the cpld (not mos) version of MIOC
make bitpat   # create CPLD bit pattern to upload

