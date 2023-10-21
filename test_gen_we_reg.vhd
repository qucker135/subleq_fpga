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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_gen_we_reg IS
END test_gen_we_reg;
 
ARCHITECTURE behavior OF test_gen_we_reg IS 

   -- Component Declaration for the Unit Under Test (UUT)
 
   COMPONENT gen_we_reg
   GENERIC (
      width : integer := 8
   );
   PORT(
      clk : IN  std_logic;
      we : IN  std_logic;
      din : IN  std_logic_vector(width-1 downto 0);
      dout : OUT  std_logic_vector(width-1 downto 0)
   );
   END COMPONENT;
    
   constant width : integer := 12;

   --Inputs
   signal clk : std_logic := '0';
   signal we : std_logic := '0';
   signal din : std_logic_vector(width-1 downto 0) := (others => '0');

    --Outputs
   signal dout : std_logic_vector(width-1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: gen_we_reg
        GENERIC MAP (
          width => 12
        )
        PORT MAP (
          clk => clk,
          we => we,
          din => din,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
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
   end process;

END;
