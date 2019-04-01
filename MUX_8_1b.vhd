--A VHDL program for 8:1 MUX 
--designed by vasant on 01 Feb 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity MUX_8_1b is
	port (IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7: in std_logic;
		F0, F1, F2 : in std_logic;
		OUT1: out std_logic);
end MUX_8_1b;

architecture STRUCTURE of MUX_8_1b is

	signal S1, S2 : std_logic;
	
begin
	U1 : MUX_4_1b port map (IN0, IN1, IN2, IN3, F1, F0, S1);
	U2 : MUX_4_1b port map (IN4, IN5, IN6, IN7, F1, F0, S2);
	U3 : MUX_2_1_P port map (S1, S2, F2, OUT1);
end STRUCTURE;