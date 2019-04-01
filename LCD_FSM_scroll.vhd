--A VHDL program for displaying IIT GOA /n EE214 on JHD LCD
--designed based on the resource provided at ( ftp://10.250.8.18/EE214%20CS254%20Lab%20Resources/Experiments/LCDControlMadeEasy.pdf )

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;


entity LCD_FSM_scroll is  --Entity declaration
	port(
	CLK1k : in std_logic;  --Input clock
	RSTN : in std_logic;  --Active low reset
	D : out std_logic_vector (7 downto 0);  --D7 – D0 outputs
	RS, RW, EN : out std_logic);  --Control outputs
end LCD_FSM_scroll;


architecture FUNCTIONALITY of LCD_FSM_scroll is

	type STATE_TYPE is (S_scr0, S_scr1, S_scr2, S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, IDLE); --State data type definition. Write as many states as you need.
	type ARR_TYPE4 is array (0 to 4) of std_logic_vector(7 downto 0);
	type ARR_TYPE6 is array (0 to 6) of std_logic_vector(7 downto 0); --Definition of arrays of length 5 and 7. Define more data types as per your needs.	
	
	signal Q, QPLUS  : STATE_TYPE; --Present and next states
	signal CNT_CMD   : integer range 0 to 5; --Counters as array indices
	signal CNT_DATA  : integer range 0 to 7;
--	signal CNT_CMD1  : integer range 0 to 1;
	signal CNT_DATA1 : integer range 0 to 5; --Declare more signals as per your need.
	signal CNT_CMDs  : integer range 0 to 16;
	
	constant LCD_CMD   : ARR_TYPE4 := (X"38", X"01", X"0E", X"80", X"06"); --Command to initialize the LCD display
	constant LCD_DATA  : ARR_TYPE6 := (X"49", X"49", X"54", X"20", X"47", X"4F", X"41"); --Find out the ascii codes corresponding to “IIT GOA”
	constant LCD_CMD1  : std_logic_vector(7 downto 0) := X"C0"; --Command to move the cursor to the second 
	constant LCD_DATA1 : ARR_TYPE4 := (X"45", X"45", X"32", X"31", X"34"); --Use this array to display EE214/CS254
	constant LCD_CMDs  : std_logic_vector(7 downto 0) := X"1C";
	--Declare more constants for the scrolling functionality and to display the count etc.
	
	signal CLK : std_logic :='0';
	signal C_1 : integer range 0 to 50;

begin

	process(Q)								 --Process for next state assignment
	begin
	
	case Q is
	
	when S0 => --S0 to S2 used for 5 instructions
		if (CNT_CMD < 5) then
			QPLUS <= S1;
			D <= LCD_CMD(CNT_CMD); 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
		else
			QPLUS <= S_scr0;
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
			
	when S_scr0 =>           --used for scrolling from left to right
		if (CNT_CMDs = 0) then
			QPLUS <= S_scr2;
			D <= LCD_CMDs; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
		elsif (CNT_CMDs < 16) and (CNT_CMDs > 0) then
			QPLUS <= S_scr1;
			D <= LCD_CMDs; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
		else
			QPLUS <= IDLE;
		end if;
	
	when S_scr1 =>
			QPLUS <= S_scr2;
			D <= LCD_CMDs; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '1';
	
	when S_scr2 =>
			QPLUS <= S3;
			D <= LCD_CMDs; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
	
	when S3 => 								--S3 to S5 used for writing “IIT GOA”
		if (CNT_DATA < 7) then
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
	
	when S6 => 		--S6 to S8 for the instruction to jump to second line
	--	if (CNT_CMD1 < 1) then
			QPLUS <= S7;
			D <= LCD_CMD1; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
	--	else
	--		QPLUS <= S9;
	--	end if;
	
	when S7 =>
			QPLUS <= S8;
			D <= LCD_CMD1; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '1';
	
	when S8 =>
		--	QPLUS <= S6;
			QPLUS <= S9;
			D <= LCD_CMD1; 
			RS <= '0'; 
			RW <= '0'; 
			EN <= '0';
	
	when S9 => 								--S9 to S11 for writing EE214 or CS254
	if (CNT_DATA1 < 5) then
			QPLUS <= S10;
			D <= LCD_DATA1(CNT_DATA1); 
			RS <= '1'; 
			RW <= '0'; 
			EN <= '0';
		else
			QPLUS <= S_scr0;
		end if;
	
	when S10 =>
			QPLUS <= S11;
			D <= LCD_DATA1(CNT_DATA1); 
			RS <= '1'; 
			RW <= '0'; 
			EN <= '1';
	
	when S11 =>
			QPLUS <= S9;
			D <= LCD_DATA1(CNT_DATA1); 
			RS <= '1'; 
			RW <= '0'; 
			EN <= '0';
			
	--when S12 =>
	--		QPLUS <= IDLE;
	
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
		if RSTN = '0' then
			Q <= S0; 
			CNT_CMD <= 0; 
			CNT_DATA <= 0; 
			CNT_DATA1 <= 0;
		elsif (CLK'event and CLK = '1') then
			Q <= QPLUS;
			
			if Q = S2 then --what are these counters used for?
				CNT_CMD <= CNT_CMD + 1;
			end if;
			
			if Q = S5 then
				CNT_DATA <= CNT_DATA + 1;
			end if;
			
			if Q = S_scr2 then
				CNT_CMDs <= CNT_CMDs + 1;
			end if;
			
		--	if Q = S8 then
		--		CNT_CMD1 <= CNT_CMD1 + 1;

			if Q = S11 then
				CNT_DATA1 <= CNT_DATA1 + 1;
			end if;

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
	end if;
	end process;


end FUNCTIONALITY;