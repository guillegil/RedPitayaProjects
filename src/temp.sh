vivado_path="/opt/Xilinx/Vivado/2018.2/bin/"

if [ -d "$1" ]; then
  PROJECT_PATH=$1
  echo "Running project in $1..."
else
   echo "Dir $1 do not exist, exiting..."
   exit 1
fi


${vivado_path}/vivado -mode gui -source adc_interface_gen.tcl -tclargs "ADC_SCRIPT_TEST" PROJECT_PATH

rm *.log *.jou *.zip *.str
rm -R .Xil
