library IEEE;                                                     --library declaration
use IEEE.STD_LOGIC_1164.ALL;

-------------------1st circuit---------------------

entity circuit1 is
    Port ( A : in  STD_LOGIC;                                     --signal declarations:
           B : in  STD_LOGIC;                                     --1 bit input 
           C : in  STD_LOGIC_VECTOR (5 downto 0);                 --6 bits input 
           RESULT : out  STD_LOGIC_VECTOR (5 downto 0));          --6 bits output 
end circuit1;

architecture dataflow of circuit1 is                              --architecture implementation

begin

   RESULT(0) <= (A NAND B) AND C(0);                              --(A'+B')*C(0)                      
	RESULT(1) <= (A NOR B) AND C(1);                               --(A'*B')*C(1)
	RESULT(2) <= (A AND B) AND C(2);                               --(A*B)*C(2)
	RESULT(3) <= (A XOR B) AND C(3);                               --(A*B'+A'*B)*C(3)
	RESULT(4) <= ((A AND B) OR ((NOT A) AND (NOT B))) AND C(4);    --(A*B+A'*B')*C(4)           
	RESULT(5) <= (((NOT A) AND B) XOR ((NOT A) OR B)) AND C(5);    --(A*B+A'*B')*C(5)
	
end dataflow;