--A VHDL program for a Tone Generator
--designed by Vasant on 19th march 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;


entity Tone_Gen2 is 
	port ( CLK : in std_logic; -- 10KHz clock
			--	Q : in std_logic_vector (2 downto 0); -- switches that indicate what tone i need to play
			--TONE_IN : in string; --Expected, SA1, RE1, GA1, MA1, PA1, DA1, NI1, SA2
			TONE_OUT : out std_logic -- The output is the square wave of frequency corresponding to the Tone in
	);
end Tone_Gen2;

architecture Funtionality of Tone_Gen2 is 
	
	signal CLK1HZ : std_logic := '0' ;
	signal C_1 : integer range 0 to 5000 ;
	signal CLK2HZ : std_logic := '0' ;
	signal C_2 : integer range 0 to 2500 ;
	signal E : std_logic := '0';
	signal SEL : integer range 0 to 7 := 0;
	signal Q : std_logic_vector (7 downto 0);
	
begin	
	
	process (CLK)
	begin
	if CLK'event and CLK = '1' then 
		if (C_2 = 2500) then 
			C_2 <= 0;
			CLK2HZ <= not CLK2HZ;
		else C_2 <= C_2 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_1 = 5000) then 
			C_1 <= 0;
			CLK1HZ <= not CLK1HZ;
		else C_1 <= C_1 + 1; 
		end if; 
	end if;
	
	end process;
	
	
	
	process (CLK1HZ,CLK2HZ)
	begin
	if CLK1HZ'event and CLK1HZ = '1' then 
		if (SEL = 7) then 
			SEL <= 0;
		else SEL <= SEL + 1; 
		end if; 
	end if;
	end process;
	
	U1 : Tone_Gen_Splitter port map (CLK, Q);
	
	--process (SEL)
	--begin
	--if CLK1HZ = '1' then
	--TONE_OUT <= Q(SEL);
	--end if;
	--end process;
	
	TONE_OUT <= Q(SEL);
	
end Funtionality;