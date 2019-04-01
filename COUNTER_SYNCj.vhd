library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.EE214.all;


entity COUNTER_SYNC is
port (CLK : in std_logic; -- Clock input of the counter
EN : in std_logic; -- Enable input of the counter
RSTN : in std_logic; -- Active low reset input of the counter
LDN : in std_logic; -- Active low load input of the counter
D : in std_logic_vector(3 downto 0); -- Load value for LDN
C : out std_logic); -- Carry output from the counter
end COUNTER_SYNC;

architecture STRUCTURE of COUNTER_SYNC is
 SIGNAL X1, X0, X2, X3, EN1, EN2, EN3, s0, s1, s2, s3 : std_logic;
begin
U1 : MUX_2_1 port map(D(0),X0,LDN,S0);
U2 : MUX_2_1 port map(D(1),X1,LDN,S1);
U3 : MUX_2_1 port map(D(2),X2,LDN,S2);
U4 : MUX_2_1 port map(D(3),X3,LDN,S3);
U5 : D_FF port map(s0,CLK,’1’,’1’,Q(0),QN(0));
U6 : D_FF port map(s1,CLK,’1’,’1’,Q(1),QN(1));
U7 : D_FF port map(s2,CLK,’1’,’1’,Q(2),QN(2));
U8 : D_FF port map(s3,CLK,’1’,’1’,Q(3),QN(3));
U9 : AND_2 port map(EN,QN(0),EN1);
U10 : AND_2 port map(EN1,QN(0),EN2);
U11 : AND_2 port map(EN2,QN(0),EN3);;
U12 : AND_2 port map(EN3,QN(0),C);
U13 : XOR_2 port map(Q(0),EN,X0);
U14: XOR_2 port map(Q(0),EN1,X1);
U15: XOR_2 port map(Q(0),EN2,X2);
U16: XOR_2 port map(Q(3),EN3,X3);

end STRUCTURE;