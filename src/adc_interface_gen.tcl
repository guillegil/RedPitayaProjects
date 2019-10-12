# Create a new project
create_project -part xc7z010clg400-1  -force lab [lindex $argv 0]

# Create a block design
create_bd_design -dir ./ -name system
open_bd_design system

# Adding IP repositories
set_property IP_REPO_PATHS {../ip_cores/} [current_fileset] 
update_ip_catalog 

# Adding core to the block design 
startgroup
create_bd_cell -type ip -vlnv user.org:user:adc_controller:1.0 adc_controller_0
set_property -dict [list CONFIG.ADC_DATA_WIDTH {14} ] [get_bd_cells adc_controller_0]
set_property -dict [list CONFIG.ENABLE_AXI_INTERFACE {TRUE} ] [get_bd_cells adc_controller_0]
set_property -dict [list CONFIG.USE_CHANNEL {Both} ] [get_bd_cells adc_controller_0]

set_property -dict [list CONFIG.ENABLE_CE_PORT {FALSE} ] [get_bd_cells adc_controller_0]
set_property -dict [list CONFIG.ENABLE_RESET_PORT {FALSE} ] [get_bd_cells adc_controller_0]
endgroup

startgroup
# Creating ADC input ports
create_bd_intf_port -vlnv xilinx.com:interface:diff_clock_rtl:1.0 -mode Slave DIFF_ADC_CLK_IN
create_bd_port -dir I -from 13 -to 0 ADC_DATA_IN_A
create_bd_port -dir I -from 13 -to 0 ADC_DATA_IN_B

# Creating ADC output port 
create_bd_port -dir O ADC_CSN

# Conections
connect_bd_intf_net [get_bd_intf_pins adc_controller_0/DIFF_ADC_CLK_IN] [get_bd_intf_pins DIFF_ADC_CLK_IN]
connect_bd_net [get_bd_ports ADC_DATA_IN_A] [get_bd_pins adc_controller_0/ADC_DATA_IN_A]
connect_bd_net [get_bd_ports ADC_DATA_IN_B] [get_bd_pins adc_controller_0/ADC_DATA_IN_B]
connect_bd_net [get_bd_ports ADC_CSN] [get_bd_pins adc_controller_0/ADC_CSN]
endgroup

source ps7_init.tcl

# Automatization
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/ProcessingSystem/processing_system7_0/M_AXI_GP0" Clk "Auto" } [get_bd_intf_pins adc_controller_0/S_ADC_AXI_DATA]

move_bd_cells ProcessingSystem [get_bd_cells /rst_ps7_0_125M]

regenerate_bd_layout



