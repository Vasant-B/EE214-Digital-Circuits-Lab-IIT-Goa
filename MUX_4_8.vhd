--A VHDL program for 4:8 MUX 
--designed by vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity MUX_4_8 is
	port (IN0,IN1,IN2,IN3 : in std_logic_vector (7 downto 0);
		SEL1, SEL0 : in std_logic;
		OUT1: out std_logic_vector (7 downto 0) );
end MUX_4_8;

architecture STRUCTURE of MUX_4_8 is

	signal S1,S2,S3 : std_logic_vector (7 downto 0) ;
	
begin
	U1 : MUX_2_8 port map (IN0, IN1, SEL0,S1);
	U2 : MUX_2_8 port map (IN2, IN3, SEL0,S2);
	U3 : MUX_2_8 port map (S1 , S2, SEL1,OUT1);
	
end STRUCTURE;