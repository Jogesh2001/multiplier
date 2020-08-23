----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:51 03/13/2020 
-- Design Name: 
-- Module Name:    multiplier - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           M : out  STD_LOGIC_VECTOR (7 downto 0));
end multiplier;

architecture Behavioral of multiplier is
begin 
process(A, B)
	
  variable num1_reg: std_logic_vector(6 downto 0);
  variable product_reg: std_logic_vector(11 downto 0);
	
begin	 
	
  num1_reg := "000" & A;
  product_reg := "00000000" & B;

  -- use variables doing computation
  -- algorithm is to repeat shifting/adding
  for i in 1 to 7 loop
    if product_reg(0)='1' then
	  product_reg(11 downto 7) := product_reg(11 downto 7) 
	  + num1_reg(4 downto 0);
	end if;
	product_reg(11 downto 0) := '0' & product_reg(11 downto 1);
  end loop;
  
  -- assign the result of computation back to output signal
  M <= product_reg(7 downto 0);

end process;
end Behavioral;

