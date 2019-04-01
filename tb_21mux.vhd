--A VHDL program for test bench 2:1 MUX using basic gates
--designed by Vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity tb_21mux is
end tb_21mux;

architecture behav of tb_21mux is
	component MUX_2_1_P is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			SEL : in std_logic;
			OUT1: out std_logic);
   end component;

	signal I0, I1, S0, f : std_logic;
	
begin
	tb_21mux : MUX_2_1_P port map (I0, I1, S0, f);
	
process
begin
I0 <= '1';
I1 <= '0';
S0 <= '0';
wait for 1000 ns;
S0 <= '1';
wait for 1000 ns;



end process;
end behav;