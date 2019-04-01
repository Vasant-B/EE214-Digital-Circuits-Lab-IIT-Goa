--A VHDL program for 16:4 MUX 
--designed by Vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity MUX_16_4 is
	port (IN0 : in std_logic_vector(3 downto 0);
			IN1: in std_logic_vector(3 downto 0);
			IN2: in std_logic_vector(3 downto 0);
			IN3: in std_logic_vector(3 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			OUT1: out std_logic_vector(3 downto 0));
			
			end MUX_16_4;


architecture STRUCTURE of MUX_16_4 is
begin
	U1 : MUX_4_1 port map (IN0(0), IN1(0), IN2(0), IN3(0), SEL, OUT1(0));
	U2 : MUX_4_1 port map (IN0(1), IN1(1), IN2(1), IN3(1), SEL, OUT1(1));
	U3 : MUX_4_1 port map (IN0(2), IN1(2), IN2(2), IN3(2), SEL, OUT1(2));
	U4 : MUX_4_1 port map (IN0(3), IN1(3), IN2(3), IN3(3), SEL, OUT1(3));
	end STRUCTURE;