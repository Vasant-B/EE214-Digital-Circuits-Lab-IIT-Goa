--A VHDL program for a NIBBLE to BYTE converter
--designed by Vasant on 01 feb 2018.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity NIBBLE_TO_BYTE is
	port (A : in std_logic_vector (3 downto 0);
		OUT1 : out std_logic_vector (7 downto 0)
);
end NIBBLE_TO_BYTE;


architecture STRUCTURE of NIBBLE_TO_BYTE is
	signal S1 : std_logic;
begin
U1_0 : AND_2 port map (A(0), A(0), OUT1(0));
U1_1 : AND_2 port map (A(1), A(1), OUT1(1));
U1_2 : AND_2 port map (A(2), A(2), OUT1(2));
U1_3 : AND_2 port map (A(3), A(3), OUT1(3));
S1 <= '0';
U1_4 : AND_2 port map (S1, S1, OUT1(4));
U1_5 : AND_2 port map (S1, S1, OUT1(5));
U1_6 : AND_2 port map (S1, S1, OUT1(6));
U1_7 : AND_2 port map (S1, S1, OUT1(7));
end STRUCTURE;