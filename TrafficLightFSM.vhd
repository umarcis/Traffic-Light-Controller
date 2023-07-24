----------------------------------------------------------------------------
-- Entity:        TrafficLightFSM
-- Written By:    Muhammad Umar
-- Date Created:  19 Jul 2023
-- Description:   VHDL model of a traffic light controller FSM
--
-- Revision History (date, initials, description):
--
-- Dependencies:
--   (none)
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity TrafficLightFSM is
    port (
        TA    : in  STD_LOGIC;
        TB    : in  STD_LOGIC;
        PULSE : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        LA    : out STD_LOGIC_VECTOR(2 downto 0);
        LB    : out STD_LOGIC_VECTOR(2 downto 0)
    );
end entity;
----------------------------------------------------------------------------

architecture Structural of TrafficLightFSM is


component TrafficLightFSM_NSL is
    port (
        TA            : in  STD_LOGIC;
        TB            : in  STD_LOGIC;
        CURRENT_STATE : in  STD_LOGIC_VECTOR(3 downto 0);
        NEXT_STATE    : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

component TrafficLightFSM_OL is
    port (
        CURRENT_STATE : in  STD_LOGIC_VECTOR(3 downto 0);
        LA            : out STD_LOGIC_VECTOR(2 downto 0);
        LB            : out STD_LOGIC_VECTOR(2 downto 0)
    );
    end component;
    
component Reg_LOAD_CLR_4bit is
    port (
        D    : in  STD_LOGIC_VECTOR(3 downto 0);
        CLK  : in  STD_LOGIC;
        LOAD : in  STD_LOGIC;
        CLR  : in  STD_LOGIC;
        Q    : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

signal currentState : STD_LOGIC_VECTOR(3 downto 0);
signal nextState : STD_LOGIC_VECTOR(3 downto 0);

begin
 TrafficLightFSM_NSL_INST: TrafficLightFSM_NSL
        port map (
        TA => TA ,
        TB => TB,         
        CURRENT_STATE => currentState,
        NEXT_STATE   => nextState
    );

 TrafficLightFSM_OL_INST: TrafficLightFSM_OL
        port map (
        CURRENT_STATE => currentState,
        LA          => LA,
        LB          => LB
    );
    
 Reg_LOAD_CLR_4bit_Inst: Reg_LOAD_CLR_4bit
        port map (
        D   => nextState ,  
        CLK => CLK ,
        LOAD  => PULSE ,
        CLR => RESET ,
        Q    => currentState 
    );

end architecture;
