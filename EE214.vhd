--A VHDL program for a LIBRARY
--Updated by Vasant on 08 Feb 2018

library ieee;
use ieee.std_logic_1164.all;

package EE214 is

   component AND_2 is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O2 : out std_logic);
	end component;
	 
	component NOT_1 is
	port (I1 : in std_logic;
			O1 : out std_logic);
   	end component;
	
	component OR_2 is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O2 : out std_logic);
   	end component;
	
	component NOR_2 is 
	port (I1 : in std_logic;
			I2 : in std_logic;
			O1 : out std_logic);
   	end component;
	
	component NAND_2 is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O1 : out std_logic);
   	end component;

	component XOR_P is
	port (I1 : in std_logic;
			I2 : in std_logic;
			O1 : out std_logic);
	end component;

	component HALF_ADDER1 is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 S1 : out std_logic;
		 C1 : out std_logic);
	end component;

	component FULL_ADDER1 is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 I3 : in std_logic;
		 S1 : out std_logic;
		 C1 : out std_logic);
	end component;

	component FOUR_BIT_ADDER1 is
	port (a1, a2, a3, a4, b1, b2, b3, b4 : in std_logic;
		 S0, S1, S2, S3, C3 : out std_logic );
	end component;

	component TWOS_COMPLIMENT1 is
	port (a1, a2, a3, a4 : in std_logic;
		 b1, b2, b3, b4, c : out std_logic );
        end component;

	component MUX_2_1_P is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			SEL : in std_logic;
			OUT1: out std_logic);
	end component;

	component MUX_4_1 is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			IN2: in std_logic;
			IN3: in std_logic;
			SEL : in std_logic_vector(1 downto 0);
			OUT1: out std_logic);
	end component;

	component MUX_16_4 is
	port (IN0 : in std_logic_vector(3 downto 0);
			IN1: in std_logic_vector(3 downto 0);
			IN2: in std_logic_vector(3 downto 0);
			IN3: in std_logic_vector(3 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			OUT1: out std_logic_vector(3 downto 0));
	end component;

	component HALF_SUBTRACTOR_2P is
	port (I1 : in std_logic;
		 I2 : in std_logic;
		 D1 : out std_logic;
		 Bout : out std_logic);
	end component;

	component FULL_SUBTRACTOR_3 is
	port (X1 : in std_logic;
		 Y1 : in std_logic;
		 Bin : in std_logic;
		 D : out std_logic;
		 Bout : out std_logic);
	end component;

	component MUX_4_1b is
	port (IN0 : in std_logic;
			IN1: in std_logic;
			IN2: in std_logic;
			IN3: in std_logic;
			SEL1, SEL0 : in std_logic;
			OUT1: out std_logic);
	end component;

	component MUX_8_1b is
	port (IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7: in std_logic;
		F0, F1, F2 : in std_logic;
		OUT1: out std_logic);
	end component;

	component NIBBLE_SUBTRACTOR is
	port (A,B : in std_logic_vector (3 downto 0);
		 D : out std_logic_vector (3 downto 0));
end component;

component NIBBLE_TO_BYTE is
	port (A : in std_logic_vector (3 downto 0);
		OUT1 : out std_logic_vector (7 downto 0) );
	end component;

	component MUX_2_8 is
	port (IN0, IN1 : in std_logic_vector (7 downto 0);
			SEL : in std_logic;
			OUT1: out std_logic_vector (7 downto 0));
end component;

	component MUX_4_8 is
	port (IN0,IN1,IN2,IN3 : in std_logic_vector (7 downto 0);
		SEL1, SEL0 : in std_logic;
		OUT1: out std_logic_vector (7 downto 0) );
	end component;

	component MUX_8_8 is
	port (IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7: in std_logic_vector (7 downto 0);
		F2, F1, F0 : in std_logic;
		OUT1: out std_logic_vector (7 downto 0) );
	end component;

	component HALF_ADDER_2_4 is
	port (A, B: in std_logic_vector (3 downto 0);
		 SUM1 : out std_logic;
		 C : out std_logic_vector (3 downto 0) );
	end component;

	component FULL_ADDER_3_4 is
	port (A, B, C: in std_logic_vector (3 downto 0);
		 SUM1 : out std_logic;
		 CARRY1 : out std_logic_vector (3 downto 0) );
	end component;


	component shifter_p1 is 
	port (A : in std_Logic_vector (3 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			D : in std_logic;
			OUT1: out std_logic_vector(3 downto 0));	
	end component;

	component AND_3 is
	port (I1, I2, I3 : in std_logic;
			O1 : out std_logic);
	end component;

	component AND_4 is
	port (I1, I2, I3, I4 : in std_logic;
			O1 : out std_logic);
	end component;

	component OR_3 is
	port (I1, I2, I3 : in std_logic;
			O1 : out std_logic);
	end component;

	component OR_4 is
	port (I1, I2, I3, I4 : in std_logic;
			O1 : out std_logic);
	end component;

	component F4B_ALU01 is
	port (A3, A2, A1, A0, B3, B2, B1, B0 : in std_logic;
		F2, F1, F0 : in std_logic;
		X7,X6,X5,X4,X3,X2,X1,X0: out std_logic );
	end component;
	
	component SUBRACTOR1 is
	port (a1, a2, a3, a4 : in std_logic;
		   b1, b2, b3, b4 : in std_logic;
		   c1, c2, c3, c4 : out std_logic);
	end component;

	component ARRAY_MULTIPLIER1 is
	port (A, B : in std_logic_vector (3 downto 0);
		 P : out std_logic_vector (7 downto 0)   );
	end component;
	
	component D_FF is
	port(D : in std_logic;
		CLK : in std_logic;
		PREN : in std_logic;
		CLRN : in std_logic;
		Q : buffer std_logic;
		QN : out std_logic);
	end component;

	component CLKBY4 is
	port (CLK : in std_logic;
			PREN, CLRN : inout std_logic;
			E : inout std_logic;
			QF   : out std_logic_vector (1 downto 0));
	end component;
	
	component BCD_UPCOUNTER02 is
	port (CLK  : in std_logic;
			RSTN : in std_logic;
			E    : in std_logic;
			Q    : inout std_logic_vector(3 downto 0)	);
	end component;
	
	component BCD_DOWNCOUNTER04 is
	port (CLK : in std_logic;
			E, RSTN, LDN : in std_logic;
			LOAD_in : in std_logic_vector (3 downto 0);
			Cout : out std_logic;
			Q    : inout std_logic_vector(3 downto 0)	);
	end component;
	
	component CLKBY4_1 is
	port (CLK : in std_logic;
			RSTN : in std_logic;
			E : in std_logic;
			QF : inout std_logic_vector (1 downto 0));
	end component;
	
	component COUNTER_SYNC_Ganna is -- Declaration of the down counter
		port(CLK : in std_logic; -- Clock input of the counter
				EN : in std_logic; -- Enable input of the counter
				RSTN : in std_logic; -- Active low reset input of the counter
				LDN : in std_logic; -- Active low load input of the counter
				D : in std_logic_vector(3 downto 0); -- Load value for LDN
				C : out std_logic; -- Carry output from the counter
				Q : inout std_logic_vector(3 downto 0) := "1001");-- Output of the counter
	end component;
		
	component BCD_DOWNCOUNTER05 is
	port (CLK : in std_logic;
			E, RSTN, LDN : in std_logic;
			LOAD_in : in std_logic_vector (3 downto 0) ;
			Cout : out std_logic;
			Q    : inout std_logic_vector(3 downto 0)	);
	end component;
	
	component FD_BCD_DNCTR_1 is
	port (CLK : in std_logic;
			RSTN : in std_logic;
			LDN : in std_logic;
			L3, L2, L1, L0 : in std_logic_vector (3 downto 0);
			Q   : inout std_logic_vector(3 downto 0);
			Overflow : inout std_logic);
	end component;
		
	component D_LATCH is								-- Entity declaration
	port(	D : in std_logic;					-- Data input of the D latch
			LTCH : in std_logic;				-- Latch input of the D latch
			Q : buffer std_logic;			-- Q output of the D latch
			QN : out std_logic);				-- Q_bar output of the D latch
	end component;
	
	component FD_MEM01 is
	port (LOAD_in : in std_logic_vector (3 downto 0);
			LOAD_SEL : in std_logic_vector (1 downto 0);
			L3, L2, L1, L0 : out std_logic_vector (3 downto 0)  );
	end component;
	
	component CLKDIV_1 is
	port (CLK : in std_logic;  --1KHZ
			RSTN : in std_logic; 
			E : in std_logic;
			Q : inout std_logic );
	end component;
	
	component Tone_Gen_Splitter is 
	port ( CLK : in std_logic; -- 10KHz clock
			SL_OUT : out std_logic_vector (7 downto 0) --splitted output SL_OUT (0) is SA1,
			);
	end component;
	
end EE214;
