--A VHDL program for a Four Bit Downcounter with asynch reset
--designed by Vasant on 8th march 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;

entity FD_BCD_DNCTR_F is --four bit downcounter FULL
	port (CLK : in std_logic;
			RSTN : in std_logic;
			LDN : in std_logic;
			LOAD_in : in std_logic_vector (3 downto 0);
			LOAD_SEL : inout std_logic_vector (1 downto 0);
			Q   : inout std_logic_vector(3 downto 0);
			S0, S1, S2, S3 : out std_logic;
			Overflow : inout std_logic
				);
end FD_BCD_DNCTR_F;



architecture STRUCTURE of FD_BCD_DNCTR_F is
	
	signal L3, L2, L1, L0 : std_logic_vector (3 downto 0);
	signal SC : std_logic_vector (1 downto 0);
	signal CLKD, CLKD1, CLKD2 : std_logic_vector(1 downto 0);
	signal QI0, QI1, QI2, QI3 : integer;

begin
	U1 :FD_BCD_DNCTR_1 port map ( CLK --not --CLKD2(0)
											, RSTN, LDN, L3, L2, L1, L0, Q, Overflow);
	U2 :FD_MEM01 port map (LOAD_in, LOAD_SEL, L3, L2, L1, L0);

	QI0 <= to_integer(unsigned(Q));

	process (CLK, SC)
	begin
	if    ( SC(0) = '0' and SC(1) = '0' ) then
		S0 <= '0';
		S1 <= '1';
		S2 <= '1';
		S3 <= '1';
	elsif ( SC(0) = '1' and SC(1) = '0' ) then
		S0 <= '1';
		S1 <= '0';
		S2 <= '1';
		S3 <= '1';
	elsif ( SC(0) = '0' and SC(1) = '1' ) then
		S0 <= '1';
		S1 <= '1';
		S2 <= '0';
		S3 <= '1';
	elsif ( SC(0) = '1' and SC(1) = '1' ) then
		S0 <= '1';
		S1 <= '1';
		S2 <= '1';
		S3 <= '0';
	end if;
	end process;
	
end STRUCTURE;