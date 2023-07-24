----------------------------------------------------------------------------
-- Entity:        Reg_LOAD_CLR_4bit
-- Written By:    Muhammad umar
-- Date Created:  9 Feb 19
-- Description:   VHDL model of a 4-bit register with load and clear
--
-- Revision History (date, initials, description):
--
-- Dependencies:
--   (none)
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity Reg_LOAD_CLR_4bit is
    port (
        D    : in  STD_LOGIC_VECTOR(3 downto 0);
        CLK  : in  STD_LOGIC;
        LOAD : in  STD_LOGIC;
        CLR  : in  STD_LOGIC;
        Q    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;
----------------------------------------------------------------------------

architecture Structural of Reg_LOAD_CLR_4bit is

component DFF_EN_RESET is
    port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        EN    : in  STD_LOGIC;
        RESET : in  std_logic;
        Q     : out STD_LOGIC
    );
end component;

signal Q0, Q1, Q2, Q3: std_logic;

begin
    DFF_EN_RESET_inst0: DFF_EN_RESET port map (
        D => D(0),
        CLK => CLK,
        EN => LOAD,
        RESET => CLR,
        Q => Q0
    );
    DFF_EN_RESET_inst1: DFF_EN_RESET port map (
        D => D(1),
        CLK => CLK,
        EN => LOAD,
        RESET => CLR,
        Q => Q1
    );
    DFF_EN_RESET_inst2: DFF_EN_RESET port map (
        D => D(2),
        CLK => CLK,
        EN => LOAD,
        RESET => CLR,
        Q => Q2
    );
    DFF_EN_RESET_inst3: DFF_EN_RESET port map (
        D => D(3),
        CLK => CLK,
        EN => LOAD,
        RESET => CLR,
        Q => Q3
    );

    Q <= Q3 & Q2 & Q1 & Q0;
end architecture Structural;