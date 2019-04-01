--A VHDL program for a Tone Generator
--designed by Vasant on 19th march 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;


entity Tone_Gen_TTLS is 
	port ( CLK : in std_logic; -- 10KHz clock
			--	Q : in std_logic_vector (2 downto 0); -- switches that indicate what tone i need to play
			--TONE_IN : in string; --Expected, SA1, RE1, GA1, MA1, PA1, DA1, NI1, SA2
			TONE_OUT : out std_logic -- The output is the square wave of frequency corresponding to the Tone in
	);
end Tone_Gen_TTLS;

architecture Funtionality of Tone_Gen_TTLS is 
	
	signal CLK1HZ : std_logic := '0' ;
	signal C_1 : integer range 0 to 5000 ;
	signal CLK2HZ : std_logic := '0' ;
	signal C_2 : integer range 0 to 2500 ;
	signal CLK4HZ : std_logic := '0' ;
	signal C_4 : integer range 0 to 1250 ;
	signal E : std_logic := '0';
	signal SEL : integer range 0 to 89 := 0;
	signal Q : std_logic_vector (7 downto 0);
	signal Sargam : std_logic_vector (89 downto 0);
	
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
	
	if CLK'event and CLK = '1' then 
		if (C_4 = 1250) then 
			C_4 <= 0;
			CLK4HZ <= not CLK4HZ;
		else C_4 <= C_4 + 1; 
		end if; 
	end if;
	
	
	end process;
	
	
	
	process (CLK4HZ)
	begin
	if CLK4HZ'event and CLK4HZ = '1' then 
		if (SEL = 89) then 
			SEL <= 0;
		else SEL <= SEL + 1; 
		end if; 
	end if;
	end process;
	
	U1 : Tone_Gen_Splitter port map (CLK, Q);
	
	-- twinkle twinkle little star
	Sargam(0) <= Q(0);
	Sargam(1) <= '0';
	Sargam(2) <= Q(0);
	Sargam(3) <= '0';
	Sargam(4) <= Q(4);
	Sargam(5) <= '0';
	Sargam(6) <= Q(4);
	Sargam(7) <= '0';
	Sargam(8) <= Q(5);
	Sargam(9) <= '0';
	Sargam(10) <= Q(5);
	Sargam(11) <= '0';
	Sargam(12) <= Q(4);
	Sargam(13) <= '0';
	Sargam(14) <= '0';
	
	--how i wonder what you are
	Sargam(15) <= Q(3);
	Sargam(16) <= '0';
	Sargam(17) <= Q(3);
	Sargam(18) <= '0';
	Sargam(19) <= Q(2);
	Sargam(20) <= '0';
	Sargam(21) <= Q(2);
	Sargam(22) <= '0';
	Sargam(23) <= Q(1);
	Sargam(24) <= '0';
	Sargam(25) <= Q(1);
	Sargam(26) <= '0';
	Sargam(27) <= Q(0);
	Sargam(28) <= '0';
	Sargam(29) <= '0';
	
	--up above the world so high
	Sargam(30) <= Q(4);
	Sargam(31) <= '0';
	Sargam(32) <= Q(4);
	Sargam(33) <= '0';
	Sargam(34) <= Q(3);
	Sargam(35) <= '0';
	Sargam(36) <= Q(3);
	Sargam(37) <= '0';
	Sargam(38) <= Q(2);
	Sargam(39) <= '0';
	Sargam(40) <= Q(2);
	Sargam(41) <= '0';
	Sargam(42) <= Q(1);
	Sargam(43) <= '0';
	Sargam(44) <= '0';
	
	--like a diamond in the sky
	Sargam(45) <= Q(4);
	Sargam(46) <= '0';
	Sargam(47) <= Q(4);
	Sargam(48) <= '0';
	Sargam(49) <= Q(3);
	Sargam(50) <= '0';
	Sargam(51) <= Q(3);
	Sargam(52) <= '0';
	Sargam(53) <= Q(2);
	Sargam(54) <= '0';
	Sargam(55) <= Q(2);
	Sargam(56) <= '0';
	Sargam(57) <= Q(1);
	Sargam(58) <= '0';
	Sargam(59) <= '0';
	
	-- twinkle twinkle little star
	Sargam(60) <= Q(0);
	Sargam(61) <= '0';
	Sargam(62) <= Q(0);
	Sargam(63) <= '0';
	Sargam(64) <= Q(4);
	Sargam(65) <= '0';
	Sargam(66) <= Q(4);
	Sargam(67) <= '0';
	Sargam(68) <= Q(5);
	Sargam(69) <= '0';
	Sargam(70) <= Q(5);
	Sargam(71) <= '0';
	Sargam(72) <= Q(4);
	Sargam(73) <= '0';
	Sargam(74) <= '0';
	
	--how i wonder what you are
	Sargam(75) <= Q(3);
	Sargam(76) <= '0';
	Sargam(77) <= Q(3);
	Sargam(78) <= '0';
	Sargam(79) <= Q(2);
	Sargam(80) <= '0';
	Sargam(81) <= Q(2);
	Sargam(82) <= '0';
	Sargam(83) <= Q(1);
	Sargam(84) <= '0';
	Sargam(85) <= Q(1);
	Sargam(86) <= '0';
	Sargam(87) <= Q(0);
	Sargam(88) <= '0';
	Sargam(89) <= '0';
	
	--process (CLK2HZ, SEL)
	--begin
	--if CLK2HZ = '1' then
	TONE_OUT <= Sargam(SEL);
	--end if;
	--end process;
	
	
	
end Funtionality;