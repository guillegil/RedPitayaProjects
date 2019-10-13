library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Library UNISIM;
use UNISIM.vcomponents.all;

Library UNIMACRO;
use UNIMACRO.vcomponents.all;

entity adc_controller_v1_0 is
	generic (
		-- Users to add parameters here
        ENABLE_AXI_INTERFACE    :   boolean     := FALSE;
        ENABLE_CLK_DIV2         :   boolean     := FALSE;
        USE_CHANNEL             :   string      := "Both";
        RESET_TYPE              :   std_logic   := '1';
        ADC_DATA_WIDTH          :   natural     := 14;
        
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_ADC_AXI_DATA
		C_S_ADC_AXI_DATA_DATA_WIDTH	: integer	:= 32;
		C_S_ADC_AXI_DATA_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here

        CLK_IN_P        :   in std_logic;           
        CLK_IN_N        :   in std_logic;           
        CE              :   in std_logic;
        RST             :   in std_logic;        
        ADC_DATA_IN_A   :   in std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
        ADC_DATA_IN_B   :   in std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
        ADC_DATA_OUT_A  :   out std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
        ADC_DATA_OUT_B  :   out std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
        ADC_CSN         :   out std_logic;
        
        ADC_CLK         :   out std_logic;
        ADC_CLK_DIV2    :   out std_logic;

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S_ADC_AXI_DATA
		s_adc_axi_data_aclk	: in std_logic;
		s_adc_axi_data_aresetn	: in std_logic;
		s_adc_axi_data_awaddr	: in std_logic_vector(C_S_ADC_AXI_DATA_ADDR_WIDTH-1 downto 0);
		s_adc_axi_data_awprot	: in std_logic_vector(2 downto 0);
		s_adc_axi_data_awvalid	: in std_logic;
		s_adc_axi_data_awready	: out std_logic;
		s_adc_axi_data_wdata	: in std_logic_vector(C_S_ADC_AXI_DATA_DATA_WIDTH-1 downto 0);
		s_adc_axi_data_wstrb	: in std_logic_vector((C_S_ADC_AXI_DATA_DATA_WIDTH/8)-1 downto 0);
		s_adc_axi_data_wvalid	: in std_logic;
		s_adc_axi_data_wready	: out std_logic;
		s_adc_axi_data_bresp	: out std_logic_vector(1 downto 0);
		s_adc_axi_data_bvalid	: out std_logic;
		s_adc_axi_data_bready	: in std_logic;
		s_adc_axi_data_araddr	: in std_logic_vector(C_S_ADC_AXI_DATA_ADDR_WIDTH-1 downto 0);
		s_adc_axi_data_arprot	: in std_logic_vector(2 downto 0);
		s_adc_axi_data_arvalid	: in std_logic;
		s_adc_axi_data_arready	: out std_logic;
		s_adc_axi_data_rdata	: out std_logic_vector(C_S_ADC_AXI_DATA_DATA_WIDTH-1 downto 0);
		s_adc_axi_data_rresp	: out std_logic_vector(1 downto 0);
		s_adc_axi_data_rvalid	: out std_logic;
		s_adc_axi_data_rready	: in std_logic
	);
end adc_controller_v1_0;

architecture arch_imp of adc_controller_v1_0 is

	-- component declaration
	
        component adc_controller_v1_0_S_ADC_AXI_DATA is
            generic (
            C_S_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_AXI_ADDR_WIDTH	: integer	:= 4
            );
            port (
            S_AXI_ACLK	: in std_logic; 
            S_AXI_ARESETN	: in std_logic;
            S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
            S_AXI_AWVALID	: in std_logic;
            S_AXI_AWREADY	: out std_logic;
            S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID	: in std_logic;
            S_AXI_WREADY	: out std_logic;
            S_AXI_BRESP	: out std_logic_vector(1 downto 0);
            S_AXI_BVALID	: out std_logic;
            S_AXI_BREADY	: in std_logic;
            S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
            S_AXI_ARVALID	: in std_logic;
            S_AXI_ARREADY	: out std_logic;
            S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP	: out std_logic_vector(1 downto 0);
            S_AXI_RVALID	: out std_logic;
            S_AXI_RREADY	: in std_logic;
            
            ADC_DATA_A      : in std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
            ADC_DATA_B      : in std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0)
            );
        end component adc_controller_v1_0_S_ADC_AXI_DATA;
    
    component adc_controller is
        generic(
            ENABLE_AXI_INTERFACE    :   boolean     := FALSE;
            ENABLE_CLK_DIV2         :   boolean     := FALSE;
            USE_CHANNEL             :   string      := "Both";
            RESET_TYPE              :   std_logic   := '1';
            ADC_DATA_WIDTH          :   natural     := 14;
                 
            M_AXI_DATA_WIDTH        :   natural     := 32
        );
        port(
            CLK_IN_P        :   in std_logic;           
            CLK_IN_N        :   in std_logic;           
            CE              :   in std_logic;
            RST             :   in std_logic;        
            ADC_DATA_IN_A   :   in std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
            ADC_DATA_IN_B   :   in std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
            ADC_DATA_OUT_A  :   out std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
            ADC_DATA_OUT_B  :   out std_logic_vector(ADC_DATA_WIDTH - 1 downto 0);
            ADC_CSN         :   out std_logic;
            
            ADC_CLK         :   out std_logic;
            ADC_CLK_DIV2    :   out std_logic;
            
            S_AXI_CLK       :   in std_logic;
            S_AXI_DATA_A    :   out std_logic_vector(M_AXI_DATA_WIDTH - 1 downto 0);
            S_AXI_DATA_B    :   out std_logic_vector(M_AXI_DATA_WIDTH - 1 downto 0)
        );
    end component;

    signal aux_adc_data_a, aux_adc_data_b : std_logic_vector(ADC_DATA_WIDTH - 1 downto 0) := (others => '0');
    signal adc_data_a, adc_data_b : std_logic_vector(C_S_ADC_AXI_DATA_DATA_WIDTH - 1 downto 0) := (others => '0');

begin

    USE_AXI : if ENABLE_AXI_INTERFACE = TRUE generate
        adc_controller_v1_0_S_ADC_AXI_DATA_inst : adc_controller_v1_0_S_ADC_AXI_DATA
            generic map (
                C_S_AXI_DATA_WIDTH	=> C_S_ADC_AXI_DATA_DATA_WIDTH,
                C_S_AXI_ADDR_WIDTH	=> C_S_ADC_AXI_DATA_ADDR_WIDTH
            )
            port map (
                S_AXI_ACLK	=> s_adc_axi_data_aclk,
                S_AXI_ARESETN	=> s_adc_axi_data_aresetn,
                S_AXI_AWADDR	=> s_adc_axi_data_awaddr,
                S_AXI_AWPROT	=> s_adc_axi_data_awprot,
                S_AXI_AWVALID	=> s_adc_axi_data_awvalid,
                S_AXI_AWREADY	=> s_adc_axi_data_awready,
                S_AXI_WDATA	=> s_adc_axi_data_wdata,
                S_AXI_WSTRB	=> s_adc_axi_data_wstrb,
                S_AXI_WVALID	=> s_adc_axi_data_wvalid,
                S_AXI_WREADY	=> s_adc_axi_data_wready,
                S_AXI_BRESP	=> s_adc_axi_data_bresp,
                S_AXI_BVALID	=> s_adc_axi_data_bvalid,
                S_AXI_BREADY	=> s_adc_axi_data_bready,
                S_AXI_ARADDR	=> s_adc_axi_data_araddr,
                S_AXI_ARPROT	=> s_adc_axi_data_arprot,
                S_AXI_ARVALID	=> s_adc_axi_data_arvalid,
                S_AXI_ARREADY	=> s_adc_axi_data_arready,
                S_AXI_RDATA	=> s_adc_axi_data_rdata,
                S_AXI_RRESP	=> s_adc_axi_data_rresp,
                S_AXI_RVALID	=> s_adc_axi_data_rvalid,
                S_AXI_RREADY	=> s_adc_axi_data_rready,
                
                ADC_DATA_A    =>  adc_data_a,
                ADC_DATA_B    =>  adc_data_b
            );
	   end generate;
	
	ADC_MODULE: adc_controller
	   generic map(
	       ENABLE_AXI_INTERFACE    =>  ENABLE_AXI_INTERFACE,
	       ENABLE_CLK_DIV2         =>  ENABLE_CLK_DIV2,
	       USE_CHANNEL             =>  USE_CHANNEL,
	       RESET_TYPE              =>  RESET_TYPE,
	       ADC_DATA_WIDTH          =>  ADC_DATA_WIDTH,
	       M_AXI_DATA_WIDTH        =>  C_S_ADC_AXI_DATA_DATA_WIDTH      
	   )
	   port map(
	       CLK_IN_P        =>  CLK_IN_P,
	       CLK_IN_N        =>  CLK_IN_N,
	       CE              =>  CE,
	       RST             =>  RST,
	       ADC_DATA_IN_A   =>  ADC_DATA_IN_A,
	       ADC_DATA_IN_B   =>  ADC_DATA_IN_B,
	       ADC_DATA_OUT_A  =>  ADC_DATA_OUT_A,
	       ADC_DATA_OUT_B  =>  ADC_DATA_OUT_B,
	       ADC_CSN         =>  ADC_CSN, 
	       ADC_CLK         =>  ADC_CLK,
	       ADC_CLK_DIV2    =>  ADC_CLK_DIV2,
	       
	       S_AXI_CLK       =>  s_adc_axi_data_aclk,
	       S_AXI_DATA_A    =>  aux_adc_data_a,
	       S_AXI_DATA_B    =>  aux_adc_data_b  
	   );
	   
	 adc_data_a <= std_logic_vector(resize(signed(aux_adc_data_a), C_S_ADC_AXI_DATA_DATA_WIDTH));
     adc_data_b <= std_logic_vector(resize(signed(aux_adc_data_b), C_S_ADC_AXI_DATA_DATA_WIDTH));


end arch_imp;
