LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testbench_full_adder_2bits IS
END testbench_full_adder_2bits;
 
ARCHITECTURE behavior OF testbench_full_adder_2bits IS 
 
    COMPONENT full_adder_2bit
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         B : IN  std_logic_vector(1 downto 0);
         Cin : IN  std_logic;
         RESULT : OUT  std_logic_vector(1 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
   
   signal A : std_logic_vector(1 downto 0) := (others => '0');
   signal B : std_logic_vector(1 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

   signal RESULT : std_logic_vector(1 downto 0);
   signal Cout : std_logic;
 
BEGIN
 
   uut: full_adder_2bit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          RESULT => RESULT,
          Cout => Cout
        );

   stim_proc: process
   begin	
	
      A <= "00";          --Input: all 0
	   B <= "00";
      Cin <= '0';
   wait for 100 ns;
		
		A(0) <= '0';        --Input: "01011"
		B(0) <= '1';
		A(1) <= '0';
		B(1) <= '1';
		Cin <= '1';
	wait for 100 ns;	
	
	   A(0) <= '0';        --Input: "01000"
		B(0) <= '1';
		A(1) <= '0';
		B(1) <= '0';
		Cin <= '0';
	wait for 100 ns;	

		A(0) <= '1';        --Input: "11011"
		B(0) <= '1';
		A(1) <= '0';
		B(1) <= '1';
		Cin <= '1';
	wait for 100 ns;	

		A(0) <= '0';        --Input: "01001"
		B(0) <= '1';
		A(1) <= '0';
		B(1) <= '0';
		Cin <= '1';
	wait for 100 ns;	

		A(0) <= '0';        --Input: "01111"
		B(0) <= '1';
		A(1) <= '1';
		B(1) <= '1';
		Cin <= '1';
	wait for 100 ns;	

		A(0) <= '1';        --Input: "11001"
		B(0) <= '1';
		A(1) <= '0';
		B(1) <= '0';
		Cin <= '1';
	wait for 100 ns;	

	   A <= "11";           --Input: all 1
	   B <= "11";
      Cin <= '1';
   wait for 100 ns;

      wait;
   end process;

END;
