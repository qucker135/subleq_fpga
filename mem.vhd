----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:35 10/15/2023 
-- Design Name: 
-- Module Name:    mem - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem is
    Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           a0 : in  STD_LOGIC_VECTOR (7 downto 0);
           a1 : in  STD_LOGIC_VECTOR (7 downto 0);
           a2 : in  STD_LOGIC_VECTOR (7 downto 0);
           dout0 : out  STD_LOGIC_VECTOR (7 downto 0);
           dout1 : out  STD_LOGIC_VECTOR (7 downto 0);
           dout2 : out  STD_LOGIC_VECTOR (7 downto 0));
end mem;

architecture Behavioral of mem is

	type memory_type is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal mem_sig : memory_type := (others => (others => '0'));

begin

	process(clk)
	begin
		if rising_edge(clk) then
			if we = '1' then
				mem_sig(to_integer(unsigned(a0))) <= din;
			end if;
		end if;
	end process;
	
	dout0 <= mem_sig(to_integer(unsigned(a0)));

end Behavioral;

