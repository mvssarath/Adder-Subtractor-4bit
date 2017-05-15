----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ghost
-- 
-- Create Date:    09:47:33 10/17/2015 
-- Design Name: 
-- Module Name:    carryripple4bitaddsub - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity carryripple4bitaddsub is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin,op_sel : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end carryripple4bitaddsub;

architecture Behavioral of carryripple4bitaddsub is
component singlebitadder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

signal opsel : std_logic_vector (3 downto 0);
signal co_0,co_1,co_2:std_logic;

begin
opsel(0)<= op_sel xor b(0);       ---- selecting between addition or subtraction
B0: singlebitadder port map(a(0),opsel(0),cin,sum(0),co_0);----- using one bit adder

opsel(1)<= op_sel xor b(1); ---- selecting between addition or subtraction
B1: singlebitadder port map(a(1),opsel(1),co_0,sum(1),co_1);

opsel(2)<= op_sel xor b(2); ---- selecting between addition or subtraction
B2: singlebitadder port map(a(2),opsel(2),co_1,sum(2),co_2);

opsel(3)<= op_sel xor b(3); ---- selecting between addition or subtraction
B3: singlebitadder port map(a(3),opsel(3),co_2,sum(3),cout);

end Behavioral;

