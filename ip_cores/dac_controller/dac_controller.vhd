----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2019 11:45:17 PM
-- Design Name: 
-- Module Name: dac_controller - structural
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity dac_controller is
    generic(
        DAC_DATA_WIDTH  :   natural := 14;
        ENABLE_RST_PORT :   boolean := FALSE;
        ENABLE_CE_PORT  :   boolean := FALSE;
        USE_CHANNEL     :   string  := "ONLY CHANNEL A"
    );
    port(
        CLK_IN          :   in std_logic;
        CE              :   in std_logic;
        RST             :   in std_logic;
        DAC_DATA_IN_A   :   in std_logic_vector(DAC_DATA_WIDTH - 1 downto 0);
        DAC_DATA_IN_B   :   in std_logic_vector(DAC_DATA_WIDTH - 1 downto 0);
        IQ_RST          :   out std_logic;
        IQ_CLK          :   out std_logic;
        IQ_WRT          :   out std_logic;
        IQ_SEL          :   out std_logic;      
        DAC_DATA_OUT    :   out std_logic_vector(DAC_DATA_WIDTH - 1 downto 0)
    );
end dac_controller;

architecture structural of dac_controller is

    constant zero_output : std_logic_vector(DAC_DATA_WIDTH - 1 downto 0) := std_logic_vector(to_signed(2**(DAC_DATA_WIDTH - 1), DAC_DATA_WIDTH));

    signal dina_reg1_in, dina_reg1_out : std_logic_vector(DAC_DATA_WIDTH - 1 downto 0) := (others => '0');
    signal dinb_reg1_in, dinb_reg1_out : std_logic_vector(DAC_DATA_WIDTH - 1 downto 0) := (others => '0'); 

    signal dout_sig : std_logic_vector(DAC_DATA_WIDTH - 1 downto 0) := (others => '0'); 
    signal rst_sig  : std_logic := '0';
    signal ce_sig   : std_logic := '0';
    
    signal dac_iq_clk   :   std_logic := '0'; 
    signal dac_iq_rst   :   std_logic := '0';
    signal dac_iq_wrt   :   std_logic := '0';
    signal dac_iq_sel   :   std_logic := '0';   

begin


    SEL_CH_A: if USE_CHANNEL = "ONLY CHANNEL A" generate
        dina_reg1_in <= DAC_DATA_IN_A;
        dinb_reg1_in <= zero_output;
    end generate;
    
    SEL_CH_B: if USE_CHANNEL = "ONLY CHANNEL B" generate
        dinb_reg1_in <= DAC_DATA_IN_B;
        dina_reg1_in <= zero_output;
    end generate;
    
    SEL_CH_BOTH: if USE_CHANNEL = "BOTH" generate
        dina_reg1_in <= DAC_DATA_IN_A;
        dinb_reg1_in <= DAC_DATA_IN_B;
    end generate;
    
    rst_sig <= RST when ENABLE_RST_PORT = TRUE else '0';
    ce_sig  <= CE  when ENABLE_CE_PORT = TRUE else '1';

    INPUT_REG:
    process(CLK_IN, CE, rst_sig) is
    begin
        if rst_sig = '1' then
            dina_reg1_out <= (others => '0');
            dinb_reg1_out <= (others => '0');
        else if rising_edge(CLK_IN) and ce_sig = '1' then
            dina_reg1_out <= dina_reg1_in;
            dinb_reg1_out <= dinb_reg1_in;
        end if;
        end if;
    end process;
    
    
    DDR_OUTPUT: for idx in 0 to DAC_DATA_WIDTH - 1 generate
        DDR_OUTPUT_REG : ODDR
        generic map(
           DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
           INIT => '0',   -- Initial value for Q port ('1' or '0')
           SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
        port map (
           Q => dout_sig(idx),        -- 1-bit DDR output
           C => CLK_IN,               -- 1-bit clock input
           CE => CE,                  -- 1-bit clock enable input
           D1 => dina_reg1_out(idx),  -- 1-bit data input (positive edge)
           D2 => dinb_reg1_out(idx),  -- 1-bit data input (negative edge)
           R => rst_sig,              -- 1-bit reset input
           S => '0'                   -- 1-bit set input
        );
    end generate;
    

    DDR_OUTPUT_CLK_REG : ODDR generic map(DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "SYNC")
    port map (Q => dac_iq_clk, C => CLK_IN, CE => ce_sig, D1 => '1', D2 => '0', R => rst_sig, S => '0');
    
    DDR_OUTPUT_WRT_REG : ODDR generic map(DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "SYNC")
    port map (Q => dac_iq_wrt, C => CLK_IN, CE => ce_sig, D1 => '1', D2 => '0', R => rst_sig, S => '0');

    DDR_OUTPUT_RST_REG : ODDR generic map(DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "SYNC")
    port map (Q => dac_iq_rst, C => CLK_IN, CE => ce_sig, D1 => rst_sig, D2 => rst_sig, R => '0', S => '0');
    
    DDR_OUTPUT_SEL_REG : ODDR generic map(DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "SYNC")
    port map (Q => dac_iq_sel, C => CLK_IN, CE => ce_sig, D1 => '1', D2 => '0', R => rst_sig, S => '0');

    
    IQ_RST <= dac_iq_rst;
    IQ_CLK <= dac_iq_clk;
    IQ_WRT <= dac_iq_wrt;
    IQ_SEL <= dac_iq_sel;
    DAC_DATA_OUT <= dout_sig;

end structural;
