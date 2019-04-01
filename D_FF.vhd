--A VHDL program for a +ve edge triggered D flip flop
--designed by Vasant on 20 Feb 2018 using the reference book
--asynchronous reset
library ieee;
use ieee.std_logic_1164.all;
--library work;
--use work.EE214.all;

	
entity D_FF is             	-- Declaration of a +ve edge triggered D flipflop
	port(D : in std_logic;  	-- Data input of the D flipflop
		CLK : in std_logic;     -- Clock input of the D flipflop
		PREN : in std_logic;    -- Asynchronous active low preset input
		CLRN : in std_logic;    -- Asynchronous active low clear input
		Q : buffer std_logic;   -- Q output of the D flipflop
		QN : out std_logic);    -- Q_bar output of the D flipflop
end D_FF;

architecture BEHAVIOUR of D_FF is

begin

	process (CLRN, PREN, CLK)
	begin
		if CLRN = '0' then
			Q <= '0';
			QN <= '1';
		elsif PREN = '0' then
			Q <= '1';
			QN <= '0';
		elsif CLK'event and CLK = '1' then
			Q <= D;
			QN <= not D;
		end if;
		
	end process;

end BEHAVIOUR;