--A VHDL program for a 4 in OR Gate
--designed by vasant 2 feb 18

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;


entity OR_4 is
	port (I1, I2, I3, I4 : in std_logic;
			O1 : out std_logic);
end OR_4;

architecture FUNCTIONALITY of OR_4 is

	signal S1, S2 : std_logic;

begin 
	S1 <= I1 or I2;
	S2 <= I4 or I3;
	O1 <= S1 or S2;
end FUNCTIONALITY;
