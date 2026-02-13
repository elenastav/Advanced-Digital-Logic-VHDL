library ieee;                                                --library declaration
use ieee.std_logic_1164.all;

entity full_adder_2bit is
port (
           A,B: in std_logic_vector(1 downto 0);
			  Cin : in  std_logic;                                --input declarations
           RESULT : out  std_logic_vector(1 downto 0);
           Cout : out  std_logic);                             --output declarations
			  
end full_adder_2bit;

architecture dataflow_3 of full_adder_2bit is                  --architecture implementation

component full_adder_1bit                                      --component full_adder_1bit declaration

port (  A, B, Cin : in std_logic;
       RESULT, Cout : out std_logic);
		  
end component;

signal Ctemp: std_logic;                                       --temporary in-between signal

begin

FA1: full_adder_1bit                                           --named association conectivity of 1st full_adder_1bit
       port map ( A => A(0),                                   --A = A(0) 
                  B => B(0),                                   --B = B(0)
						Cin => Cin,                                  --Cin = carry input
                  RESULT => RESULT(0),                         --RESULT = result of 1st full_adder_1bit
                  Cout => Ctemp);           
FA2: full_adder_1bit                                           --named association conectivity of 2nd full_adder_1bit
       port map ( A => A(1),                                   --A = A(1)
                  B => B(1),                                   --B = B(1)
						Cin => Ctemp,                                --Cin = carry output of 1st full_adder_1bit
                  RESULT => RESULT(1),                         --RESULT = result of 2nd full_adder_1bit
                  Cout => Cout);                               --Cout = carry output of 2nd full_adder_1bit

end dataflow_3;