--A VHDL program for 4:1 MUX 
--designed by vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity tb_41mux is
end tb_41mux;

architecture behav of tb_41mux is
	component MUX_4_1 is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			IN2: in std_logic;
			IN3: in std_logic;
			SEL : in std_logic_vector(1 downto 0);
			OUT1: out std_logic);
   end component;

	signal I0, I1, I2, I3,f : std_logic;
	signal SL : std_logic_vector (1 downto 0);

		
begin
	tb_41mux : MUX_4_1 port map (I0, I1, I2, I3, SL, f);
	
process
begin
I0 <= '1';
I1 <= '0';
I2 <= '0';
I3 <= '0';

SL <= "00";
wait for 1000 ns;
SL <= "01";
wait for 1000 ns;
SL <= "10";
wait for 1000 ns;
SL <= "11";
wait for 1000 ns;



end process;
end behav;