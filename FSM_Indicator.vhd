--A VHDL program for displaying the indicator of a car
--designed by Vasant on 6th april 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.EE214.all;

entity FSM_Indicator is
	port(CLKin, L, R, Dist : in std_logic;
			RSTN : in std_logic; --active low
			LA, LB, LC, LD, RA, RB, RC, RD : out std_logic --_vector (7 downto 0) 
			);
end FSM_Indicator;


architecture FUNTIONALITY of FSM_Indicator is
	
	type STATE_TYPE is (IDLE, S1, S2, S3, S_Dis);
	signal Q, QPLUS : STATE_TYPE;
	signal CLK : std_logic := '0' ;
	signal C_1 : integer range 0 to 5000;

	
	
begin
	
	process (Q)
	begin
	
	case Q is
	
	when IDLE =>
		if Dist = '1' then
					QPLUS <= S_Dis;
		else
			if (L or R) = '0' then
					QPLUS <= IDLE;
			else
					QPLUS <= S1;
			end if;
		end if;
			
				LD <= '0'; LC <= '0'; LB <= '0'; LA <= '0';
				RA <= '0'; RB <= '0'; RC <= '0'; RD <= '0';
			
			
	when S1 =>
		QPLUS <= S2;
			if (L = '1') and (R = '0') then
				LD <= '0'; LC <= '0'; LB <= '0'; LA <= '1';
				RA <= '0'; RB <= '0'; RC <= '0'; RD <= '0';
			elsif (L = '0') and (R = '1') then
				LD <= '0'; LC <= '0'; LB <= '0'; LA <= '0';
				RA <= '1'; RB <= '0'; RC <= '0'; RD <= '0';
			elsif (L = '1') and (R = '1') then
				LD <= '0'; LC <= '0'; LB <= '0'; LA <= '1';
				RA <= '0'; RB <= '0'; RC <= '0'; RD <= '1';
			end if;
	
	when S2 =>
		QPLUS <= S3;
			if (L = '1') and (R = '0') then
				LD <= '1'; LC <= '0'; LB <= '1'; LA <= '0';
				RA <= '0'; RB <= '0'; RC <= '0'; RD <= '0';
			elsif (L = '0') and (R = '1') then
				LD <= '0'; LC <= '0'; LB <= '0'; LA <= '0';
				RA <= '0'; RB <= '1'; RC <= '0'; RD <= '1';
			elsif (L = '1') and (R = '1') then
				LD <= '1'; LC <= '0'; LB <= '1'; LA <= '0';
				RA <= '0'; RB <= '1'; RC <= '0'; RD <= '1';
			end if;
			
	when S3 =>
		QPLUS <= IDLE;
			if (L = '1') and (R = '0') then
				LD <= '1'; LC <= '1'; LB <= '0'; LA <= '0';
				RA <= '0'; RB <= '0'; RC <= '1'; RD <= '1';
			elsif (L = '0') and (R = '1') then
				LD <= '0'; LC <= '0'; LB <= '0'; LA <= '0';
				RA <= '0'; RB <= '0'; RC <= '1'; RD <= '1';
			elsif (L = '1') and (R = '1') then
				LD <= '1'; LC <= '1'; LB <= '0'; LA <= '0';
				RA <= '0'; RB <= '0'; RC <= '1'; RD <= '1';
			end if;
			
	when S_Dis =>
		QPLUS <= IDLE;
			LD <= '1'; LC <= '1'; LB <= '1'; LA <= '1';
			RA <= '1'; RB <= '1'; RC <= '1'; RD <= '1';
	
	end case;
	end process;
	
	
	process(RSTN, CLK) --Process for reset and state change
	begin
		if RSTN = '0' then
			Q <= IDLE; 
		elsif (CLK'event and CLK = '1') then
			Q <= QPLUS;
		end if;
	end process;
	
	process (CLKin)
	begin
	if CLKin'event and CLKin = '1' then 
		if (C_1 = 1) then 
				C_1 <= 0;
				CLK <= not CLK;
		else C_1 <= C_1 + 1; 
		end if;
	end if;
	end process;

end FUNTIONALITY;