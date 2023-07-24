----------------------------------------------------------------------------
-- Entity:        TrafficLightFSM_OL
-- Written By:    Muhammad Umar
-- Date Created:  8 Mar 19
-- Description:   VHDL model of a the output logic for the traffic light 
--                controller FSM
--
-- Revision History (date, initials, description):
--
-- Dependencies:
--   (none)
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLightFSM_OL is
    port (
        CURRENT_STATE : in  STD_LOGIC_VECTOR(3 downto 0);
        LA            : out STD_LOGIC_VECTOR(2 downto 0);
        LB            : out STD_LOGIC_VECTOR(2 downto 0)
    );
end entity TrafficLightFSM_OL;

architecture Behavioral of TrafficLightFSM_OL is
--    -- State encoding
--    constant Reset : STD_LOGIC_VECTOR(3 downto 0) := "0000";
--    constant S0    : STD_LOGIC_VECTOR(3 downto 0) := "0001";
--    constant S1    : STD_LOGIC_VECTOR(3 downto 0) := "0010";
--    constant S2    : STD_LOGIC_VECTOR(3 downto 0) := "0100";
--    constant S3    : STD_LOGIC_VECTOR(3 downto 0) := "1000";

    -- Alias for CURRENT_STATE
    alias CS is CURRENT_STATE;
begin


 
process(CS)
begin
  
    LA(2) <= ((not CS(2) and (not CS(1)) and (not CS(0))) or (not CS(3) and (not CS(1)) and (not CS(0))));
    LA(1) <= ((not CS(3)) and (not CS(2)) and CS(1) and (not CS(0)));
    LA(0) <= ((not CS(3)) and (not CS(2)) and (not CS(1)) and  CS(0));
    
    LB(2) <= ((not CS(3)) and (not CS(2)) and  (not CS(0))) or ((not CS(3)) and (not CS(2)) and (not CS(1)));
    LB(1) <= (CS(3) and (not CS(2)) and (not CS(1)) and (not CS(0)) );
    LB(0) <= ((not CS(3)) and  CS(2) and (not CS(1)) and (not CS(0)) );

end process;
end architecture Behavioral;

