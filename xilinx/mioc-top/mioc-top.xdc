 14 read_verilog {./src/*.v}
    15 read_verilog {src/mio_flop_rtl.v}
    16 read_verilog {src/mioc_flop_rtl.v}
    17 all_clocks
    18 current_design
    19 get_cells
    20 get_cells u*
    21 create_bd_design "mioc_top"
    22 update_compile_order -fileset sources_1

    23 get_cells u*
    24 current_design
    25 set_dont_touch {get_cells u*}
    26 set_property DONT_TOUCH true [get_cells u*]
    27 set_property target_constrs_file /home/ediaz/Xilinx/PROJECTS/MIOC/MIOC.srcs/constrs_1/new/mioc.xdc [current_fileset -constrset]
    28 save_constraints -force
    29 reset_run synth_1
    30 launch_runs synth_1 -jobs 20
    31 close_design
    32 open_run synth_1 -name synth_1
    33 history

