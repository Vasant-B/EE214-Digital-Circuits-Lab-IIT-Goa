--A VHDL program for a clock divider
--designed by Vasant on 05 Mar 2018


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.EE214.all;

entity CLKDIV_1 is
	port (CLK : in std_logic;  --1KHZ
			RSTN : in std_logic; 
			E : in std_logic;
			Q : inout std_logic );
end CLKDIV_1;

architecture STRUCTURE of CLKDIV_1 is

	signal  S0, S1, S2, S3 : std_logic_vector(1 downto 0);
	
begin

	U1 : CLKBY4_1 port map (CLK, RSTN, E, S0);
	U2 : CLKBY4_1 port map (S0(1), RSTN, E, S1);
	U3 : CLKBY4_1 port map (S1(1), RSTN, E, S2);
	U4 : CLKBY4_1 port map (S2(1), RSTN, E, S3);
	Q <= S3(1);

end STRUCTURE;