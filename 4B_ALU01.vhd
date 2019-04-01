--A VHDL program for a 4 bit ALU 
--designed by vasant on 01 Feb 2018

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ee214.all;

entity F4B_ALU01 is
	port (A3, A2, A1, A0, B3, B2, B1, B0 : in std_logic;
		F2, F1, F0 : in std_logic;
		X7,X6,X5,X4,X3,X2,X1,X0: in std_logic );
end F4B_ALU01;

architecture STRUCTURE of F4B_ALU01 is

signal A, B : std_logic_vector (3 downto 0);
A(0) <= A0;
A(1) <= A1;
A(2) <= A2;
A(3) <= A3;
B(0) <= B0;
B(1) <= B1;
B(2) <= B2;
B(3) <= B3;

signal S0,S1,S2,S3,S4,S5,S6,S7 : std_logic_vector (7 downto 0);
-- Add, Sub, rightshift, leftshift
-- and, or, xor, compliment
signal Add1 : std_logic_vector (3 downto 0);
signal Subtract1 : std_logic_vector (3 downto 0);
signal rtshift_A : std_logic_vector (3 downto 0);
signal rtshift_B : std_logic_vector (3 downto 0);
signal ltshift_A : std_logic_vector (3 downto 0);
signal ltshift_B : std_logic_vector (3 downto 0);
signal shft : std_logic_vector (1 downto 0);
	shft <= "01";
signal and_of_AB_induvidually : std_logic_vector (3 downto 0);
signal or_of_AB_induvidually : std_logic_vector (3 downto 0);
signal xor_of_AB_induvidually : std_logic_vector (3 downto 0);
signal complementA, complementB : std_logic_vector (3 downto 0);	signal null1 :std_logic;
Signal RESULT : std_logic_vector (7 downto 0);


begin

--Adder
	U1_1 : FOUR_BIT_ADDER1 port map (A0,A1,A2,A3,B0,B1,B2,B3,Add1(0),Add1(1),Add1(2),Add1(3),null1);
	U1_2 : NIBBLE_TO_BYTE port map (Addl, S0);

--Subtractor
	U2_1 : NIBBLE_SUBTRACTOR port map (A, B, Subtract1);
	U2_2 : NIBBLE_TO_BYTE port map (Subtract1 , S1);

--right shift
	U3_1 : shifter_p1 port map (A, shft, 0, rtshift_A);
	U3_2 : shifter_p1 port map (B, shft, 0, rtshift_B);
	S2(0) <= rtshift_B(0);
	S2(1) <= rtshift_B(1);
	S2(2) <= rtshift_B(2);
	S2(3) <= rtshift_B(3);
	S2(4) <= rtshift_A(0);
S2(5) <= rtshift_A(1);
	S2(6) <= rtshift_A(2);
	S2(7) <= rtshift_A(3);


--left shift
	U4_1 : shifter_p1 port map (A, shft, 1, ltshift_A);
	U4_2 : shifter_p1 port map (B, shft, 1, ltshift_B);
	S3(0) <= ltshift_B(0);
	S3(1) <= ltshift_B(1);
	S3(2) <= ltshift_B(2);
	S3(3) <= ltshift_B(3);
	S3(4) <= ltshift_A(0);
S3(5) <= ltshift_A(1);
	S3(6) <= ltshift_A(2);
	S3(7) <= ltshift_A(3);


--and
	U5_1 : AND_2 port map (A(0),B(0), and_of_AB_induvidually(0) );
	U5_2 : AND_2 port map (A(1),B(1), and_of_AB_induvidually(1) );
	U5_3 : AND_2 port map (A(2),B(2), and_of_AB_induvidually(2) );
	U5_4 : AND_2 port map (A(3),B(3), and_of_AB_induvidually(3) );
	U5_5 : NIBBLE_TO_BYTE port map (and_of_AB_induvidually,S4);


--or
	U6_1 : OR_2 port map (A(0),B(0), or_of_AB_induvidually(0) );
	U6_2 : OR_2 port map (A(1),B(1), or_of_AB_induvidually(1) );
	U6_3 : OR_2 port map (A(2),B(2), or_of_AB_induvidually(2) );
	U6_4 : OR_2 port map (A(3),B(3), or_of_AB_induvidually(3) );
	U6_5 : NIBBLE_TO_BYTE port map (or_of_AB_induvidually,S5);


--xor
	U7_1 : XOR_P port map (A(0),B(0), xor_of_AB_induvidually(0) );
	U7_2 : XOR_P port map (A(1),B(1), xor_of_AB_induvidually(1) );
	U7_3 : XOR_P port map (A(2),B(2), xor_of_AB_induvidually(2) );
	U7_4 : XOR_P port map (A(3),B(3), xor_of_AB_induvidually(3) );
	U7_5 : NIBBLE_TO_BYTE port map (xor_of_AB_induvidually,S6);


--complement
	U8_1 : NOT_1 port map (B0, S7(0));
	U8_2 : NOT_1 port map (B1, S7(1));
	U8_3 : NOT_1 port map (B2, S7(2));
	U8_4 : NOT_1 port map (B3, S7(3));
	U8_5 : NOT_1 port map (A0, S7(4));
	U8_6 : NOT_1 port map (A1, S7(5));
	U8_7 : NOT_1 port map (A2, S7(6));
	U8_8 : NOT_1 port map (A3, S7(7));


--porting with a 8x8 MUX

	U9 : MUX_8_8 port map (S0,S1,S2,S3,S4,S5,S6,S7,F2,F1,F0, RESULT);

X0 <= RESULT(0);
X1 <= RESULT(1);
X2 <= RESULT(2);
X3 <= RESULT(3);
X4 <= RESULT(4);
X5 <= RESULT(5);
X6 <= RESULT(6);
X7 <= RESULT(7);

end STRUCTURE;



