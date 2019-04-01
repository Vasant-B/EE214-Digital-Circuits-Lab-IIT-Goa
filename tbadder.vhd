--A VHDL program for a four bit adder using XOR
--designed by group 8 on 15 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity tb_4b_adder is
end tb_4b_adder;


architecture beh of tb_4b_adder is
	component FOUR_BIT_ADDER1 is
	port (a1, a2, a3, a4, b1, b2, b3, b4 : in std_logic;
		 S0, S1, S2, S3, C3 : out std_logic );
   end component;
	signal a1, a2, a3, a4, b1, b2, b3, b4, S0, S1, S2, S3, C3 : std_logic;
	signal C0, C1, C2 : std_logic;
	
begin
	tb_4b_adder : FOUR_BIT_ADDER1 port map (a1, a2, a3, a4, b1, b2, b3, b4, S0, S1, S2, S3, C3);

process
begin
a1 <= '0';
a2 <= '1';
a3 <= '0';
a4 <= '0';
b1 <= '0';
b2 <= '1';
b3 <= '0';
b4 <= '0';	
wait for 1000 ns;

end process;
	
	
end beh;