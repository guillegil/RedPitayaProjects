

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "adc_controller" "NUM_INSTANCES" "DEVICE_ID"  "C_S_ADC_AXI_DATA_BASEADDR" "C_S_ADC_AXI_DATA_HIGHADDR"
}
