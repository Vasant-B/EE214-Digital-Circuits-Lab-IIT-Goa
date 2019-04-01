--A VHDL program for a FULL_SUBTRACTOR
--designed by Vasant on 15 Jan 2018, based on wikipedia

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity FULL_SUBTRACTOR_3 is
	port (X1 : in std_logic;
		 Y1 : in std_logic;
		 Bin : in std_logic;
		 D : out std_logic;
		 Bout : out std_logic);
end FULL_SUBTRACTOR_3;


architecture STRUCTURE of FULL_SUBTRACTOR_3 is
	
	signal S1, S2, S3, S4, S5 : std_logic;
	
begin
	U1 : XOR_P port map (X1, Y1, S1);
	U2 : XOR_P port map (S1, Bin, D);
	U3 : NOT_1 port map (S1, S2);
	U4 : AND_2 port map (Bin, S2, S3);
	U5 : OR_2 port map (S3, S5, Bout);
	U6 : AND_2 port map (S4, Y1, S5);
	U7 : NOT_1 port map (X1, S4);
end STRUCTURE;