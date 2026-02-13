LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testbench_circuit_1 IS
END testbench_circuit_1;
 
ARCHITECTURE behavior OF testbench_circuit_1 IS 
 
    COMPONENT circuit1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic_vector(5 downto 0);
         RESULT : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
 
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic_vector(5 downto 0) := (others => '0');

   signal RESULT : std_logic_vector(5 downto 0);
 
BEGIN

   uut: circuit1 PORT MAP (
          A => A,
          B => B,
          C => C,
          RESULT => RESULT
        );
 
   stim_proc: process
  begin		
		    
          C <= "000000";              --All bits of vector C = 0
		 
			 A <= '0';                   --Every combination for A and B (2^2=4)
          B <= '0';
      wait for 100 ns;	
          A <= '0';
          B <= '1';
	   wait for 100 ns;		 
			 A <= '1';
          B <= '0';
      wait for 100 ns;	
          A <= '1';
          B <= '1';
      wait for 100 ns;
  
          C <= "111111";              --All bits of vector C = 1
		 
			 A <= '0';                   --Every combination for A and B(2^2=4)
          B <= '0';
      wait for 100 ns;	
          A <= '0';
          B <= '1';
	   wait for 100 ns;		 
			 A <= '1';
          B <= '0';
      wait for 100 ns;	
          A <= '1';
          B <= '1';
      wait for 100 ns;

      wait;
   end process;

END;