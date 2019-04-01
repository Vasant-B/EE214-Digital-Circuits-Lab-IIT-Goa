--A VHDL program for a 8x3 encoder
--designed by vasant 2 feb 18

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;


entity ENC_8_3_01 is
	port (x7, x6, x5, x4, x3, x2, x1, x0: in std_logic;
		S2, S1, S0, N : out std_logic);
end ENC_8_3_01;

architecture STRUCTURE of ENC_8_3_01 is

	signal x7_dash, x6_dash, x5_dash, x4_dash, x3_dash, x2_dash, x1_dash, x0_dash : std_logic;

	signal N1, N2, N_dash, N_buff: std_logic;
	signal S0_1, S0_2, S0_3, S0_4, S0_3_1,  S0_3_2, S0_4_1,  S0_4_2, S0_x: std_logic;
	signal S1_1, S1_2, S1_3, S1_4, S1_3_1,  S1_3_2, S1_4_1,  S1_4_2, S1_x: std_logic;
	signal S2_1, S2_2, S2_3, S2_4, S2_3_1,  S2_3_2, S2_4_1,  S2_4_2, S2_1_0, S2_2_0, S2_x: std_logic;
	
	--signal c1_0, c1_1, c1_2, c1_3, c1_4 : std_logic;
	--signal d1_0, d1_1, d1_2, d1_3, d1_4, d1_5 : std_logic;
	--signal e1_0, e1_1, e1_2, e1_3, e1_4 : std_logic;
	--signal f1_0, f1_1, f1_2, f1_3, f1_4 : std_logic;
	--signal g1_0, g1_1, g1_2, g1_3, g1_4 : std_logic;
	
	
	
	

begin 
U0_7 : NOT_1 port map (x7 , x7_dash);
U0_6 : NOT_1 port map (x6 , x6_dash);
U0_5 : NOT_1 port map (x5 , x5_dash);
U0_4 : NOT_1 port map (x4 , x4_dash);
U0_3 : NOT_1 port map (x3 , x3_dash);
U0_2 : NOT_1 port map (x2 , x2_dash);
U0_1 : NOT_1 port map (x1 , x1_dash);
U0_0 : NOT_1 port map (x0 , x0_dash);



--N
	U1_0: AND_4 port map (x7_dash, x6_dash, x5_dash, x4_dash, N1);
	U1_1: AND_4 port map (x3_dash, x2_dash, x1_dash, x0_dash, N2);
	U1_2: AND_2 port map (N1, N2, N);
	U1_3: AND_2 port map (N1, N2, N_buff);
U0_8 : NOT_1 port map (N_buff, N_dash);


--S0
	US0_1: AND_2 port map (x1, x0_dash, S0_1);
	US0_2: AND_4 port map (x3, x2_dash, x1_dash, x0_dash, S0_2);
	US0_3: AND_4 port map (x5, x4_dash, x3_dash, x2_dash, S0_3_1);
	US0_4: AND_2 port map (x1_dash, x0_dash, S0_3_2);
	US0_5: AND_2 port map (S0_3_1, S0_3_2, S0_3);
	US0_6: AND_4 port map (x7, x6_dash, x5_dash, x4_dash, S0_4_1);
	US0_7: AND_4 port map (x3_dash, x2_dash, x1_dash, x0_dash, S0_4_2);
	US0_8: AND_2 port map (S0_4_1, S0_4_2, S0_4);
	US0_9: OR_4 port map (S0_1, S0_2, S0_3, S0_4, S0_x);
	US0_10 : AND_2 port map (S0_x, N_dash, S0);

	
--S1
	US1_1: AND_3 port map (x2, x1_dash, x0_dash, S1_1);
	US1_2: AND_4 port map (x3, x2_dash, x1_dash, x0_dash, S1_2);
	US1_3: AND_4 port map (x6, x5_dash, x4_dash, x3_dash, S1_3_1);
	US1_4: AND_3 port map (x2_dash, x1_dash, x0_dash, S1_3_2);
	US1_5: AND_2 port map (S1_3_1, S1_3_2, S1_3);
	--US1_6: AND_4 port map (x7, x6_dash, x5_dash, x4_dash, S0_4_1);
	--US1_7: AND_4 port map (x3_dash, x2_dash, x1_dash, x0_dash, S0_4_2);
	--US1_8: AND_2 port map (S0_4_1, S0_4_2, S0_4);
	US1_9: OR_4 port map (S1_1, S1_2, S1_3, S0_4, S1_x);
	US1_10 : AND_2 port map (S1_x, N_dash, S1);

	
--S2
	US2_1: AND_4 port map (x3_dash, x2_dash, x1_dash, x0_dash, S2_1_0);
	US2_2: AND_2 port map (S2_1_0, x4, S2_1);
	US2_3: AND_4 port map (x3_dash, x2_dash, x1_dash, x0_dash, S2_2_0);
	US2_4: AND_3 port map (S2_2_0, x4_dash, x5, S2_2);
	--US2_5: AND_2 port map (S1_3_1, S1_3_2, S1_3);
	--US1_6: AND_4 port map (x7, x6_dash, x5_dash, x4_dash, S0_4_1);
	--US1_7: AND_4 port map (x3_dash, x2_dash, x1_dash, x0_dash, S0_4_2);
	--US1_8: AND_2 port map (S0_4_1, S0_4_2, S0_4);
	US2_9: OR_4 port map (S2_1, S2_2, S0_4, S1_3, S2_x);
	US2_10 : AND_2 port map (S2_x, N_dash, S2);

	
end STRUCTURE;
