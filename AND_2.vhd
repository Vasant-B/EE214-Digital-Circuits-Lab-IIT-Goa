--A VHDL program for a simple AND Gate
--created by batch 8 on 12 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity AND_2 is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O2 : out std_logic);
end AND_2;

architecture FUNCTIONALITY of AND_2 is
begin 
	O2 <= I1 and I2;
end FUNCTIONALITY;