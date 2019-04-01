--A VHDL program for a four bit adder using XOR
--designed by group 8 on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity FOUR_BIT_ADDER1 is
	port (a1, a2, a3, a4, b1, b2, b3, b4 : in std_logic;
		 S0, S1, S2, S3, C3 : out std_logic );
end FOUR_BIT_ADDER1;


architecture STRUCTURE of FOUR_BIT_ADDER1 is
	
	signal C0, C1, C2 : std_logic;
	
begin
	U1 : HALF_ADDER1 port map (a1, b1, S0, C0);
	U2 : FULL_ADDER1 port map (C0, a2, b2, S1, C1);
	U3 : FULL_ADDER1 port map (C1, a3, b3, S2, C2);
	U4 : FULL_ADDER1 port map (C2, a4, b4, S3, C3);
end STRUCTURE;