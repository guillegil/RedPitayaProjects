# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ENABLE_CLK_DIV2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ENABLE_AXI_INTERFACE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADC_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USE_CHANNEL" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "RESET_TYPE" -parent ${Page_0} -widget comboBox


}

proc update_PARAM_VALUE.ADC_DATA_WIDTH { PARAM_VALUE.ADC_DATA_WIDTH } {
	# Procedure called to update ADC_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADC_DATA_WIDTH { PARAM_VALUE.ADC_DATA_WIDTH } {
	# Procedure called to validate ADC_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.ENABLE_AXI_INTERFACE { PARAM_VALUE.ENABLE_AXI_INTERFACE } {
	# Procedure called to update ENABLE_AXI_INTERFACE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_AXI_INTERFACE { PARAM_VALUE.ENABLE_AXI_INTERFACE } {
	# Procedure called to validate ENABLE_AXI_INTERFACE
	return true
}

proc update_PARAM_VALUE.ENABLE_CLK_DIV2 { PARAM_VALUE.ENABLE_CLK_DIV2 } {
	# Procedure called to update ENABLE_CLK_DIV2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_CLK_DIV2 { PARAM_VALUE.ENABLE_CLK_DIV2 } {
	# Procedure called to validate ENABLE_CLK_DIV2
	return true
}

proc update_PARAM_VALUE.RESET_TYPE { PARAM_VALUE.RESET_TYPE } {
	# Procedure called to update RESET_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RESET_TYPE { PARAM_VALUE.RESET_TYPE } {
	# Procedure called to validate RESET_TYPE
	return true
}

proc update_PARAM_VALUE.USE_CHANNEL { PARAM_VALUE.USE_CHANNEL } {
	# Procedure called to update USE_CHANNEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_CHANNEL { PARAM_VALUE.USE_CHANNEL } {
	# Procedure called to validate USE_CHANNEL
	return true
}

proc update_PARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH { PARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH } {
	# Procedure called to update C_S_ADC_AXI_DATA_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH { PARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH } {
	# Procedure called to validate C_S_ADC_AXI_DATA_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH { PARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH } {
	# Procedure called to update C_S_ADC_AXI_DATA_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH { PARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH } {
	# Procedure called to validate C_S_ADC_AXI_DATA_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_ADC_AXI_DATA_BASEADDR { PARAM_VALUE.C_S_ADC_AXI_DATA_BASEADDR } {
	# Procedure called to update C_S_ADC_AXI_DATA_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_ADC_AXI_DATA_BASEADDR { PARAM_VALUE.C_S_ADC_AXI_DATA_BASEADDR } {
	# Procedure called to validate C_S_ADC_AXI_DATA_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_ADC_AXI_DATA_HIGHADDR { PARAM_VALUE.C_S_ADC_AXI_DATA_HIGHADDR } {
	# Procedure called to update C_S_ADC_AXI_DATA_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_ADC_AXI_DATA_HIGHADDR { PARAM_VALUE.C_S_ADC_AXI_DATA_HIGHADDR } {
	# Procedure called to validate C_S_ADC_AXI_DATA_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH { MODELPARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH PARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_ADC_AXI_DATA_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH { MODELPARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH PARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_ADC_AXI_DATA_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.ENABLE_AXI_INTERFACE { MODELPARAM_VALUE.ENABLE_AXI_INTERFACE PARAM_VALUE.ENABLE_AXI_INTERFACE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_AXI_INTERFACE}] ${MODELPARAM_VALUE.ENABLE_AXI_INTERFACE}
}

proc update_MODELPARAM_VALUE.ADC_DATA_WIDTH { MODELPARAM_VALUE.ADC_DATA_WIDTH PARAM_VALUE.ADC_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADC_DATA_WIDTH}] ${MODELPARAM_VALUE.ADC_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.USE_CHANNEL { MODELPARAM_VALUE.USE_CHANNEL PARAM_VALUE.USE_CHANNEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_CHANNEL}] ${MODELPARAM_VALUE.USE_CHANNEL}
}

proc update_MODELPARAM_VALUE.ENABLE_CLK_DIV2 { MODELPARAM_VALUE.ENABLE_CLK_DIV2 PARAM_VALUE.ENABLE_CLK_DIV2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_CLK_DIV2}] ${MODELPARAM_VALUE.ENABLE_CLK_DIV2}
}

proc update_MODELPARAM_VALUE.RESET_TYPE { MODELPARAM_VALUE.RESET_TYPE PARAM_VALUE.RESET_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RESET_TYPE}] ${MODELPARAM_VALUE.RESET_TYPE}
}

