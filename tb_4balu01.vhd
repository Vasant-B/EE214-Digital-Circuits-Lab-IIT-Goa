--A VHDL program for ALU MUX 
--designed by vasant on 25 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity tb_4balu01 is
end tb_4balu01;



architecture behav of tb_4balu01 is
	component F4B_ALU01 is
	port (A3, A2, A1, A0, B3, B2, B1, B0 : in std_logic;
		F2, F1, F0 : in std_logic;
		X7,X6,X5,X4,X3,X2,X1,X0: out std_logic );
	end component;

	signal A, B : std_logic_vector(3 downto 0);
	signal F : std_logic_vector (2 downto 0);
	signal X : std_logic_vector (7 downto 0);

		
begin
	tb_4balu01 : F4B_ALU01 port map (A(3),A(2),A(1),A(0),B(3),B(2),B(1),B(0),F(2),F(1),F(0),X(7),X(6),X(5),X(4),X(3),X(2),X(1),X(0));
	
process
begin
A <= "0000";
B <= "0111";


F <= "000";
wait for 10 ns;
F <= "111";
wait for 10 ns;
F <= "001";
wait for 10 ns;
F <= "010";
wait for 10 ns;



end process;
end behav;