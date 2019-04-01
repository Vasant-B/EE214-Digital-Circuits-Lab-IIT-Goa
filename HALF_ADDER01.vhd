--A VHDL program for a Half adder using XOR
--designed by Vasant on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity HALF_ADDER01 is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 S1 : out std_logic;
		 C1 : out std_logic);
end HALF_ADDER01;


architecture STRUCTURE of HALF_ADDER01 is
	
	
begin
	U1 : XOR_P port map (I1, I2, S1);
	U2 : AND_2 port map (I1, I2, C1);
end STRUCTURE;
