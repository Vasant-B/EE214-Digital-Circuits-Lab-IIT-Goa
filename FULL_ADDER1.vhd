--A VHDL program for a FULL_ADDER
--designed by Vasant on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity FULL_ADDER1 is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 I3 : in std_logic;
		 S1 : out std_logic;
		 C1 : out std_logic);
end FULL_ADDER1;


architecture STRUCTURE of FULL_ADDER1 is
	
	signal SubS1, SubC1, SubC2, S4, S5 : std_logic;
	
begin
	U1 : HALF_ADDER1 port map (I2, I3, SubS1, SubC1);
	U2 : HALF_ADDER1 port map (I1, SubS1, S1, SubC2);
	U3 : OR_2 port map (SubC2, SubC1, C1);
end STRUCTURE;