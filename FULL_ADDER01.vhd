--A VHDL program for a Half adder using XOR
--designed by Vasant on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity FULL_ADDER01 is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 I3 : in std_logic;
		 S1 : out std_logic;
		 C1 : out std_logic);
end FULL_ADDER01;


architecture STRUCTURE of FULL_ADDER01 is
	
	signal SubS1, SubC1, SubC2, S4, S5 : std_logic;
	
begin
	U1 : HALF_ADDER01 port map (I2, I3, SubS1, SubC1);
	U2 : HALF_ADDER01 port map (I2, I3, SubS1, SubC1);
	U2 : AND_2 port map (I1, I2, C1);
end STRUCTURE;
