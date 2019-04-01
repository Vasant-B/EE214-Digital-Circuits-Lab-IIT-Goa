--A VHDL program for a simple NAND Gate
--created by batch 8 on 12 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity NOR_P is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O1 : out std_logic);
end NOR_P;

architecture STRUCTURE of NOR_P is
	
	signal S1 : std_logic;
	
begin
	U1 : OR_2 port map (I1, I2, S1);
	U2 : NOT_1 port map (S1, O1);
end STRUCTURE;