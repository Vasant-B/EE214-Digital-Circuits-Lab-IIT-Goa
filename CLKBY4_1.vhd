--A VHDL program for a clock divider with asynch reset
--designed by Vasant on 05 Mar 2018


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.EE214.all;

entity CLKBY4_1 is
	port (CLK : in std_logic;
			RSTN : in std_logic;
			E : in std_logic;
			QF : inout std_logic_vector (1 downto 0));
end CLKBY4_1;



architecture STRUCTURE of CLKBY4_1 is

	signal Reset_9 : std_logic;
	signal S: std_logic_vector (7 downto 0);
	signal rst_h: std_logic_vector (9 downto 0);
	signal Q, QN, D : std_logic_vector (3 downto 0);
	signal RSTN_L : std_logic;
	signal PREN, CLRN :std_logic;
	
begin
	
	PREN <= '1';
	RSTN_L <= (RSTN and Reset_9);
	CLRN <= RSTN_L;
	
	U1 : D_FF port map (D(0), CLK  , PREN, CLRN, Q(0), QN(0));
	U2 : D_FF port map (D(1), QN(0), PREN, CLRN, Q(1), QN(1));
	U3 : D_FF port map (D(2), QN(1), PREN, CLRN, Q(2), QN(2));
	U4 : D_FF port map (D(3), QN(2), PREN, CLRN, Q(3), QN(3));
	
	U5 : XOR_P port map (E   , Q(0), S(0));
	U6 : XOR_P port map (S(4), Q(1), S(1));
	U7 : XOR_P port map (S(5), Q(2), S(2));
	U8 : XOR_P port map (S(6), Q(3), S(3));
	
	U9 : AND_2 port map (E   , Q(0), S(4));
	U10: AND_2 port map (S(4), Q(1), S(5));
	U11: AND_2 port map (S(5), Q(2), S(6));
	U12: AND_2 port map (S(6), Q(3), S(7));
		
	D(0) <= S(0);
	D(1) <= S(1);
	D(2) <= S(2);
	D(3) <= S(3);
	
	QF(0) <= Q(0);
	QF(1) <= Q(1);
	
-- Reset_9 = 0 if Q >=1010
	
	U26 : AND_4 port map (QN(3),  Q(2), QN(1), QN(0)   , rst_h(6)); --Q = 0100
	U27 : AND_4 port map (Q(3) , QN(2), QN(1), QN(0)   , rst_h(7)); --Q = 1000
	U28 : AND_4 port map (Q(3) , QN(2), QN(1),  Q(0)   , rst_h(8)); --Q = 1001
	
	U20 : AND_4 port map (Q(3), QN(2),  Q(1), QN(0)   , rst_h(5)); --Q = 1010
	U21 : AND_4 port map (Q(3), QN(2),  Q(1),  Q(0)   , rst_h(4)); --Q = 1011
	U22 : AND_4 port map (Q(3),  Q(2), QN(1), QN(0)   , rst_h(3)); --Q = 1100
	U23 : AND_4 port map (Q(3),  Q(2), QN(1),  Q(0)   , rst_h(2)); --Q = 1101
	U24 : AND_4 port map (Q(3),  Q(2),  Q(1), QN(0)   , rst_h(1)); --Q = 1110
	U25 : AND_4 port map (Q(3),  Q(2),  Q(1),  Q(0)   , rst_h(0)); --Q = 1111
	
	rst_h(9) <= (rst_h(0) or rst_h(1) or rst_h(2) or rst_h(3) or rst_h(4) or rst_h(5) or rst_h(6) or rst_h(7) or rst_h(8));
	
	Reset_9 <= (not rst_h(9));
	-- so, we will have rst_h(6) high and Reset_9 low when Q >= 10
	-- CLRN is active low, that means, when CLRN is low, the BCD Clears.
	
end STRUCTURE;