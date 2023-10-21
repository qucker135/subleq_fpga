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

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity mem is
  port (
    clk   : in    std_logic;
    we    : in    std_logic;
    din   : in    std_logic_vector(7 downto 0);
    a0    : in    std_logic_vector(7 downto 0);
    a1    : in    std_logic_vector(7 downto 0);
    a2    : in    std_logic_vector(7 downto 0);
    dout0 : out   std_logic_vector(7 downto 0);
    dout1 : out   std_logic_vector(7 downto 0);
    dout2 : out   std_logic_vector(7 downto 0)
  );
end entity mem;

architecture behavioral of mem is

  type memory_type is array (0 to 255) of std_logic_vector(7 downto 0);

  signal mem_sig : memory_type := (others => (others => '0'));

begin

  main : process (clk) is
  begin

    if rising_edge(clk) then
      if (we = '1') then
        mem_sig(to_integer(unsigned(a0))) <= din;
      end if;
    end if;

  end process main;

  dout0 <= mem_sig(to_integer(unsigned(a0)));

end architecture behavioral;

