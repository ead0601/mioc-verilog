# README.txt
#
1) In this project we will be simulation the MIOC ASIC in verilog.
2) Each module is a directory, with its own make file and verification env.
3) The top-level block will be called "mioc_top", but does not currently exist

# Install tools
#
sudo apt install iverilog gtkwave 

# How to comile a block and execute its testbench
#
cd mioc-flop
make clean
make build    # clean also executed
make run      # clean, build also executed
makw waves    # clean, build, run also executed
