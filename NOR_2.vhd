--A VHDL program for a simple NOR Gate
--created by batch 8 on 12 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity NOR_2 is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O1 : out std_logic);
end NOR_2;

architecture STRUCTURE of NOR_2 is

   component OR_2 is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O2 : out std_logic);
   end component;
	 
	component NOT_1 is
	port (I1 : in std_logic;
			O1 : out std_logic);
   end component;
	
	signal S1 : std_logic;
	
begin
	U1 : OR_2 port map (I1, I2, S1);
	U2 : NOT_1 port map (S1, O1);
end STRUCTURE;