startgroup
create_bd_cell -type hier ProcessingSystem 
create_bd_cell -type ip  -vlnv xilinx.com:ip:processing_system7 ProcessingSystem/processing_system7_0
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells ProcessingSystem/processing_system7_0]
set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET {../components/red_pitaya.xml}] [get_bd_cells ProcessingSystem/processing_system7_0]
endgroup

# Automatization
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" }  [get_bd_cells ProcessingSystem/processing_system7_0]
