--------------------------------------------------------------------------------
-- Entity:        
-- Written By:    Muhammad Umar
-- Date Created:  19 Jul 2023
-- Description:   VHDL for top level
--
-- Revision History (date, initials, description):
--
-- Dependencies:
--
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

--------------------------------------------------------------------------------
entity TrafficFSM is
    port (
		SWITCH  : in  STD_LOGIC_VECTOR(15 downto 0);
        BTNR    : in  STD_LOGIC;
		CLK     : in  STD_LOGIC;
		LED     : out STD_LOGIC_VECTOR(15 downto 0);
		SEGMENT : out STD_LOGIC_VECTOR(0 to 6);
        ANODE   : out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity;
--------------------------------------------------------------------------------

architecture Structural of TrafficFSM is

component TrafficLightFSM is
    port (
        TA    : in  STD_LOGIC;
        TB    : in  STD_LOGIC;
        PULSE : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        LA    : out STD_LOGIC_VECTOR(2 downto 0);
        LB    : out STD_LOGIC_VECTOR(2 downto 0)
    );
end component;

component PulseGenerator_5sec is
    port (
        EN     : in  STD_LOGIC;
        CLK    : in  STD_LOGIC;
        RESET  : in  STD_LOGIC;
        STATUS : out STD_LOGIC_VECTOR(4 downto 1);
        PULSE  : out STD_LOGIC
    );

end component;

signal pulse_5sec : std_logic;

begin


TrafficLightFSM_Inst: TrafficLightFSM
                port map (
        TA => SWITCH(13),
        TB => SWITCH(0),   
        PULSE => pulse_5sec,
        CLK   => CLK,
        RESET => BTNR,
        LA    => LED(15 downto 13),
        LB   => LED(2 downto 0)
    );

PulseGenInst : PulseGenerator_5sec 
                port map (
        EN => '1',
        CLK   => CLK,
        RESET  => BTNR,
        STATUS => LED(9 downto 6),
        PULSE  => pulse_5sec
    );


    SEGMENT <= "1111111";
    ANODE   <= "1111";

end architecture;
