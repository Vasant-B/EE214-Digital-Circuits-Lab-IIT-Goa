--A VHDL program for a Four Bit Downcounter with asynch reset
--designed by Vasant on 8th march 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;

entity FD_BCD_DNCTR is
	port (CLK : in std_logic;
			RSTN : in std_logic;
			--E : in std_logic;
			LDN : in std_logic;
			LOAD_in : in std_logic_vector (3 downto 0);
			LOAD_SEL : inout std_logic_vector (1 downto 0);
			Q   : inout std_logic_vector(3 downto 0)
				);
end FD_BCD_DNCTR;


architecture STRUCTURE of FD_BCD_DNCTR is
	signal S : std_logic_vector(1 downto 0);
	signal C, Q0, Q1, Q2, Q3, L0, L1, L2, L3 : std_logic_vector(3 downto 0);
	signal QI0, QI1, QI2, QI3 : integer;
	signal E : std_logic;

begin
	E <= '1';
	
	U1 : CLKBY4_1 port map (CLK, RSTN, E, S);
	
--	U20: COUNTER_SYNC_Ganna port map (S(1), E   , RSTN, LDN, L0, C(0), Q0);
--	U21: COUNTER_SYNC_Ganna port map (S(1), C(0), RSTN, LDN, L1, C(1), Q1);
--	U22: COUNTER_SYNC_Ganna port map (S(1), C(1), RSTN, LDN, L2, C(2), Q2);
--	U23: COUNTER_SYNC_Ganna port map (S(1), C(2), RSTN, LDN, L3, C(3), Q3);
	
	U10: BCD_DOWNCOUNTER05 port map (S(1), E   , RSTN, LDN, L0, C(0), Q0);
	U11: BCD_DOWNCOUNTER05 port map (S(1), C(0), RSTN, LDN, L1, C(1), Q1);
	U12: BCD_DOWNCOUNTER05 port map (S(1), C(1), RSTN, LDN, L2, C(2), Q2);
	U13: BCD_DOWNCOUNTER05 port map (S(1), C(2), RSTN, LDN, L3, C(3), Q3);
	
	U2 : MUX_16_4 port map (Q0, Q1, Q2, Q3, S, Q);
	
	
-- Loading
	L0(0) <= ((LOAD_in (0)) and (not LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	L0(1) <= ((LOAD_in (1)) and (not LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	L0(2) <= ((LOAD_in (2)) and (not LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	L0(3) <= ((LOAD_in (3)) and (not LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	
	L1(0) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	L1(1) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	L1(2) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	L1(3) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (not LOAD_SEL (1)) );
	
	L2(0) <= ((LOAD_in (0)) and (not LOAD_SEL(0)) and (LOAD_SEL (1)) );
	L2(1) <= ((LOAD_in (0)) and (not LOAD_SEL(0)) and (LOAD_SEL (1)) );
	L2(2) <= ((LOAD_in (0)) and (not LOAD_SEL(0)) and (LOAD_SEL (1)) );
	L2(3) <= ((LOAD_in (0)) and (not LOAD_SEL(0)) and (LOAD_SEL (1)) );
	
	L3(0) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (LOAD_SEL (1)) );
	L3(1) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (LOAD_SEL (1)) );
	L3(2) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (LOAD_SEL (1)) );
	L3(3) <= ((LOAD_in (0)) and (LOAD_SEL(0)) and (LOAD_SEL (1)) );
	
	QI0 <= to_integer(unsigned(Q0));
	QI1 <= to_integer(unsigned(Q1));
	QI2 <= to_integer(unsigned(Q2));
	QI3 <= to_integer(unsigned(Q3));
		
end STRUCTURE;