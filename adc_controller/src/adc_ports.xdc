# set_property CFGBVS VCCO [current_design]
# set_property CONFIG_VOLTAGE 3.3 [current_design]

### ADC

# data

set_property IOSTANDARD LVCMOS18 [get_ports {ADC_DATA_IN_A[*]}]
set_property IOB TRUE [get_ports {ADC_DATA_IN_A[*]}]

set_property PACKAGE_PIN Y17 [get_ports {ADC_DATA_IN_A[0]}]
set_property PACKAGE_PIN W16 [get_ports {ADC_DATA_IN_A[1]}]
set_property PACKAGE_PIN Y16 [get_ports {ADC_DATA_IN_A[2]}]
set_property PACKAGE_PIN W15 [get_ports {ADC_DATA_IN_A[3]}]
set_property PACKAGE_PIN W14 [get_ports {ADC_DATA_IN_A[4]}]
set_property PACKAGE_PIN Y14 [get_ports {ADC_DATA_IN_A[5]}]
set_property PACKAGE_PIN W13 [get_ports {ADC_DATA_IN_A[6]}]
set_property PACKAGE_PIN V12 [get_ports {ADC_DATA_IN_A[7]}]
set_property PACKAGE_PIN V13 [get_ports {ADC_DATA_IN_A[8]}]
set_property PACKAGE_PIN T14 [get_ports {ADC_DATA_IN_A[9]}]
set_property PACKAGE_PIN T15 [get_ports {ADC_DATA_IN_A[10]}]
set_property PACKAGE_PIN V15 [get_ports {ADC_DATA_IN_A[11]}]
set_property PACKAGE_PIN T16 [get_ports {ADC_DATA_IN_A[12]}]
set_property PACKAGE_PIN V16 [get_ports {ADC_DATA_IN_A[13]}]

set_property IOSTANDARD LVCMOS18 [get_ports {ADC_DATA_IN_B[*]}]
set_property IOB TRUE [get_ports {ADC_DATA_IN_B[*]}]

set_property PACKAGE_PIN R18 [get_ports {ADC_DATA_IN_B[0]}]
set_property PACKAGE_PIN P16 [get_ports {ADC_DATA_IN_B[1]}]
set_property PACKAGE_PIN P18 [get_ports {ADC_DATA_IN_B[2]}]
set_property PACKAGE_PIN N17 [get_ports {ADC_DATA_IN_B[3]}]
set_property PACKAGE_PIN R19 [get_ports {ADC_DATA_IN_B[4]}]
set_property PACKAGE_PIN T20 [get_ports {ADC_DATA_IN_B[5]}]
set_property PACKAGE_PIN T19 [get_ports {ADC_DATA_IN_B[6]}]
set_property PACKAGE_PIN U20 [get_ports {ADC_DATA_IN_B[7]}]
set_property PACKAGE_PIN V20 [get_ports {ADC_DATA_IN_B[8]}]
set_property PACKAGE_PIN W20 [get_ports {ADC_DATA_IN_B[9]}]
set_property PACKAGE_PIN W19 [get_ports {ADC_DATA_IN_B[10]}]
set_property PACKAGE_PIN Y19 [get_ports {ADC_DATA_IN_B[11]}]
set_property PACKAGE_PIN W18 [get_ports {ADC_DATA_IN_B[12]}]
set_property PACKAGE_PIN Y18 [get_ports {ADC_DATA_IN_B[13]}]

# clock input

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports CLK_IN_P]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports CLK_IN_N]
set_property PACKAGE_PIN U18 [get_ports CLK_IN_P]
set_property PACKAGE_PIN U19 [get_ports CLK_IN_N]

# clock output

#set_property IOSTANDARD LVCMOS18 [get_ports adc_enc_p_o]
#set_property IOSTANDARD LVCMOS18 [get_ports adc_enc_n_o]

#set_property SLEW FAST [get_ports adc_enc_p_o]
#set_property SLEW FAST [get_ports adc_enc_n_o]

#set_property DRIVE 8 [get_ports adc_enc_p_o]
#set_property DRIVE 8 [get_ports adc_enc_n_o]

#set_property PACKAGE_PIN N20 [get_ports adc_enc_p_o]
#set_property PACKAGE_PIN P20 [get_ports adc_enc_n_o]

# clock duty cycle stabilizer (CSn)

set_property IOSTANDARD LVCMOS18 [get_ports ADC_CSN]
set_property PACKAGE_PIN V18 [get_ports ADC_CSN]
set_property SLEW FAST [get_ports ADC_CSN]
set_property DRIVE 8 [get_ports ADC_CSN]


set_property PACKAGE_PIN F16 [get_ports {led_o[0]}]
set_property PACKAGE_PIN F17 [get_ports {led_o[1]}]
set_property PACKAGE_PIN G15 [get_ports {led_o[2]}]
set_property PACKAGE_PIN H15 [get_ports {led_o[3]}]
set_property PACKAGE_PIN K14 [get_ports {led_o[4]}]
set_property PACKAGE_PIN G14 [get_ports {led_o[5]}]
set_property PACKAGE_PIN J15 [get_ports {led_o[6]}]
set_property PACKAGE_PIN J14 [get_ports {led_o[7]}]