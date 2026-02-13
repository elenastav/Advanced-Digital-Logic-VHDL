library ieee;                                                --library declaration
use ieee.std_logic_1164.all;

entity half_adder is
    Port ( 
	        A, B : in std_logic;                               --input declarations
           RESULT,Cout: out std_logic);                       --output declarations
	        
end half_adder;

architecture dataflow_1 of half_adder is                      --architecture implementation

begin

    RESULT <= A xor B;                                        --sum = A'*B + A*B'
    Cout <= A and B;                                          --carry = A*B

end dataflow_1;