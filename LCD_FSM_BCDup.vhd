--A VHDL program for displaying IIT GOA /n EE214 on JHD LCD
--designed based on the resource provided at ( ftp://10.250.8.18/EE214%20CS254%20Lab%20Resources/Experiments/LCDControlMadeEasy.pdf )

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;


entity LCD_FSM_BCDup is  --Entity declaration
	port(
	CLK1k : in std_logic;  --Input clock
	RSTN : in std_logic;  --Active low reset
	D : out std_logic_vector (7 downto 0);  --D7 – D0 outputs
	RS, RW, EN : out std_logic);  --Control outputs
end LCD_FSM_BCDup;


architecture FUNCTIONALITY of LCD_FSM_BCDup is

	type STATE_TYPE is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, IDLE, SH0, SH1, SH2); --State data type definition. Write as many states as you need.
	type ARR_TYPE4 is array (0 to 4) of std_logic_vector(7 downto 0);
	type ARR_TYPE2 is array (0 to 2) of std_logic_vector(7 downto 0);	
	type ARR_TYPE1 is array (0 to 1) of std_logic_vector(7 downto 0);
	
	
	signal Q, QPLUS  : STATE_TYPE; --Present and next states
	signal CNT_CMD   : integer range 0 to 5; --Counters as array indices
	signal CNT_DATA  : integer range 0 to 3;
	signal CNT_CMD1  : integer range 0 to 1 := 0 ;
	
	signal Y2, Y1, Y0: integer range 0 to 9 := 0;
	signal X, Y, Z   : std_logic_vector(3 downto 0);

	constant LCD_CMD : ARR_TYPE4 := (X"38", X"01", X"0C", X"80", X"06"); --Command to initialize the LCD display
	
	signal LCD_DATA  : ARR_TYPE2 := (X"30", X"30", X"30");
	constant LCD_CMD1  : std_logic_vector(7 downto 0) := X"80"; --Command to move the cursor to home
	--constant LCD_DATA1 : ARR_TYPE4 := (X"45", X"45", X"32", X"31", X"34"); --Use this array to display EE214/CS254
	--Declare more constants for the scrolling functionality and to display the count etc.
	
	signal CLK : std_logic :='0';
	signal C_1 : integer range 0 to 50;
	signal CLK1Hz : std_logic :='0';
	signal C_01 : integer range 0 to 500;

begin

	process(Q)								 --Process for next state assignment
	begin
	
	case Q is
	
	when S0 =>                --S0 to S2 used for 5 instructions
		if (CNT_CMD < 5) then
			QPLUS <= S1;
			D <= LCD_CMD(CNT_CMD); 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
		else
			QPLUS <= SH0;
		end if;
	
	when S1 =>
			QPLUS <= S2;
			D <= LCD_CMD(CNT_CMD); 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '1';
	
	when S2 =>
			QPLUS <= S0;
			D <= LCD_CMD(CNT_CMD); 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
	
	when SH0 =>                --SH0 to SH2 used for moving cursor to home
		--if (CNT_CMD < 1) then
			QPLUS <= SH1;
			D <= LCD_CMD1; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
		--else
		--	QPLUS <= S3;
		--end if;
	
	when SH1 =>
			QPLUS <= SH2;
			D <= LCD_CMD1; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '1';
	
	when SH2 =>
			QPLUS <= S3;
			D <= LCD_CMD1; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
	
	
	when S3 => 								--S3 to S5 used for writing the count	
		if (CNT_DATA < 3) then
			QPLUS <= S4;
			D <= LCD_DATA(CNT_DATA); 
			RS <= '1'; 
			RW <= '0'; 
			EN <= '0';
		else
			QPLUS <= S6;
		end if;
	
	when S4 =>
			QPLUS <= S5;
			D <= LCD_DATA(CNT_DATA); 
			RS <= '1'; 
			RW <= '0'; 
			EN <= '1';
	
	when S5 =>
			QPLUS <= S3;
			D <= LCD_DATA(CNT_DATA); 
			RS <= '1'; 
			RW <= '0'; 
			EN <= '0';
	
	when S6 => 		--S6 to increment and shift to S0
			QPLUS <= SH0;

	when IDLE =>
			QPLUS <= IDLE;
			D <= X"00"; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
	
	when others =>
			QPLUS <= S0;
			D <= X"00"; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';

	end case;
	end process;

	
	
	process(RSTN, CLK) --Process for reset and state change
	begin
		--if RSTN = '0' then
		--	Q <= S0; 
		--	CNT_CMD <= 0; 
		--	CNT_DATA <= 0; 
		--elsif (CLK'event and CLK = '1') then
		if (CLK'event and CLK = '1') then
			Q <= QPLUS;
			
			if Q = S2 then --what are these counters used for?
				CNT_CMD <= CNT_CMD + 1;
			end if;
			
			if Q = SH2 then
				CNT_CMD1 <= CNT_CMD1 + 1;
			end if;
			
			if Q = S5 then
				CNT_DATA <= CNT_DATA + 1;
			end if;
			
			if Q = S6 then
				
				CNT_DATA <= 0;
				CNT_CMD1 <= 0;
				
				if (Y0 < 9) then
					Y0 <= Y0 + 1;
				elsif (Y0 = 9) then
					Y0 <= 0;
					if (Y1 < 9) then
						Y1 <= Y1 + 1;
					elsif (Y1 = 9) then
						Y1 <= 0;
						if (Y2 < 9) then
							Y2 <= Y2 + 1;
						elsif (Y2 = 9) then
							Y2 <= 0;
						end if;--y2
					end if;--y1
				end if;--y0
						
			end if;--Q=S6
			

		end if;

	end process;
	
	
	process (CLK1k)  -- to get the 10Hz clock
	begin
	if CLK1k'event and CLK1k = '1' then 
	
		if (C_1 = 50) then 
			C_1 <= 0;
			CLK <= not CLK;
		else C_1 <= C_1 + 1; 
		end if; 
		
		if (C_01 = 500) then 
			C_01 <= 0;
			CLK1Hz <= not CLK1Hz;
		else C_01 <= C_01 + 1; 
		end if;
		
	end if;
	
	
	end process;

	process (CLK1Hz)
	begin
	X <= std_logic_vector(to_unsigned(Y2, 4));
	Y <= std_logic_vector(to_unsigned(Y1, 4));
	Z <= std_logic_vector(to_unsigned(Y0, 4));
	LCD_DATA(2) <= ('0', '0', '1', '1', Z(3), Z(2), Z(1), Z(0));
	LCD_DATA(1) <= ('0', '0', '1', '1', Y(3), Y(2), Y(1), Y(0));
	LCD_DATA(0) <= ('0', '0', '1', '1', X(3), X(2), X(1), X(0));
	end process;
	
	
end FUNCTIONALITY;