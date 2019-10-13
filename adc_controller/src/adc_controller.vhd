----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2019 10:24:05 AM
-- Design Name: 
-- Module Name: adc_controller - structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Library UNISIM;
use UNISIM.vcomponents.all;


entity adc_controller is
    generic(
        ENABLE_AXI_INTERFACE    :   boolean := FALSE;
        -- NUMBER_OF_OUTPUTS       :   natural := 2;
        ADC_DATA_WIDTH          :   natural := 14;
             
        M_AXI_DATA_WIDTH        :   natural := 32
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
end adc_controller;

architecture structural of adc_controller is


    component fifo_controller is
        generic(
            DATA_WIDTH  :   natural := 32
        );
        port(
            CLK_WR      :   in std_logic;
            CLK_RD      :   in std_logic;
            RST         :   in std_logic;
            WE          :   in std_logic;
            RE          :   in std_logic;
            FIFO_FULL   :   out std_logic;
            FIFO_EMPTY  :   out std_logic;
            DATA_IN     :   in std_logic_vector(DATA_WIDTH - 1 downto 0);
            DATA_OUT    :   out std_logic_vector(DATA_WIDTH - 1 downto 0)
        );
    end component;

    signal gb_clk_sig, gb_clk_sig_div2 : std_logic := '0'; 
    signal gb_ce      : std_logic := '0';
    
    signal data_ina_reg1_in, data_ina_reg1_out : std_logic_vector(ADC_DATA_WIDTH - 1 downto 0) := (others => '0');
    signal data_ina_reg2_in, data_ina_reg2_out : std_logic_vector(ADC_DATA_WIDTH - 1 downto 0) := (others => '0');

    signal data_inb_reg1_in, data_inb_reg1_out : std_logic_vector(ADC_DATA_WIDTH - 1 downto 0) := (others => '0');
    signal data_inb_reg2_in, data_inb_reg2_out : std_logic_vector(ADC_DATA_WIDTH - 1 downto 0) := (others => '0');
    
    signal fifo_full_port_a, fifo_full_port_b   : std_logic := '0';
    signal fifo_empty_port_a, fifo_empty_port_b : std_logic := '0';
    
begin


   USE_AXI: if ENABLE_AXI_INTERFACE = TRUE generate
       CROSS_CLK_DOMAIN_FIFO_PORT_A: fifo_controller
            generic map(
                DATA_WIDTH  => M_AXI_DATA_WIDTH
            )
            port map(
                CLK_WR      => gb_clk_sig,
                CLK_RD      => S_AXI_CLK,
                RST         => RST,
                WE          => '1',
                RE          => '1',
                FIFO_FULL   => fifo_full_port_a,
                FIFO_EMPTY  => fifo_empty_port_a,
                DATA_IN     => data_ina_reg2_out,
                DATA_OUT    => S_AXI_DATA_A
            );
            
            
       CROSS_CLK_DOMAIN_FIFO_PORT_B: fifo_controller
         generic map(
             DATA_WIDTH  => M_AXI_DATA_WIDTH
         )
         port map(
             CLK_WR      => gb_clk_sig,
             CLK_RD      => S_AXI_CLK,
             RST         => RST,
             WE          => '1',
             RE          => '1',
             FIFO_FULL   => fifo_full_port_b,
             FIFO_EMPTY  => fifo_empty_port_b,
             DATA_IN     => data_inb_reg2_out,
             DATA_OUT    => S_AXI_DATA_B
         );
    end generate;

   gb_ce <= not(CE);

   IBUFDS_GTE2_inst : IBUFDS_GTE2
   generic map (
      CLKCM_CFG => TRUE,    -- Refer to Transceiver User Guide
      CLKRCV_TRST => TRUE,  -- Refer to Transceiver User Guide
      CLKSWING_CFG => "11"  -- Refer to Transceiver User Guide
   )
   port map (
      O => gb_clk_sig,       -- 1-bit output: Refer to Transceiver User Guide
      ODIV2 => gb_clk_sig_div2,   -- 1-bit output: Refer to Transceiver User Guide
      CEB => gb_ce,          -- 1-bit input: Refer to Transceiver User Guide
      I => CLK_IN_P,         -- 1-bit input: Refer to Transceiver User Guide
      IB => CLK_IN_N         -- 1-bit input: Refer to Transceiver User Guide
   );

    data_ina_reg1_in <= ADC_DATA_IN_A;
    data_inb_reg1_in <= ADC_DATA_IN_B;
    
    data_ina_reg2_in <= data_ina_reg1_out;
    data_inb_reg2_in <= data_inb_reg1_out;
    
    INPUT_REGISTER:
    process(gb_clk_sig, CE, RST) is
    begin
        if RST = '1' then
            data_ina_reg1_out <= (others => '0');
            data_inb_reg1_out <= (others => '0');        
            data_ina_reg2_out <= (others => '0');
            data_inb_reg2_out <= (others => '0');
        else if rising_edge(gb_clk_sig) and CE = '1' then
            data_ina_reg1_out <= data_ina_reg1_in;
            data_inb_reg1_out <= data_inb_reg1_in;
            
            data_ina_reg2_out <= data_ina_reg2_in;
            data_inb_reg2_out <= data_inb_reg2_in;
        end if;
        end if;
    end process;
   
    -- TODO: Need to be manage with generics 
    ADC_DATA_OUT_A <= data_ina_reg2_out;
    ADC_DATA_OUT_B <= data_inb_reg2_out;
   
    M_AXIS_TVALID <= '1';
    ADC_CSN <= '1';

end structural;
