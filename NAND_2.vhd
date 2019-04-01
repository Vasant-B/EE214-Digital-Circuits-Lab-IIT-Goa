--A VHDL program for a simple NAND Gate
--created by batch 8 on 12 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity NAND_2 is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O1 : out std_logic);
end NAND_2;

architecture STRUCTURE of NAND_2 is

   component AND_2 is
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
	U1 : AND_2 port map (I1, I2, S1);
	U2 : NOT_1 port map (S1, O1);
end STRUCTURE;