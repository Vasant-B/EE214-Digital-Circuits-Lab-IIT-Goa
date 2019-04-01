-- A VHDL FILE FOR SYNCHRONOUR DOWN COUNTER
-- CREATED BY RAJEEV AND PRABAL ON 21 FEB 2018
library ieee;
use ieee.std_logic_1164.all;
--use work;
use WORK.EE214.ALL;

entity COUNTER_SYNC is
port(
	CLK : in std_logic;
	RSTN : in std_logic;
	LDN : in std_logic;
	D : in std_logic_vector(3 downto 0);
	Q : inout std_logic_vector(3 downto 0));
END COUNTER_SYNC;

ARCHITECTURE STRUCTURE OF COUNTER_SYNC IS
SIGNAL S0,S1,S2,S3,F0,F1,F2,F3,N0,N1,N2,N3 : STD_LOGIC;
begin
F0<=((NOT Q(0)) AND (NOT Q(3))) OR ((NOT Q(2)) AND ( NOT Q(1)) AND (NOT Q(0)));
F1<=((NOT Q(3)) AND (Q(2)) AND (NOT Q(1)) AND (NOT Q(0)))	 OR	 (Q(3) AND (NOT Q(2)) AND (NOT Q(1)) AND (NOT Q(0)))	OR	((NOT Q(3)) AND Q(1) AND (NOT Q(0)));
F2<=(Q(3) AND (NOT Q(2)) AND (NOT Q(1)) AND (NOT Q(0)))		 OR	 ((NOT Q(3)) AND (Q(2)) AND (Q(0)))	OR	((NOT Q(3)) AND (Q(2)) AND (Q(1)));
F3<=((NOT Q(3)) AND (Q(2)) AND (NOT Q(1)) AND (NOT Q(0)))	 OR	 ((Q(3)) AND (NOT Q(2)) AND (NOT Q(1)) AND (NOT Q(0)));	

	U1	:	MUX_2_1_P PORT MAP (F0,D(0),NOT LDN,S0);
	U2	:	MUX_2_1_P PORT MAP (F1,D(1),NOT LDN,S1);
	U3	:	MUX_2_1_P PORT MAP (F2,D(2),NOT LDN,S2);
	U4	:	MUX_2_1_P PORT MAP (F3,D(3),NOT LDN,S3);
	U5	:	D_FF 	PORT MAP (S0,CLK,RSTN,'1',Q(0),N0);
	U6	:	D_FF 	PORT MAP (S1,CLK,'1',RSTN,Q(1),N1);
	U7	:	D_FF 	PORT MAP (S2,CLK,'1',RSTN,Q(2),N2);
	U8	:	D_FF 	PORT MAP (S3,CLK,RSTN,'1',Q(3),N3);
END STRUCTURE;