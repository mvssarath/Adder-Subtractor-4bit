----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:52 10/17/2015 
-- Design Name: 
-- Module Name:    singlebitadder - Behavioral 
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

entity singlebitadder is
    Port ( a : in  STD_LOGIC;         ---- input a 
           b : in  STD_LOGIC;			------ input b
           cin : in  STD_LOGIC;		---- cin or the operation select
           sum : out  STD_LOGIC;			----- sum of numbers a and b
           cout : out  STD_LOGIC);			--- carry out
end singlebitadder;

architecture Behavioral of singlebitadder is

begin
	
	sum  <= a xor b xor cin;                 --- logic for generating sum
	cout <= (a or b) and (b or cin) and (cin or a);    ---- logic for generating carry out

end Behavioral;

