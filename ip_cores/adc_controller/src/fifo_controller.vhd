----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2019 11:23:57 AM
-- Design Name: 
-- Module Name: fifo_controller - structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.

Library UNISIM;
use UNISIM.vcomponents.all;

Library UNIMACRO;
use UNIMACRO.vcomponents.all;

entity fifo_controller is
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
end fifo_controller;

architecture structural of fifo_controller is

    signal RDCOUNT, WRCOUNT : std_logic_vector(8 downto 0) := (others => '0');
    signal RDERR, WRERR : std_logic := '0';

    signal almost_full, almost_empty : std_logic := '0';
    
begin

     -----------------------------------------------------------------
   -- DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width --
   -- ===========|===========|============|=======================--
   --   37-72    |  "36Kb"   |     512    |         9-bit         --
   --   19-36    |  "36Kb"   |    1024    |        10-bit         --
   --   19-36    |  "18Kb"   |     512    |         9-bit         --
   --   10-18    |  "36Kb"   |    2048    |        11-bit         --
   --   10-18    |  "18Kb"   |    1024    |        10-bit         --
   --    5-9     |  "36Kb"   |    4096    |        12-bit         --
   --    5-9     |  "18Kb"   |    2048    |        11-bit         --
   --    1-4     |  "36Kb"   |    8192    |        13-bit         --
   --    1-4     |  "18Kb"   |    4096    |        12-bit         --
   -----------------------------------------------------------------

   EMBEDDED_FIFO : FIFO_DUALCLOCK_MACRO
   generic map (
      DEVICE => "7SERIES",               -- Target Device: "VIRTEX5", "VIRTEX6", "7SERIES" 
      ALMOST_FULL_OFFSET => X"0080",     -- Sets almost full threshold
      ALMOST_EMPTY_OFFSET => X"0080",    -- Sets the almost empty threshold
      DATA_WIDTH => DATA_WIDTH,          -- Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      FIFO_SIZE => "18Kb",                -- Target BRAM, "18Kb" or "36Kb" 
      FIRST_WORD_FALL_THROUGH => FALSE) -- Sets the FIFO FWFT to TRUE or FALSE
   port map (
      ALMOSTEMPTY => almost_empty,   -- 1-bit output almost empty
      ALMOSTFULL => almost_full,     -- 1-bit output almost full
      DO => DATA_OUT,               -- Output data, width defined by DATA_WIDTH parameter
      EMPTY => FIFO_EMPTY,          -- 1-bit output empty
      FULL => FIFO_FULL,            -- 1-bit output full
      RDCOUNT => RDCOUNT,           -- Output read count, width determined by FIFO depth
      RDERR => RDERR,               -- 1-bit output read error
      WRCOUNT => WRCOUNT,           -- Output write count, width determined by FIFO depth
      WRERR => WRERR,               -- 1-bit output write error
      DI => DATA_IN,                -- Input data, width defined by DATA_WIDTH parameter
      RDCLK => CLK_RD,              -- 1-bit input read clock
      RDEN => RE,                   -- 1-bit input read enable
      RST => RST,                   -- 1-bit input reset
      WRCLK => CLK_WR,              -- 1-bit input write clock
      WREN => WE                    -- 1-bit input write enable
   ); 

end structural;
