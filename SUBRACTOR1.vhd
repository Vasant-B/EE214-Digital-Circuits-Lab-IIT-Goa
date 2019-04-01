--A VHDL program for a subractor using a twos_COMPLIMENT1 and four bit adder
--designed by group 8 on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity SUBRACTOR1 is
	port (a1, a2, a3, a4 : in std_logic;
		   b1, b2, b3, b4 : in std_logic;
		   c1, c2, c3, c4 : out std_logic);
end SUBRACTOR1;


architecture STRUCTURE of SUBRACTOR1 is
	
	signal d1, d2, d3, d4, cx1, cx2 : std_logic;
	
begin
	U1 : TWOs_COMPLIMENT1 port map (b1, b2, b3, b4, d1, d2, d3, d4, cx1);
	U2 : FOUR_BIT_ADDER1 port map (a1, a2, a3, a4, d1, d2, d3, d4, c1, c2, c3, c4, cx2);
end STRUCTURE;