library ieee;                                                --library declaration
use ieee.std_logic_1164.all;

entity full_adder_1bit is
port (
           A, B, Cin : in  std_logic;                          --input declarations
           RESULT, Cout : out  std_logic);                     --output declarations
			  
end full_adder_1bit;

architecture dataflow_2 of full_adder_1bit is                  --architecture implementation

component half_adder                                           --component hald_adder declaration

port (  A, B : in std_logic;
        RESULT, Cout : out std_logic);
		  
end component;

signal sum1, Cout1, Cout2: std_logic;                          --temporary in-between signals

begin

HA1: half_adder                                                --named association conectivity of 1st half_adder
       port map ( A => A,                                      --A = A
                  B => B,                                      --B = B
                  RESULT => sum1,                              --RESULT = result of 1st half_adder
                  Cout => Cout1);                              --Cout = carry output of 1st half_adder
HA2: half_adder                                                --named association conectivity of 2nd half_adder
       port map ( A => sum1,                                   --A = result of 1st half_adder
                  B => Cin ,                                   --B = carry input
                  RESULT => RESULT,                            --RESULT = result of 2nd half_adder
                  Cout => Cout2);                              --Cout = carry output of 2nd half_adder
            
				Cout <= Cout2 or Cout1;                            --Cout = Cout1 + Cout2

end dataflow_2;
