--A VHDL program for 4:1 MUX 
--designed by vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity MUX_4_1b is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			IN2: in std_logic;
			IN3: in std_logic;
			SEL1, SEL0 : in std_logic;
			OUT1: out std_logic);
end MUX_4_1b;

architecture STRUCTURE of MUX_4_1b is

	signal S1,S2,S3 : std_logic;
	
begin
	U1 : MUX_2_1_P port map (IN0, IN1, SEL0,S1);
	U2 : MUX_2_1_P port map (IN2, IN3, SEL0,S2);
	U3 : MUX_2_1_P port map (S1 , S2, SEL1,OUT1);
	
end STRUCTURE;