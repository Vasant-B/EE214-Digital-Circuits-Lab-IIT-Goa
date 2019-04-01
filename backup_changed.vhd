--A VHDL program for ALU MUX 
--designed by group 8 on 9 feb 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;



entity tb_ARRAY_MULTIPLIER1 is
end tb_ARRAY_MULTIPLIER1;



architecture behav of tb_ARRAY_MULTIPLIER1 is

	component ARRAY_MULTIPLIER1 is
	port (A, B : in std_logic_vector (3 downto 0);
		 P : out std_logic_vector (7 downto 0)   );
	end component;

	signal A, B : std_logic_vector(3 downto 0);
	signal P, P_T : std_logic_vector (7 downto 0);
	--signal p_tmp : integer;
		
begin
	tb_ARRAY_MULTIPLIER1 : ARRAY_MULTIPLIER1 port map (A, B, P);	
process
begin
A <= "1000";
B <= "1010";
wait for 100 ns;
end process;
--loop_A : for i in 0 to 15 loop
--		loop_B : for j in 0 to 15 loop
--			A <= std_logic_vector(to_unsigned(i, 4));
--			B <= std_logic_vector(to_unsigned(j, 4));
--			P_T <= std_logic_vector(to_unsigned(i*j,8));
--			
--			  -- error checking
--			  --p_tmp <= to_integer (unsigned(P));
--			  --P_T <= std_logic_vector(to_unsigned(p_tmp, 8));
--				--exit when (P /= P_T) ;
--			wait for 50 ns;
--		end loop;
--		wait for 50 ns;
--end loop;
--end process;
end behav;		
		
