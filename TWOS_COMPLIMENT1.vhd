--A VHDL program for twos compliment
--designed by group 8 on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity TWOS_COMPLIMENT1 is
	port (a1, a2, a3, a4 : in std_logic;
		 b1, b2, b3, b4, c : out std_logic );
end TWOS_COMPLIMENT1;


architecture STRUCTURE of TWOS_COMPLIMENT1 is
	
	signal C1, C2, C3, C4 : std_logic;
	signal d1 : std_logic := '1';
	signal d2 , d3 , d4 : std_logic := '0';
	
begin
	U1 : NOT_1 port map (a1, c1);
	U2 : NOT_1 port map (a2, c2);
	U3 : NOT_1 port map (a3, c3);
	U4 : NOT_1 port map (a4, c4);
	U5 : FOUR_BIT_ADDER1 port map (c1, c2, c3, c4, d1, d2, d3, d4, b1, b2, b3, b4, c);
end STRUCTURE;