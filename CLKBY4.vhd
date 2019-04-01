--A VHDL program for a clock divider with asynch reset
--designed by Vasant on 05 Mar 2018


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.EE214.all;

entity CLKBY4 is
	port (CLK : in std_logic;
			PREN, CLRN : inout std_logic;
			E : inout std_logic;
			QF   : out std_logic_vector (1 downto 0));
end CLKBY4;

architecture STRUCTURE of CLKBY4 is

	signal S0, S1, S2, S3 : std_logic;
	signal CLKwithE, Reset_9 : std_logic;
	signal rst_h : std_logic_vector (7 downto 0);
	signal Q, QN : std_logic_vector (3 downto 0);
	signal CLRN_L, PREN_L : std_logic; -- local clrN
	
	
begin


 U01: AND_2 port map (CLRN, Reset_9, CLRN_L);
 U0 : AND_2 port map (CLK, E, CLKwithE);



PREN_L <= PREN;

	U1 : D_FF port map (S0, CLKwithE , PREN_L, CLRN_L, Q(0), S0);
	U2 : D_FF port map (S1, S0, PREN_L, CLRN_L, Q(1), S1);
	U3 : D_FF port map (S2, S1, PREN_L, CLRN_L, Q(2), S2);
	U4 : D_FF port map (S3, S2, PREN_L, CLRN_L, Q(3), S3);
	
	
-- Reset_9 = 0 if Q >=1010

	U10 : AND_4 port map (Q(3),S2,Q(1),S0      , rst_h(5)); --Q = 1010
	U11 : AND_4 port map (Q(3),S2,Q(1),Q(0)    , rst_h(4)); --Q = 1011
	U12 : AND_4 port map (Q(3),Q(2),S1,S0      , rst_h(3)); --Q = 1100
	U13 : AND_4 port map (Q(3),Q(2),S1,Q(0)    , rst_h(2)); --Q = 1101
	U14 : AND_4 port map (Q(3),Q(2),Q(1),S0    , rst_h(1)); --Q = 1110
	U15 : AND_4 port map (Q(3),Q(2),Q(1),Q(0)  , rst_h(0)); --Q = 1111
	U16 : OR_4 port map  (rst_h(5), rst_h(4), rst_h(3), rst_h(2), rst_h(6));
	U17 : OR_2 port map	(rst_h(6), rst_h(0), rst_h(7));
	U18 : NOT_1 port map (rst_h(7), Reset_9);
	-- so, we will have rst7 high and Reset_9 low when Q >= 10
	-- CLRN is active low, that means, when CLRN is low, the BCD Clears.
	
	
	QF(0) <= Q(0);
	QF(1) <= Q(1);
	
	
end STRUCTURE;