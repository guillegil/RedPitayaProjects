# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DAC_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USE_CHANNEL" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "ENABLE_CE_PORT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ENABLE_RST_PORT" -parent ${Page_0}


}

proc update_PARAM_VALUE.DAC_DATA_WIDTH { PARAM_VALUE.DAC_DATA_WIDTH } {
	# Procedure called to update DAC_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DAC_DATA_WIDTH { PARAM_VALUE.DAC_DATA_WIDTH } {
	# Procedure called to validate DAC_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.ENABLE_CE_PORT { PARAM_VALUE.ENABLE_CE_PORT } {
	# Procedure called to update ENABLE_CE_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_CE_PORT { PARAM_VALUE.ENABLE_CE_PORT } {
	# Procedure called to validate ENABLE_CE_PORT
	return true
}

proc update_PARAM_VALUE.ENABLE_RST_PORT { PARAM_VALUE.ENABLE_RST_PORT } {
	# Procedure called to update ENABLE_RST_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_RST_PORT { PARAM_VALUE.ENABLE_RST_PORT } {
	# Procedure called to validate ENABLE_RST_PORT
	return true
}

proc update_PARAM_VALUE.USE_CHANNEL { PARAM_VALUE.USE_CHANNEL } {
	# Procedure called to update USE_CHANNEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_CHANNEL { PARAM_VALUE.USE_CHANNEL } {
	# Procedure called to validate USE_CHANNEL
	return true
}


proc update_MODELPARAM_VALUE.DAC_DATA_WIDTH { MODELPARAM_VALUE.DAC_DATA_WIDTH PARAM_VALUE.DAC_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DAC_DATA_WIDTH}] ${MODELPARAM_VALUE.DAC_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.ENABLE_RST_PORT { MODELPARAM_VALUE.ENABLE_RST_PORT PARAM_VALUE.ENABLE_RST_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_RST_PORT}] ${MODELPARAM_VALUE.ENABLE_RST_PORT}
}

proc update_MODELPARAM_VALUE.ENABLE_CE_PORT { MODELPARAM_VALUE.ENABLE_CE_PORT PARAM_VALUE.ENABLE_CE_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_CE_PORT}] ${MODELPARAM_VALUE.ENABLE_CE_PORT}
}

proc update_MODELPARAM_VALUE.USE_CHANNEL { MODELPARAM_VALUE.USE_CHANNEL PARAM_VALUE.USE_CHANNEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_CHANNEL}] ${MODELPARAM_VALUE.USE_CHANNEL}
}

