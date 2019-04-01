--A VHDL program for a BCD_DOWNCOUNTER01 with asynch reset
--designed by Vasant on 22 Feb 2018 using the reference book

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.EE214.all;


	
entity BCD_DOWNCOUNTER03 is
	port (CLK : in std_logic;
			RSTN, LDN : inout std_logic;
			LOAD_in : in std_logic_vector (3 downto 0);
			CLRN : inout std_logic;
			E : inout std_logic;
			C : out std_logic;
			Q   : inout std_logic_vector(3 downto 0)	);
end BCD_DOWNCOUNTER03;


architecture STRUCTURE of BCD_DOWNCOUNTER03 is
--		signal count : std_logic_vector(3 downto 0);
	signal Q_L,S : std_logic_vector (3 downto 0);
	signal PREN, CLKwithE, Reset_9 : std_logic;
	signal rst_h : std_logic_vector (7 downto 0);
	signal QN_L,QN, D : std_logic_vector (3 downto 0);
	signal CLRN_L, PREN_L, E_L : std_logic; -- local clrN and PREN
	signal LOAD_inN : std_logic_vector (3 downto 0);
	
begin

	PREN <= '1';
 --U01: AND_2 port map (CLRN, Reset_9, CLRN_L);
 U01: AND_2 port map (RSTN, Reset_9, CLRN_L);
 U02: AND_2 port map (E, LDN, E_L);
 U03: AND_2 port map (CLK, E_L, CLKwithE);
 
	U1 : D_FF port map (D(0), CLKwithE, PREN, CLRN_L, Q_L(0), QN_L(0) );
	U2 : D_FF port map (D(1), CLKwithE, PREN, CLRN_L, Q_L(1), QN_L(1) );
	U3 : D_FF port map (D(2), CLKwithE, PREN, CLRN_L, Q_L(2), QN_L(2) );
	U4 : D_FF port map (D(3), CLKwithE, PREN, CLRN_L, Q_L(3), QN_L(3) );
	
	
	
-- Reset_9 = 0 if Q >=1010

	U10 : AND_4 port map (Q(3),QN(2),Q(1),QN(0)      , rst_h(5)); --Q = 1010
	U11 : AND_4 port map (Q(3),QN(2),Q(1),Q(0)    , rst_h(4)); --Q = 1011
	U12 : AND_4 port map (Q(3),Q(2),QN(1),QN(0)      , rst_h(3)); --Q = 1100
	U13 : AND_4 port map (Q(3),Q(2),QN(1),Q(0)    , rst_h(2)); --Q = 1101
	U14 : AND_4 port map (Q(3),Q(2),Q(1),QN(0)    , rst_h(1)); --Q = 1110
	U15 : AND_4 port map (Q(3),Q(2),Q(1),Q(0)  , rst_h(0)); --Q = 1111
	U16 : OR_4 port map  (rst_h(5), rst_h(4), rst_h(3), rst_h(2), rst_h(6));
	U17 : OR_2 port map	(rst_h(6), rst_h(0), rst_h(7));
	U18 : NOT_1 port map (rst_h(7), Reset_9);
	-- so, we will have rst7 high and Reset_9 low when Q >= 10
	-- CLRN is active low, that means, when CLRN is low, the BCD Clears.
	
-- D
	D(0) <= ( (QN(0)) or ( Q(3) and (Q(1) or Q(2))  )  );
	D(1) <= ( (Q(1) and Q(0)) or (Q(2) and Q(3)) or (Q(3) and QN(0)) or (Q(2) and QN(1) and QN(0)) );
	D(2) <= ( (Q(2) and Q(0)) or (Q(3) and QN(0)) or (Q(1) and Q(2)) or (Q(1) and Q(3))   );
	D(3) <= ( (QN(3) and QN(2) and QN(1) and QN(0)) or ( Q(3) and (Q(0) or Q(1) or Q(2) ) )   );
	
	C <= (QN(3) and QN(2) and QN(1) and QN(0) and E );
	
-- Loading with LOAD_in

	U20 : MUX_2_1_P port map ( LOAD_in (0), Q_L(0), LDN, Q(0) );
	U21 : MUX_2_1_P port map ( LOAD_in (1), Q_L(1), LDN, Q(1) );
	U22 : MUX_2_1_P port map ( LOAD_in (2), Q_L(2), LDN, Q(2) );
	U23 : MUX_2_1_P port map ( LOAD_in (3), Q_L(3), LDN, Q(3) );
	
	LOAD_inN (0) <= not LOAD_in (0);
	LOAD_inN (1) <= not LOAD_in (1);
	LOAD_inN (2) <= not LOAD_in (2);
	LOAD_inN (3) <= not LOAD_in (3);
	
	U30 : MUX_2_1_P port map ( LOAD_inN (0), QN_L(0), LDN, QN(0) );
	U31 : MUX_2_1_P port map ( LOAD_inN (1), QN_L(1), LDN, QN(1) );
	U32 : MUX_2_1_P port map ( LOAD_inN (2), QN_L(2), LDN, QN(2) );
	U33 : MUX_2_1_P port map ( LOAD_inN (3), QN_L(3), LDN, QN(3) );

end STRUCTURE;