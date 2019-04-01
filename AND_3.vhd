--A VHDL program for a 3 in AND Gate
--designed by vasant 2 feb 18

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;


entity AND_3 is
	port (I1, I2, I3 : in std_logic;
			O1 : out std_logic);
end AND_3;

architecture FUNCTIONALITY of AND_3 is

	signal S1, S2 : std_logic;

begin 
	S1 <= I1 and I2;
	O1 <= S1 and I3;

end FUNCTIONALITY;