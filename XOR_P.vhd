--A VHDL program for a simple NAND Gate
--created by batch 8 on 12 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity XOR_P is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O1 : out std_logic);
end XOR_P;

architecture STRUCTURE of XOR_P is
	
	signal S1, S2, S3, S4, S5 : std_logic;
	
begin
	U1 : NOR_2 port map (I1, I1, S1);
	U2 : NOR_2 port map (I2, I2, S2);
	U3 : NOR_2 port map (S1, I2, S3);
	U4 : NOR_2 port map (I1, S2, S4);
	U5 : NOR_2 port map (S3, S4, S5);
	U6 : NOR_2 port map (S5, S5, O1);
end STRUCTURE;
