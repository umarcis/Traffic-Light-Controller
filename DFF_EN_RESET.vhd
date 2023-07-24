----------------------------------------------------------------------------
-- Entity:        DFF_EN_RESET
-- Written By:    Muhammad Umar
-- Date Created:  9 Feb 19
-- Description:   VHDL model of a D flip-flop with enable and reset
--
-- Revision History (date, initials, description):
--
-- Dependencies:
--   (none)
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity DFF_EN_RESET is
    port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        EN    : in  STD_LOGIC;
        RESET : in  std_logic;
        Q     : out STD_LOGIC
    );
end entity;
----------------------------------------------------------------------------

architecture structural of DFF_EN_RESET is


    component Mux2to1 is
        port (
            D0  : in  STD_LOGIC;
            D1  : in  STD_LOGIC;
            SEL : in  STD_LOGIC;
            Y   : out STD_LOGIC
        );
    end component;

    component DFF is
        port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC
        );
    end component;
    

    -- internal signals
    signal n1 : STD_LOGIC;
    signal n2 : STD_LOGIC;
    signal n3 : STD_LOGIC;
    signal Q_int : STD_LOGIC;


begin

n1 <= D and (not RESET);
n2 <= RESET or EN;
Q <= Q_int; 

    Mux2to1_inst: Mux2to1 
    port map (
        D0    => Q_int,
        D1    => n1,
        SEL   => n2,
        Y     => n3
    );
    
    DFF_inst: DFF 
    port map (
        D    => n3,
        CLK  => CLK,
        Q    => Q_int
    );



end architecture;
