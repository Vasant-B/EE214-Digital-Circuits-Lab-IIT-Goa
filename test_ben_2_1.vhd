--A VHDL program for 2:1 MUX 
--created by batch 8 on 22 Jan 2018

library ieee;
use ieee.std_logic_1164.all;

entity test_ben_2_1 is

end test_ben_2_1;

architecture STRUCTURE of test_ben_2_1 is
   component MUX_2_1 is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			SEL : in std_logic;
			OUT1: out std_logic);
end component;

   
	
	signal IN0, IN1,SEL,OUT1 : std_logic;
	
begin
	U1 : MUX_2_1 port map (IN0, IN1,SEL,OUT1);
	PROCESS
	
	BEGin 
	
	IN0 <= '0' ;
   IN1 <= '1';
	SEL <= '0';
	
	WAIT FOR 100NS;
		IN0 <= '0' ;
   IN1 <= '0';
	SEL <= '0';
	
	WAIT FOR 100NS;
		IN0 <= '0' ;
   IN1 <= '1';
	SEL <= '1';
	
	WAIT FOR 100NS;
		IN0 <= '1' ;
   IN1 <= '1';
	SEL <= '1';
	
	WAIT FOR 100NS;
	END PROCESS;
end STRUCTURE;