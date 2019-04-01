--A VHDL program for a 7 segment decoder
--designed by vasant 2 feb 18

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;


entity SEV_SEG_DEC1 is
	port (D, C, B, A: in std_logic;
		g1, f1, e1, d1, c1, b1, a1 : out std_logic);
end SEV_SEG_DEC1;

architecture STRUCTURE of SEV_SEG_DEC1 is

	signal D_dash, C_dash, B_dash, A_dash : std_logic;

	signal a1_0, a1_1, a1_2, a1_3, a1_4 : std_logic;
	signal b1_0, b1_1, b1_2, b1_3, b1_4 : std_logic;
	signal c1_0, c1_1, c1_2, c1_3, c1_4 : std_logic;
	signal d1_0, d1_1, d1_2, d1_3, d1_4, d1_5 : std_logic;
	signal e1_0, e1_1, e1_2, e1_3, e1_4 : std_logic;
	signal f1_0, f1_1, f1_2, f1_3, f1_4 : std_logic;
	signal g1_0, g1_1, g1_2, g1_3, g1_4 : std_logic;
	
	
	
	

begin 
U0_1 : NOT_1 port map (A , A_dash);
U0_2 : NOT_1 port map (B , B_dash);
U0_3 : NOT_1 port map (C , C_dash);
U0_4 : NOT_1 port map (D , D_dash);

--a1
	a1_0 <= D;
	Ua1_0: AND_3 port map (D_dash, C, A, a1_1);
	Ua1_1: AND_3 port map (D_dash, C_dash, B, a1_2);
	Ua1_2: AND_4 port map (D_dash,C_dash, B_dash, A_dash, a1_3);
	Ua1_3: OR_4 port map (a1_0, a1_1, a1_2, a1_3, a1);

--b1
	b1_0 <= D;
	Ub1_0: AND_2 port map (D_dash, C_dash, b1_1);
	Ub1_1: AND_4 port map (D_dash, C, A, B, b1_2);
	Ub1_2: AND_4 port map (D_dash,C_dash, B_dash, A_dash, b1_3);
	Ub1_3: OR_4 port map (b1_0, b1_1, b1_2, b1_3, b1);

--c1
	c1_0 <= D;
	Uc1_0: AND_2 port map (D_dash, C, c1_1);
	Uc1_1: AND_3 port map (D_dash, C_dash, B_dash, c1_2);
	Uc1_2: AND_4 port map (D_dash,C_dash, B, A, c1_3);
	Uc1_3: OR_4 port map (c1_0, c1_1, c1_2, c1_3, c1);


--d1
	Ud1_0: AND_2 port map (D, A_dash, d1_0);
	Ud1_1: AND_4 port map (D_dash, C, A, B_dash, d1_1);
	Ud1_2: AND_4 port map (D_dash, C, A_dash, B, d1_2);
	Ud1_3: AND_3 port map (D_dash, C_dash, B, d1_3);
	Ud1_4: AND_4 port map (D_dash, C_dash, B_dash,A_dash, d1_4);
	Ud1_5: OR_4 port map (d1_0, d1_1, d1_2, d1_3, d1_5);
	Ud1_6: OR_2 port map (d1_4, d1_5, d1);


--e1
	Ue1_0: AND_2 port map (D, A_dash, e1_0);
	Ue1_1: AND_4 port map (D_dash, C, B, A_dash, e1_1);
	Ue1_2: AND_3 port map (D_dash, C_dash, A_dash, e1_2);
	Ue1_3: OR_3 port map (e1_0, e1_1, e1_2, e1);

--f1
	f1_0 <= D;
	Uf1_0: AND_3 port map (D_dash, C, A_dash, f1_1);
	Uf1_1: AND_3 port map (D_dash, C, B_dash, f1_2);
	Uf1_2: AND_4 port map (D_dash,C_dash, B_dash, A_dash, f1_3);
	Uf1_3: OR_4 port map (f1_0, f1_1, f1_2, f1_3, f1);

--g1
	g1_0 <= D;
	Ug1_0: AND_3 port map (D_dash, C, A_dash, g1_1);
	Ug1_1: AND_3 port map (D_dash, C, B_dash, g1_2);
	Ug1_2: AND_4 port map (D_dash, C_dash, B, g1_3);
	Ug1_3: OR_4 port map (g1_0, g1_1, g1_2, g1_3, g1);

end STRUCTURE;
