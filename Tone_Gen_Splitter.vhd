--A VHDL program for a Tone Generator
--designed by Vasant on 19th march 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;


entity Tone_Gen_Splitter is 
	port ( CLK : in std_logic; -- 10KHz clock
			--CLK1HZ: in std_logic;-- 1  Hz clock
			--Q : in std_logic_vector (2 downto 0); -- switches that indicate what tone i need to play
			--TONE_IN : in string; --Expected, SA1, RE1, GA1, MA1, PA1, DA1, NI1, SA2
			--TONE_OUT : out std_logic -- The output is the square wave of frequency corresponding to the Tone in
			SL_OUT : out std_logic_vector (7 downto 0) --splitted output
	);
end Tone_Gen_Splitter;
	


architecture Funtionality of Tone_Gen_Splitter is 
	
--	signal C_SA1, C_RE1, C_GA1, C_MA1, C_PA1, C_DA1, C_NI1, C_SA2 : integer range 0 to 21;
	signal C_SA1 : integer range 0 to 21;
	signal C_RE1 : integer range 0 to 19;
	signal C_GA1 : integer range 0 to 17;
	signal C_MA1 : integer range 0 to 16;
	signal C_PA1 : integer range 0 to 14;
	signal C_DA1 : integer range 0 to 13;
	signal C_NI1 : integer range 0 to 11;
	signal C_SA2 : integer range 0 to 10;
	signal CNT_INC : integer range 0 to 7;
	
	--type TUNE is (SA1, RE1, GA1, MA1, PA1, DA1, NI1, SA2);
	--signal TONE_OUT : TUNE;
	
	signal SA1, RE1, GA1, MA1, PA1, DA1, NI1, SA2 : std_logic := '0';
	
	
begin	
	
	process (CLK)
	begin
	
	if CLK'event and CLK = '1' then 
		if (C_SA1 = 21) then 
			C_SA1 <= 0;
			SA1 <= not SA1;
		else C_SA1 <= C_SA1 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_RE1 = 19) then 
			C_RE1 <= 0;
			RE1 <= not RE1;
		else C_RE1 <= C_RE1 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_GA1 = 17) then 
			C_GA1 <= 0;
			GA1 <= not GA1;
		else C_GA1 <= C_GA1 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_MA1 = 16) then 
			C_MA1 <= 0;
			MA1 <= not MA1;
		else C_MA1 <= C_MA1 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_PA1 = 14) then 
			C_PA1 <= 0;
			PA1 <= not PA1;
		else C_PA1 <= C_PA1 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_DA1 = 13) then 
			C_DA1 <= 0;
			DA1 <= not DA1;
		else C_DA1 <= C_DA1 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_NI1 = 11) then 
			C_NI1 <= 0;
			NI1 <= not NI1;
		else C_NI1 <= C_NI1 + 1; 
		end if; 
	end if;
	
	if CLK'event and CLK = '1' then 
		if (C_SA2 = 10) then 
			C_SA2 <= 0;
			SA2 <= not SA2;
		else C_SA2 <= C_SA2 + 1; 
		end if; 
	end if;
	
	end process;
	
	
	SL_OUT(0) <= SA1;
	SL_OUT(1) <= RE1;
	SL_OUT(2) <= GA1;
	SL_OUT(3) <= MA1;
	SL_OUT(4) <= PA1;
	SL_OUT(5) <= DA1;
	SL_OUT(6) <= NI1;
	SL_OUT(7) <= SA2;
	
	
end Funtionality;