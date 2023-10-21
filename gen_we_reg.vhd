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

library ieee;
  use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity gen_we_reg is
  generic (
    width : integer := 8
  );
  port (
    clk  : in    std_logic;
    we   : in    std_logic;
    din  : in    std_logic_vector(width - 1 downto 0);
    dout : out   std_logic_vector(width - 1 downto 0)
  );
end entity gen_we_reg;

architecture behavioral of gen_we_reg is

begin

  main : process (clk) is
  begin

    if rising_edge(clk) then
      if (we = '1') then
        dout <= din;
      end if;
    end if;

  end process main;

end architecture behavioral;

