--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   15:23:59 10/15/2023
-- Design Name:
-- Module Name:   C:/ISEworkspace/subleqv3/test_gen_we_reg.vhd
-- Project Name:  subleqv3
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: gen_we_reg
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

library ieee;
  use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- USE ieee.numeric_std.ALL;

entity test_gen_we_reg is
end entity test_gen_we_reg;

architecture behavior of test_gen_we_reg is

  -- Component Declaration for the Unit Under Test (UUT)

  component gen_we_reg is
    generic (
      width : integer := 8
    );
    port (
      clk  : in    std_logic;
      we   : in    std_logic;
      din  : in    std_logic_vector(width - 1 downto 0);
      dout : out   std_logic_vector(width - 1 downto 0)
    );
  end component;

  constant width : integer := 12;

  -- Inputs
  signal clk : std_logic                            := '0';
  signal we  : std_logic                            := '0';
  signal din : std_logic_vector(width - 1 downto 0) := (others => '0');

  -- Outputs
  signal dout : std_logic_vector(width - 1 downto 0);

  -- Clock period definitions
  constant clk_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : component gen_we_reg
    generic map (
      width => 12
    )
    port map (
      clk  => clk,
      we   => we,
      din  => din,
      dout => dout
    );

  -- Clock process definitions
  clk_process : process is
  begin

    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;

  end process clk_process;

  -- Stimulus process
  stim_proc : process is
  begin

    -- hold reset state for 100 ns.
    wait for 10 ns;

    din <= X"35F";

    wait for 10 ns;

    we <= '1';

    wait for 10 ns;

    din <= X"24C";

    wait for 10 ns;

    we <= '0';

  end process stim_proc;

end architecture behavior;
