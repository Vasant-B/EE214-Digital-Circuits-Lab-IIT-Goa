--A VHDL program for a Half Subtractor
--designed by Vasant on 01 feb 2018, based on wikipedia.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity HALF_SUBTRACTOR_2P is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 D1 : out std_logic;
		 Bout : out std_logic);
end HALF_SUBTRACTOR_2P;


architecture STRUCTURE of HALF_SUBTRACTOR_2P is
	signal S1 : std_logic;
	
begin
	U1 : XOR_P port map (I1, I2, D1);
	U2 : NOT_1 port map (I1, S1);
	U3 : AND_2 port map (I1, I2, Bout);
end STRUCTURE;