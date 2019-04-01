--A VHDL program for a nibble Subtractor
--designed by Vasant on 01 feb 2018, based on wikipedia.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity NIBBLE_SUBTRACTOR is
	port (A,B : in std_logic_vector (3 downto 0);
		 D : out std_logic_vector (3 downto 0));
end NIBBLE_SUBTRACTOR;


architecture STRUCTURE of NIBBLE_SUBTRACTOR is
	signal S1, S2, S3, S4 : std_logic;
	
begin
	U1 : HALF_SUBTRACTOR_2P port map (A(0), B(0), D(0), S1);
	U2: FULL_SUBTRACTOR_3 port map (A(1), B(1), S1, D(1), S2);
	U3: FULL_SUBTRACTOR_3 port map (A(2), B(2), S2, D(2), S3);
	U4: FULL_SUBTRACTOR_3 port map (A(3), B(3), S3, D(3), S4);
end STRUCTURE;