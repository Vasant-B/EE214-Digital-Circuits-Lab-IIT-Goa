--A VHDL program for 2:8 MUX using basic gates
--designed by Vasant on 01 Feb 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;


entity MUX_2_8 is
	port (IN0, IN1 : in std_logic_vector (7 downto 0);
			SEL : in std_logic;
			OUT1: out std_logic_vector (7 downto 0));
end MUX_2_8;

architecture STRUCTURE of MUX_2_8 is
	
	signal S1,S2,S3 : std_logic;
	
begin
	U1 : MUX_2_1_P port map (IN0(0), IN1(0), SEL, OUT1(0));
	U2 : MUX_2_1_P port map (IN0(1), IN1(1), SEL, OUT1(1));
	U3 : MUX_2_1_P port map (IN0(2), IN1(2), SEL, OUT1(2));
	U4 : MUX_2_1_P port map (IN0(3), IN1(3), SEL, OUT1(3));
	U5 : MUX_2_1_P port map (IN0(4), IN1(4), SEL, OUT1(4));
	U6 : MUX_2_1_P port map (IN0(5), IN1(5), SEL, OUT1(5));
	U7 : MUX_2_1_P port map (IN0(6), IN1(6), SEL, OUT1(6));
	U8 : MUX_2_1_P port map (IN0(7), IN1(7), SEL, OUT1(7));
end STRUCTURE;