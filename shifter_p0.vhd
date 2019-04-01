--A VHDL program for shifter using 16:4 MUX 
--designed by vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity shifter_p0 is 
	port (A : in std_Logic_vector (3 downto 0);
			--IN0 : in std_logic_vector(3 downto 0);
			--IN1: in std_logic_vector(3 downto 0);
			--IN2: in std_logic_vector(3 downto 0);
			--IN3: in std_logic_vector(3 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			D : in std_logic;
			OUT1: out std_logic_vector(3 downto 0));
			
end shifter_p0;

architecture STRUCTURE of shifter_p0 is

	signal D_dash : std_logic; --, --S00, S01, S02, S03, S10, S11, S12, S13 : std_logic;
--	signal S0, S1, S2, S3 : std_Logic_vector (3 downto 0);
	signal S0, S1, S2, S3 : std_Logic_vector (3 downto 0);
	
begin
	
	U1000: NOT_1 port map (D, D_dash);
	
	--Y0
	U00: AND_2 port map (A(0), A(0), S0(0));
	U01: AND_2 port map (A(1), D_dash, S0(1));
	U02: AND_2 port map (A(2), D_dash, S0(2));
	U03: AND_2 port map (A(1), D_dash, S0(3));
	
	
	--Y1
	U10: AND_2 port map (A(1), A(1), S1(0));
	U11: MUX_2_1_P port map (A(2), A(0), D, S1(1));
	U12: AND_2 port map (A(3), D_dash, S1(2));
	U13: AND_2 port map (D, D_dash, S1(3));
	
	
	--Y2
	U20: AND_2 port map (A(2), A(2), S2(0));
	U21: MUX_2_1_P port map (A(3), A(1), D, S2(1));
	U22: AND_2 port map (A(0), D, S2(2));
	U23: AND_2 port map (D, D_dash, S2(3));
	
	
	--Y3
	U30: AND_2 port map (A(3), A(3), S3(0));
	U31: AND_2 port map (A(2), D, S3(1));
	U32: AND_2 port map (A(1), D, S3(2));
	U33: AND_2 port map (D, A(0), S3(3));

	U2000	: MUX_16_4 port map (S0, S1, S2, S3, SEL, OUT1);
	
	
end STRUCTURE;
