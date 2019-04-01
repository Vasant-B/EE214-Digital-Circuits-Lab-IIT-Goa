--A VHDL program for an array Multiplier
--designed by Vasant on 08 Feb 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE214.all;

entity ARRAY_MULTIPLIER1 is
	port (A, B : in std_logic_vector (3 downto 0);
		 P : out std_logic_vector (7 downto 0)   );
end ARRAY_MULTIPLIER1;


architecture STRUCTURE of ARRAY_MULTIPLIER1 is
	
	signal S1, S2, S3 : std_logic_vector (1 to 8);
	

begin
	
	
--stage 1
	U11 : AND_2 port map (A(3),B(1),S1(1));
	U12 : AND_2 port map (A(2),B(1),S1(2));
	U13 : AND_2 port map (A(1),B(1),S1(3));
	U14 : AND_2 port map (A(0),B(1),S1(4));
S1(5) <= '0';
	U15 : AND_2 port map (A(3),B(0),S1(6));
	U16 : AND_2 port map (A(2),B(0),S1(7));
	U17 : AND_2 port map (A(1),B(0),S1(8));
	U18 : AND_2 port map (A(0),B(0),P(0) );

	U1 : FOUR_BIT_ADDER1 port map (S1(8),S1(7),S1(6),S1(5),S1(4),S1(3),S1(2),S1(1), P(1),S2(8),S2(7),S2(6),S2(5));



--stage 2
	U21 : AND_2 port map (A(3),B(2),S2(1));
	U22 : AND_2 port map (A(2),B(2),S2(2));
	U23 : AND_2 port map (A(1),B(2),S2(3));
	U24 : AND_2 port map (A(0),B(2),S2(4));
	
	U2 : FOUR_BIT_ADDER1 port map (S2(8),S2(7),S2(6),S2(5),S2(4),S2(3),S2(2),S2(1), P(2),S3(8),S3(7),S3(6),S3(5));


--stage 3
	U31 : AND_2 port map (A(3),B(3),S3(1));
	U32 : AND_2 port map (A(2),B(3),S3(2));
	U33 : AND_2 port map (A(1),B(3),S3(3));
	U34 : AND_2 port map (A(0),B(3),S3(4));
	
	U3 : FOUR_BIT_ADDER1 port map (S3(8),S3(7),S3(6),S3(5),S3(4),S3(3),S3(2),S3(1), P(3),P(4),P(5),P(6),P(7) );


end STRUCTURE;