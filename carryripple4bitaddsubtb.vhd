--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:13:49 10/17/2015
-- Design Name:   
-- Module Name:   /home/ghost/Documents/Xilinx_Workspaces/TUTORIALS/carryripple4bitaddsubtb.vhd
-- Project Name:  TUTORIALS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: carryripple4bitaddsub
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY carryripple4bitaddsubtb IS
END carryripple4bitaddsubtb;
 
ARCHITECTURE behavior OF carryripple4bitaddsubtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carryripple4bitaddsub
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin: IN  std_logic;
			op_sel : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';
	signal op_sel : std_logic := '0';
 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carryripple4bitaddsub PORT MAP (
          a => a,
          b => b,
          cin => cin,
			 op_sel => op_sel,
          sum => sum,
          cout => cout
        );

   -- Clock process definitions
   tb :process
   begin
wait for 4 ns;	
a<="0010";  --num1 =2
b<="1001";
cin<='1';
op_sel<='1';  --num2 =9
wait for 2 ns;

a<="1010";  --num1 =10
b<="0011";   --num2 =3
cin<='0';
op_sel<='0';
wait for 2 ns;

a<="1000";  --num1 =8
b<="0101";  --num2 =5
cin<='1';
op_sel<='1';
wait for 2 ns;

a<="1010";  --num1 =10
b<="0110";  --num2 =6
cin<='0';
op_sel<='0';
--more input combinations can be given here.
   -- Stimulus process
  
   end process tb;

END;
