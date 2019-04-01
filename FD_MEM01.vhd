--A VHDL program for a Four Digit Memory taking in one digit at a time and having select lines for the same
--designed by Vasant on 8th march 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;

--I want it to take L0, L1, L2, L3 and store it
entity FD_MEM01 is
	port (LOAD_in : in std_logic_vector (3 downto 0);
			LOAD_SEL : in std_logic_vector (1 downto 0);
			L3, L2, L1, L0 : out std_logic_vector (3 downto 0)  );
end FD_MEM01;


architecture STRUCTURE of FD_MEM01 is
	
	signal L0N, L1N, L2N, L3N : std_logic_vector(3 downto 0);
	signal SEL0, SEL1, SEL2, SEL3 : std_logic;

begin

	U51: 
	SEL0 <= ((not LOAD_SEL(0)) and (not LOAD_SEL (1)));
	SEL1 <= ((    LOAD_SEL(0)) and (not LOAD_SEL (1)));
	SEL2 <= ((not LOAD_SEL(0)) and (    LOAD_SEL (1)));
	SEL3 <= ((    LOAD_SEL(0)) and (    LOAD_SEL (1)));
	
	U1 : D_LATCH port map (LOAD_in(0), SEL0, L0(0), L0N(0) );
	U2 : D_LATCH port map (LOAD_in(1), SEL0, L0(1), L0N(1) );
	U3 : D_LATCH port map (LOAD_in(2), SEL0, L0(2), L0N(2) );
	U4 : D_LATCH port map (LOAD_in(3), SEL0, L0(3), L0N(3) );
	
	
	U5 : D_LATCH port map (LOAD_in(0), SEL1, L1(0), L1N(0) );
	U6 : D_LATCH port map (LOAD_in(1), SEL1, L1(1), L1N(1) );
	U7 : D_LATCH port map (LOAD_in(2), SEL1, L1(2), L1N(2) );
	U8 : D_LATCH port map (LOAD_in(3), SEL1, L1(3), L1N(3) );
	
	
	U9 : D_LATCH port map (LOAD_in(0), SEL2, L2(0), L2N(0) );
	U10: D_LATCH port map (LOAD_in(1), SEL2, L2(1), L2N(1) );
	U11: D_LATCH port map (LOAD_in(2), SEL2, L2(2), L2N(2) );
	U12: D_LATCH port map (LOAD_in(3), SEL2, L2(3), L2N(3) );
	
	
	U13: D_LATCH port map (LOAD_in(0), SEL3, L3(0), L3N(0) );
	U14: D_LATCH port map (LOAD_in(1), SEL3, L3(1), L3N(1) );
	U15: D_LATCH port map (LOAD_in(2), SEL3, L3(2), L3N(2) );
	U16: D_LATCH port map (LOAD_in(3), SEL3, L3(3), L3N(3) );
	
end STRUCTURE;