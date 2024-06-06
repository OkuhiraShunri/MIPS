## Generated SDC file "mips.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Standard Edition"

## DATE    "Thu May 09 14:43:46 2024"

##
## DEVICE  "10M50DAF484C6GES"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLK} -period 10.000 -waveform { 0.000 5.000 } [get_ports {MAX10_CLK1_50 MAX10_CLK2_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {CLK}] -rise_to [get_clocks {CLK}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK}] -fall_to [get_clocks {CLK}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -rise_to [get_clocks {CLK}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -fall_to [get_clocks {CLK}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ADC_CLK_10}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[9]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[10]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[11]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[12]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[13]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[14]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[15]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_RESET_N}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[9]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[10]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[11]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[12]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[13]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[14]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[15]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[9]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[10]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[11]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[12]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[13]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[14]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[15]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[16]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[17]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[18]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[19]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[20]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[21]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[22]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[23]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[24]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[25]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[26]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[27]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[28]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[29]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[30]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[31]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[32]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[33]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[34]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[35]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_INT[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_INT[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDI}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDO}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {KEY[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {KEY[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {MAX10_CLK1_50}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {MAX10_CLK2_50}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[9]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_RESET_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_BA[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_BA[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CAS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CKE}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CLK}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_LDQM}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_RAS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_UDQM}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_WE_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[16]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[17]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[18]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[19]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[20]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[21]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[22]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[23]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[24]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[25]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[26]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[27]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[28]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[29]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[30]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[31]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[32]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[33]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[34]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[35]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_CS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SCLK}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDI}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDO}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_HS}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_VS}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

