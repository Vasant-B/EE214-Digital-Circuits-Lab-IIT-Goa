--A VHDL program for a Half adder
--designed by Vasant on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity HALF_ADDER1 is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 S1 : out std_logic;
		 C1 : out std_logic);
end HALF_ADDER1;


architecture STRUCTURE of HALF_ADDER1 is
	signal S2, S3, S4, S5 : std_logic;
	
begin
	U1 : NOT_1 port map (I2, S2);
	U2_1 : NOT_1 port map (I1, S3);
	U3 : AND_2 port map (I1, S2, S4);
	U4 : AND_2 port map (I2, S3, S5);
	U5 : OR_2 port map (S4, S5, S1);
	U6 : AND_2 port map (I1, I2, C1);
end STRUCTURE;