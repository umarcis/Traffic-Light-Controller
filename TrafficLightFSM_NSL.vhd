----------------------------------------------------------------------------
-- Entity:        TrafficLightFSM_NSL
-- Written By:    Muhammad Umar
-- Date Created:  8 Mar 19
-- Description:   VHDL model of a the next state logic for the traffic light 
--                controller FSM
--
-- Revision History (date, initials, description):
--
-- Dependencies:
--   (none)
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLightFSM_NSL is
    port (
        TA            : in  STD_LOGIC;
        TB            : in  STD_LOGIC;
        CURRENT_STATE : in  STD_LOGIC_VECTOR(3 downto 0);
        NEXT_STATE    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity TrafficLightFSM_NSL;

architecture Structural of TrafficLightFSM_NSL is

    -- State encoding
--    constant Reset : STD_LOGIC_VECTOR(3 downto 0) := "0000";
--    constant S0    : STD_LOGIC_VECTOR(3 downto 0) := "0001";
--    constant S1    : STD_LOGIC_VECTOR(3 downto 0) := "0010";
--    constant S2    : STD_LOGIC_VECTOR(3 downto 0) := "0100";
--    constant S3    : STD_LOGIC_VECTOR(3 downto 0) := "1000";

-- Alias for CURRENT_STATE
    alias CS is CURRENT_STATE;
    alias NS is NEXT_STATE;



begin

 -- Initialize CURRENT_STATE to reset state "0000"
--    process
--    begin
--        CS <= '0000';
--        wait;
--    end process;

    process (CURRENT_STATE, TA, TB)
    begin
        NS(0) <= (((not CS(3)) and (not CS(2)) and (not CS(1)) and (not CS(0))) or ( CS(0) and TA) or ((CS(3)))); 
        NS(1) <= (CS(0) and (not TA));
        NS(2) <= (CS(1) or (CS(2) and TB)) ;
        NS(3) <= (CS(2) and (not TB));
        
        
        
--        NS(0) <= (((not CS(3)) and (not CS(2)) and (not CS(1)) and (not CS(0))) or ((not CS(3)) and (not CS(2)) and (not CS(1)) (not CS(0)) and TA) or ((CS(3)))); 
--        NS(1) <= (not CS(3)) and (not CS(2)) and (not CS(1)  (CS(0) and (not TA));
--        NS(2) <= (CS(1) or (CS(2) and TB)) ;
--        NS(3) <= (CS(2) and (not TB));
        
        
        
    end process;
    
   
end architecture Structural;

