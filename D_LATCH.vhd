-- VHDL program for a +ve level triggered D latch
-- Latest version completed on 20/02/2018 by Nandakumar
-- Modified by Vasant on 08 Mar 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.EE214.all;

entity D_LATCH is								-- Entity declaration
	port(	D : in std_logic;					-- Data input of the D latch
			LTCH : in std_logic;				-- Latch input of the D latch
			Q : buffer std_logic;			-- Q output of the D latch
			QN : out std_logic);				-- Q_bar output of the D latch
end D_LATCH;

architecture FUNCTIONALITY of D_LATCH is		-- Architecture description of the D latch

begin

	process(D, LTCH)								-- Process with sensitivity list
	begin
		if LTCH = '1' then						-- Asynchronous active low clear
			Q <= D;
		end if;
	end process;
	
	QN <= not Q;
	
end FUNCTIONALITY;