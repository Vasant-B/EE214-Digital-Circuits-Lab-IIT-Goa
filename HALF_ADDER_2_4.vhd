--A VHDL program for a nibble Half adder
--designed by Vasant on 01 feb 2018, based on wikipedia.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity HALF_ADDER_2_4 is
	port (A, B: in std_logic_vector (3 downto 0);
		 SUM1 : out std_logic;
		 C : out std_logic_vector (3 downto 0) );
end HALF_ADDER_2_4;


architecture STRUCTURE of HALF_ADDER_2_4 is

begin
	U1 : XOR_P port map (A(0), B(0), SUM1(0));
	U2 : XOR_P port map (A(1), B(1), SUM1(1));
	U3 : XOR_P port map (A(2), B(2), SUM1(2));
	U4 : XOR_P port map (A(3), B(3), SUM1(3));

	U5 : AND_2 port map (A(0), B(0), C(0));
	U6 : AND_2 port map (A(1), B(1), C(1));
	U7 : AND_2 port map (A(2), B(2), C(2));
	U8 : AND_2 port map (A(3), B(3), C(3));


end STRUCTURE;