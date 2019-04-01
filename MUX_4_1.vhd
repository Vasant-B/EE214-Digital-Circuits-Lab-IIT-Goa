--A VHDL program for 4:1 MUX 
--designed by vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity MUX_4_1 is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			IN2: in std_logic;
			IN3: in std_logic;
			SEL : in std_logic_vector(1 downto 0);
			OUT1: out std_logic);
end MUX_4_1;

architecture STRUCTURE of MUX_4_1 is

	signal S1,S2,S3 : std_logic;
	
begin
	U1 : MUX_2_1_P port map (IN0, IN1, SEL(0),S1);
	U2 : MUX_2_1_P port map (IN2, IN3, SEL(0),S2);
	U3 : MUX_2_1_P port map (S1 , S2, SEL(1),OUT1);
	
end STRUCTURE;