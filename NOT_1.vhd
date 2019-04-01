--A VHDL program for a simple NOT Gate
--created by batch 8 on 12 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity NOT_1 is
	port (I1 : in std_logic;
			O1 : out std_logic);
end NOT_1;

architecture FUNCTIONALITY of NOT_1 is
begin
	O1 <= not I1;
end FUNCTIONALITY;
