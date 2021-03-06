LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dizzy IS
	PORT( score: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  diz0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		  diz1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY;

ARCHITECTURE dizplay of dizzy IS

COMPONENT char_7seg
PORT ( s : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END COMPONENT;

COMPONENT comparator9 IS
port(num: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
RES: OUT STD_LOGIC);
END COMPONENT;

COMPONENT circA IS
port(numv: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
outA: OUT STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

SIGNAL sOut1, sOut2: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL sOUT: STD_LOGIC;
BEGIN

COMP: comparator9 PORT MAP (score(3 DOWNTO 0), sOUT);
circ: circA PORT MAP (score(3 DOWNTO 0), sOut1(3 downto 0));
------------------------------------------------------------

		sOut2(0) <= (NOT(sOUT) AND score(0)) OR (sOUT AND sOut1(0));
		sOut2(1) <= (NOT(sOUT) AND score(1)) OR (sOUT AND sOut1(1));
		sOut2(2) <= (NOT(sOUT) AND score(2)) OR (sOUT AND sOut1(2));
		sOut2(3) <= (NOT(sOUT) AND score(3)) OR (sOUT AND sOut1(3));

H0: char_7seg PORT MAP (sOut2(3 downto 0), diz0);
---------------------------------
H1: char_7seg PORT MAP (("000"& sOUT), diz1);

END ARCHITECTURE;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY char_7seg IS

GENERIC(   u:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000001";
			  v:STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001111";
			  w:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010";
			  x:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110";
			  y:STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001100";
			  z:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100";
			  a:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100000";
			  b:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001110";
			  c:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
			  d:STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000100"
			  );
			  
			  
PORT ( s : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END char_7seg;


ARCHITECTURE Behavior OF char_7seg IS
signal sMult1    : std_logic_vector(6 downto 0) := (others=>'0');
signal sMult2    : std_logic_vector(6 downto 0) := (others=>'0');
signal sMult3    : std_logic_vector(6 downto 0) := (others=>'0');
signal sMult4    : std_logic_vector(6 downto 0) := (others=>'0');
signal sMult1_1    : std_logic_vector(6 downto 0) := (others=>'0');
signal sMult1_2    : std_logic_vector(6 downto 0) := (others=>'0');
signal sMult2_1    : std_logic_vector(6 downto 0) := (others=>'0');
signal sMult2_2    : std_logic_vector(6 downto 0) := (others=>'0');
BEGIN
		smult1(0) <= (NOT(s(0)) AND u(0)) OR (s(0) AND v(0));
		smult1(1) <= (NOT(s(0)) AND u(1)) OR (s(0) AND v(1));
		smult1(2) <= (NOT(s(0)) AND u(2)) OR (s(0) AND v(2));
		smult1(3) <= (NOT(s(0)) AND u(3)) OR (s(0) AND v(3));
		smult1(4) <= (NOT(s(0)) AND u(4)) OR (s(0) AND v(4));
		smult1(5) <= (NOT(s(0)) AND u(5)) OR (s(0) AND v(5));
		smult1(6) <= (NOT(s(0)) AND u(6)) OR (s(0) AND v(6));
---------------------------------------------------------------------	
		smult2(0) <= (NOT(s(0)) AND w(0)) OR (s(0) AND x(0));
	   smult2(1) <= (NOT(s(0)) AND w(1)) OR (s(0) AND x(1));
		smult2(2) <= (NOT(s(0)) AND w(2)) OR (s(0) AND x(2));
	   smult2(3) <= (NOT(s(0)) AND w(3)) OR (s(0) AND x(3));
		smult2(4) <= (NOT(s(0)) AND w(4)) OR (s(0) AND x(4));
	   smult2(5) <= (NOT(s(0)) AND w(5)) OR (s(0) AND x(5));
		smult2(6) <= (NOT(s(0)) AND w(6)) OR (s(0) AND x(6));
----------------------------------------------------------------------
		smult1_1(0) <= (NOT(s(1)) AND smult1(0)) OR (s(1) AND smult2(0));
		smult1_1(1) <= (NOT(s(1)) AND smult1(1)) OR (s(1) AND smult2(1));
		smult1_1(2) <= (NOT(s(1)) AND smult1(2)) OR (s(1) AND smult2(2));
		smult1_1(3) <= (NOT(s(1)) AND smult1(3)) OR (s(1) AND smult2(3));
		smult1_1(4) <= (NOT(s(1)) AND smult1(4)) OR (s(1) AND smult2(4));
		smult1_1(5) <= (NOT(s(1)) AND smult1(5)) OR (s(1) AND smult2(5));
		smult1_1(6) <= (NOT(s(1)) AND smult1(6)) OR (s(1) AND smult2(6));
		
-----------------------------------------------------------------------


		smult3(0) <= (NOT(s(0)) AND y(0)) OR (s(0) AND z(0));
		smult3(1) <= (NOT(s(0)) AND y(1)) OR (s(0) AND z(1));
		smult3(2) <= (NOT(s(0)) AND y(2)) OR (s(0) AND z(2));
		smult3(3) <= (NOT(s(0)) AND y(3)) OR (s(0) AND z(3));
		smult3(4) <= (NOT(s(0)) AND y(4)) OR (s(0) AND z(4));
		smult3(5) <= (NOT(s(0)) AND y(5)) OR (s(0) AND z(5));
		smult3(6) <= (NOT(s(0)) AND y(6)) OR (s(0) AND z(6));
---------------------------------------------------------------------	
		smult4(0) <= (NOT(s(0)) AND a(0)) OR (s(0) AND b(0));
	   smult4(1) <= (NOT(s(0)) AND a(1)) OR (s(0) AND b(1));
		smult4(2) <= (NOT(s(0)) AND a(2)) OR (s(0) AND b(2));
	   smult4(3) <= (NOT(s(0)) AND a(3)) OR (s(0) AND b(3));
		smult4(4) <= (NOT(s(0)) AND a(4)) OR (s(0) AND b(4));
	   smult4(5) <= (NOT(s(0)) AND a(5)) OR (s(0) AND b(5));
		smult4(6) <= (NOT(s(0)) AND a(6)) OR (s(0) AND b(6));
----------------------------------------------------------------------
		smult1_2(0) <= (NOT(s(1)) AND smult3(0)) OR (s(1) AND smult4(0));
		smult1_2(1) <= (NOT(s(1)) AND smult3(1)) OR (s(1) AND smult4(1));
		smult1_2(2) <= (NOT(s(1)) AND smult3(2)) OR (s(1) AND smult4(2));
		smult1_2(3) <= (NOT(s(1)) AND smult3(3)) OR (s(1) AND smult4(3));
		smult1_2(4) <= (NOT(s(1)) AND smult3(4)) OR (s(1) AND smult4(4));
		smult1_2(5) <= (NOT(s(1)) AND smult3(5)) OR (s(1) AND smult4(5));
		smult1_2(6) <= (NOT(s(1)) AND smult3(6)) OR (s(1) AND smult4(6));	
	
------------------------------------------------------------------------ 
		smult2_1(0) <= (NOT(s(2)) AND smult1_1(0)) OR (s(2) AND smult1_2(0));
		smult2_1(1) <= (NOT(s(2)) AND smult1_1(1)) OR (s(2) AND smult1_2(1));
		smult2_1(2) <= (NOT(s(2)) AND smult1_1(2)) OR (s(2) AND smult1_2(2));
		smult2_1(3) <= (NOT(s(2)) AND smult1_1(3)) OR (s(2) AND smult1_2(3));
		smult2_1(4) <= (NOT(s(2)) AND smult1_1(4)) OR (s(2) AND smult1_2(4));
		smult2_1(5) <= (NOT(s(2)) AND smult1_1(5)) OR (s(2) AND smult1_2(5));
		smult2_1(6) <= (NOT(s(2)) AND smult1_1(6)) OR (s(2) AND smult1_2(6));
	
		--------------------------------------------------------------------
		smult2_2(0) <= (NOT(s(0)) AND c(0)) OR (s(0) AND d(0));
		smult2_2(1) <= (NOT(s(0)) AND c(1)) OR (s(0) AND d(1));
		smult2_2(2) <= (NOT(s(0)) AND c(2)) OR (s(0) AND d(2));
		smult2_2(3) <= (NOT(s(0)) AND c(3)) OR (s(0) AND d(3));
		smult2_2(4) <= (NOT(s(0)) AND c(4)) OR (s(0) AND d(4));
		smult2_2(5) <= (NOT(s(0)) AND c(5)) OR (s(0) AND d(5));
		smult2_2(6) <= (NOT(s(0)) AND c(6)) OR (s(0) AND d(6));
		
		---------------------------------------------------------------
		DISPLAY(0) <= (NOT(s(3)) AND smult2_1(0)) OR (s(3) AND smult2_2(0));
		DISPLAY(1) <= (NOT(s(3)) AND smult2_1(1)) OR (s(3) AND smult2_2(1));
		DISPLAY(2) <= (NOT(s(3)) AND smult2_1(2)) OR (s(3) AND smult2_2(2));
		DISPLAY(3) <= (NOT(s(3)) AND smult2_1(3)) OR (s(3) AND smult2_2(3));
		DISPLAY(4) <= (NOT(s(3)) AND smult2_1(4)) OR (s(3) AND smult2_2(4));
		DISPLAY(5) <= (NOT(s(3)) AND smult2_1(5)) OR (s(3) AND smult2_2(5));
		DISPLAY(6) <= (NOT(s(3)) AND smult2_1(6)) OR (s(3) AND smult2_2(6));
		
END Behavior;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator9 IS
port(num: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
RES: OUT STD_LOGIC);
END comparator9;

ARCHITECTURE Behavior OF comparator9 IS
BEGIN 
RES <= num(3) and (num(2) or num(1));
END Behavior;



LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY circA IS
port(numv: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
outA: OUT STD_LOGIC_VECTOR(3 downto 0));
END circA;

ARCHITECTURE Behavior OF circA IS
BEGIN 
outA(3) <= Not(numV(3));
outA(2) <= numV(3) and numV(2) and numV(1);
outA(1) <= numV(3) and numV(2) and Not(numV(1));
outA(0) <= (numV(3) and numV(0))and (numV(2) or numV(1));
END Behavior;


