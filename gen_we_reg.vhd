----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:35 10/15/2023 
-- Design Name: 
-- Module Name:    gen_we_reg - Behavioral 
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

entity gen_we_reg is
    generic(
        width : integer := 8
    );
    Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR ( width-1 downto 0);
           dout : out  STD_LOGIC_VECTOR ( width-1 downto 0));
end gen_we_reg;

architecture Behavioral of gen_we_reg is

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                dout <= din;
            end if;
        end if;
    end process;
   
end Behavioral;

