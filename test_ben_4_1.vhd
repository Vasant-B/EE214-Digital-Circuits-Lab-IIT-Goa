--A VHDL program for 4:1 MUX 
--created by batch 8 on 22 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity test_ben_4_1 is

end test_ben_4_1;

architecture STRUCTURE of test_ben_4_1 is
   component MUX_4_1 is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			IN2: in std_logic;
			IN3: in std_logic;
			SEL : in std_logic_vector(1 downto 0);
			OUT1: out std_logic);
end component;
	signal IN0, IN1, IN2, IN3, OUT1 : std_logic;
	signal SEL : std_logic_vector(1 downto 0);
begin
	U1 : MUX_4_1 port map (IN0, IN1, IN2, IN3, SEL, OUT1);
	
	PROCESS
	
begin 
	
	IN0 <= '0' ;
   IN1 <= '1';
	IN2 <= '1';
	IN3 <= '1';
	SEL <= "01";
	
	WAIT FOR 100NS;
	IN0 <= '0' ;
   IN1 <= '0';
	IN1 <= '1';
	IN1 <= '1';
	SEL <= "00";
	
	WAIT FOR 100NS;
	IN0 <= '0' ;
   IN1 <= '1';
   IN1 <= '1';
	IN1 <= '0';
	SEL <= "10";
	
	WAIT FOR 100NS;
	IN0 <= '1' ;
   IN1 <= '1';
	IN2 <= '1';
	IN3 <= '1';
	SEL <= "11";
	
	WAIT;
	END PROCESS;
	
	END STRUCTURE;