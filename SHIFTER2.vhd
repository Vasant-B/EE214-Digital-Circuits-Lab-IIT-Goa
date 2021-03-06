--A VHDL program for shifter 
--created by batch 8 on 22 Jan 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity SHIFTER2 is
	port (D : in std_logic_vector(1 downto 0);
			S0: in std_logic;
			S1: in std_logic;
			A3: in std_logic;
			A2: in std_logic;
			A1: in std_logic;
			A0: in std_logic;
			Y3: out std_logic;
			Y2: out std_logic;
			Y1: out std_logic;
			Y0: out std_logic);
			
			END SHIFTER2;
			


architecture STRUCTURE of SHIFTER2 is
	signal  IN0,IN1,IN2,IN3,OUT1: std_logic_vector(3 downto 0);
	signal  	SEL: std_logic_vector(1 downto 0);

begin
	IN0(0)<= A3;
	IN0(1)<= A2;
	IN3(1)<= '0';
	IN0(2)<= A1;
	IN3(2)<= '0';
	IN0(3)<= A0;
	SEL(0)<= S0;
	SEL(1)<= S1;
   Y0 <= OUT1(0);
   Y1 <= OUT1(1);
	Y2 <= OUT1(2);
	Y3 <= OUT1(3);

	
	U1: AND_2 (D,A2,IN1(0));
	U1: AND_2 (D,A1,IN2(0));
	U1: AND_2 (D,A0,IN3(0));
	U1: MUX_2_1 (A3,A2,D,IN1(1));
	U1: AND_2 (D,A0,IN2(1));
	U1: MUX_2_1 (A2,A0,D,IN1(2));
	U1: NOT_1 (D,S1);
	U1: AND_2 (S1,A3,IN2(2));
	U1: AND_2 (S1,A1,IN1(3));
	U1: AND_2 (S1,A2,IN2(3));
	U1: AND_2 (S1,A3,IN3(3));
   U1: MUX_16_4 (IN0,IN1,IN2,IN3,SEL,OUT1);
	end STRUCTURE;