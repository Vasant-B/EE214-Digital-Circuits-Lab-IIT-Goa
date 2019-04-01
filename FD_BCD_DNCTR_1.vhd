--A VHDL program for a Four Bit Downcounter with asynch reset
--designed by Vasant on 8th march 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;

entity FD_BCD_DNCTR_1 is
	port (CLK : in std_logic;
			RSTN : in std_logic;
			LDN : in std_logic;
			L3, L2, L1, L0 : in std_logic_vector (3 downto 0);
			Q   : inout std_logic_vector(3 downto 0);
			Overflow : inout std_logic
				);
end FD_BCD_DNCTR_1;


architecture STRUCTURE of FD_BCD_DNCTR_1 is
	signal S : std_logic_vector(1 downto 0);
	signal C, Q0, Q1, Q2, Q3 : std_logic_vector(3 downto 0); --, Q0L, Q1L, Q2L, Q3L
	signal QI0, QI1, QI2, QI3 : integer;
	signal RSTN_L, S1N : std_logic;
	signal RSTL_V, E : std_logic := '1';

begin
	
--	E <= '1';
	
	U0 : AND_2 port map (RSTN, RSTL_V, RSTN_L);
	
	U1 : CLKBY4_1 port map (CLK, RSTN_L, E, S);
	U5 : NOT_1 port map (S(1), S1N);
	
		
	U20: COUNTER_SYNC_Ganna port map (S(1), E   , RSTN, LDN, L0, C(0), Q0);
	U21: COUNTER_SYNC_Ganna port map (S(1), C(0), RSTN, LDN, L1, C(1), Q1);
	U22: COUNTER_SYNC_Ganna port map (S(1), C(1), RSTN, LDN, L2, C(2), Q2);
	U23: COUNTER_SYNC_Ganna port map (S(1), C(2), RSTN, LDN, L3, C(3), Q3);


--	U10: BCD_DOWNCOUNTER05 port map (S1N, E   , RSTN_L, LDN, L0, C(0), Q0);
--	U11: BCD_DOWNCOUNTER05 port map (S1N, C(0), RSTN_L, LDN, L1, C(1), Q1);
--	U12: BCD_DOWNCOUNTER05 port map (S1N, C(1), RSTN_L, LDN, L2, C(2), Q2);
--	U13: BCD_DOWNCOUNTER05 port map (S1N, C(2), RSTN_L, LDN, L3, C(3), Q3);
	
	U2 : MUX_16_4 port map (Q0, Q1, Q2, Q3, S, Q);
	
	
	
	QI0 <= to_integer(unsigned(Q0));
	QI1 <= to_integer(unsigned(Q1));
	QI2 <= to_integer(unsigned(Q2));
	QI3 <= to_integer(unsigned(Q3));
	
	--Overflow <= C(3);
	process (E, C(3)) --(Q0, Q1, Q2, Q3)
	begin
	if C(3) = '1' then 
	 E <= '0';
	 Overflow <= '1';
	end if;
	--if ((Q0 = "0000") and (Q1 = "0000") and (Q2 = "0000") and (Q3 = "0000")) then
	--	Overflow <= '1';
	--	RSTL_V <= '0';
	--	E <= '0';
	--else 
	--	Overflow <= '0';
	--	E <= '1';
	--end if;
	end process;
		
end STRUCTURE;