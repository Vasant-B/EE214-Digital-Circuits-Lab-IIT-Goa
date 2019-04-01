--A VHDL program for a BCD_DOWNCOUNTER01 with asynch reset
--designed by Vasant on 8 Mar 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.EE214.all;


	
entity BCD_DOWNCOUNTER04 is
	port (CLK : in std_logic;
			E, RSTN, LDN : in std_logic;
			LOAD_in : in std_logic_vector (3 downto 0) := "0000";
			Cout : out std_logic;
			Q    : inout std_logic_vector(3 downto 0)	);
end BCD_DOWNCOUNTER04;



architecture STRUCTURE of BCD_DOWNCOUNTER04 is
	
	signal S, SL, SE, QN, R, D : std_logic_vector(3 downto 0);
	signal CLRN, PREN : std_logic_vector (3 downto 0);
	signal RSTN_L, Reset_9 : std_logic;
	signal rst_h: std_logic_vector (7 downto 0); --reset help
	
	
begin
	
	U1 : D_FF port map (D(0) , CLK, PREN(0), CLRN(0), Q(0), QN(0) );
	U2 : D_FF port map (D(1) , CLK, PREN(1), CLRN(1), Q(1), QN(1) );
	U3 : D_FF port map (D(2) , CLK, PREN(2), CLRN(2), Q(2), QN(2) );
	U4 : D_FF port map (D(3) , CLK, PREN(3), CLRN(3), Q(3), QN(3) );
	
	R <= "1001";
	RSTN_L <= (RSTN and Reset_9);
	U6 : MUX_2_1_p port map (R(0), SL(0), RSTN_L, D(0) );
	U7 : MUX_2_1_p port map (R(1), SL(1), RSTN_L, D(1) );
	U8 : MUX_2_1_p port map (R(2), SL(2), RSTN_L, D(2) );
	U9 : MUX_2_1_p port map (R(3), SL(3), RSTN_L, D(3) );
	
	U10: MUX_2_1_p port map (LOAD_in(0), S(0), LDN, SL(0) );
	U11: MUX_2_1_p port map (LOAD_in(1), S(1), LDN, SL(1) );
	U12: MUX_2_1_p port map (LOAD_in(2), S(2), LDN, SL(2) );
	U13: MUX_2_1_p port map (LOAD_in(3), S(3), LDN, SL(3) );
	
	U14: XOR_P port map (E    , Q(0), S(0) );
	U15: XOR_P port map (SE(0), Q(1), S(1) );
	U16: XOR_P port map (SE(1), Q(2), S(2) );
	U17: XOR_P port map (SE(2), Q(3), S(3) );
	
	U18: AND_2 port map (E    , QN(0), SE(0));
	U19: AND_2 port map (SE(0), QN(1), SE(1));
	U20: AND_2 port map (SE(1), QN(2), SE(2));
	U21: AND_2 port map (SE(2), QN(3), SE(3));
	
	Cout <= (E and QN(0) and QN(1) and QN(2) and QN(3));
	
	
	-- Reset_9 = 0 if Q >=1010 and when Q = 0000
	U30 : AND_4 port map (Q(3), QN(2),  Q(1), QN(0)   , rst_h(5)); --Q = 1010
	U31 : AND_4 port map (Q(3), QN(2),  Q(1),  Q(0)   , rst_h(4)); --Q = 1011
	U32 : AND_4 port map (Q(3),  Q(2), QN(1), QN(0)   , rst_h(3)); --Q = 1100
	U33 : AND_4 port map (Q(3),  Q(2), QN(1),  Q(0)   , rst_h(2)); --Q = 1101
	U34 : AND_4 port map (Q(3),  Q(2),  Q(1), QN(0)   , rst_h(1)); --Q = 1110
	U35 : AND_4 port map (Q(3),  Q(2),  Q(1),  Q(0)   , rst_h(0)); --Q = 1111
	
	U36 : AND_4 port map (QN(3),  QN(2), QN(1), QN(0) , rst_h(6)); --Q = 0000
	
	rst_h(7) <= (rst_h(0) or rst_h(1) or rst_h(2) or rst_h(3) or rst_h(4) or rst_h(5) or rst_h(6));
	
	Reset_9 <= (not rst_h(7));
	-- so, we will have rst_h(7) high and Reset_9 low when Q >= 10
	
	
	
end STRUCTURE;