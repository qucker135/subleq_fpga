--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   16:40:43 10/21/2023
-- Design Name:
-- Module Name:   C:/ISEworkspace/subleqv3/test_mem.vhd
-- Project Name:  subleqv3
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: mem
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

entity test_mem is
end entity test_mem;

architecture behavior of test_mem is

  -- Component Declaration for the Unit Under Test (UUT)

  component mem is
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
  end component;

  -- Inputs
  signal clk : std_logic                    := '0';
  signal we  : std_logic                    := '0';
  signal din : std_logic_vector(7 downto 0) := (others => '0');
  signal a0  : std_logic_vector(7 downto 0) := (others => '0');
  signal a1  : std_logic_vector(7 downto 0) := (others => '0');
  signal a2  : std_logic_vector(7 downto 0) := (others => '0');

  -- Outputs
  signal dout0 : std_logic_vector(7 downto 0);
  signal dout1 : std_logic_vector(7 downto 0);
  signal dout2 : std_logic_vector(7 downto 0);

  -- Clock period definitions
  constant clk_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : component mem
    port map (
      clk   => clk,
      we    => we,
      din   => din,
      a0    => a0,
      a1    => a1,
      a2    => a2,
      dout0 => dout0,
      dout1 => dout1,
      dout2 => dout2
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

    a0  <= X"00";
    a1  <= X"05";
    a2  <= X"10";
    din <= X"AB";

    wait for 10 ns;

    we <= '1';

    wait for 10 ns;

    a0  <= X"01";
    a1  <= X"00";
    a2  <= X"02";
    din <= X"CD";

    wait for 10 ns;

    a0  <= X"02";
    a1  <= X"00";
    a2  <= X"02";
    din <= X"EF";

    wait for 10 ns;

    a0  <= X"00";
    a1  <= X"01";
    a2  <= X"02";
    din <= X"85";

    wait for 10 ns;

    we  <= '0';
    a0  <= X"02";
    a1  <= X"02";
    a2  <= X"02";
    din <= X"08";

  end process stim_proc;

end architecture behavior;
