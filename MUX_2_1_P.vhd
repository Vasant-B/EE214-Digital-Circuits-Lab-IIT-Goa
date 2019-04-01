--A VHDL program for 2:1 MUX using basic gates
--designed by Vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;


entity MUX_2_1_P is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			SEL : in std_logic;
			OUT1: out std_logic);
end MUX_2_1_P;

architecture STRUCTURE of MUX_2_1_P is
	
	signal S1,S2,S3 : std_logic;
	
begin
	U1 : NOT_1 port map (SEL, S1);
	U2 : AND_2 port map (S1, IN0, S2);
	U3 : AND_2 port map (SEL, IN1, S3);
	U4 : OR_2 port map (S2, S3, OUT1);
	
end STRUCTURE;