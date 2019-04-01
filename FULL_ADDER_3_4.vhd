--A VHDL program for a nibble full adder
--designed by Vasant on 01 feb 2018, based on wikipedia.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity FULL_ADDER_3_4 is
	port (A, B, C: in std_logic_vector (3 downto 0);
		 SUM1 : out std_logic;
		 CARRY1 : out std_logic_vector (3 downto 0) );
end FULL_ADDER_3_4;


architecture STRUCTURE of FULL_ADDER_3_4 is

	signal S1, C1, C2 : std_logic_vector (3 downto 0);

begin
	U1 : HALF_ADDER_2_4 (A, B, S1, C1);
	U2 : HALF_ADDER_2_4 (C, S1, SUM1, C2);
	
	U3 : AND_2 (C1(0), C2(0), CARRY1(0));
	U4 : AND_2 (C1(1), C2(1), CARRY1(1));
	U5 : AND_2 (C1(2), C2(2), CARRY1(2));
	U6 : AND_2 (C1(3), C2(3), CARRY1(3));

end STRUCTURE;