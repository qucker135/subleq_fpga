--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:12:18 10/21/2023
-- Design Name:   
-- Module Name:   C:/ISEworkspace/subleqv3/test_dnc.vhd
-- Project Name:  subleqv3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dnc
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
 
ENTITY test_dnc IS
END test_dnc;
 
ARCHITECTURE behavior OF test_dnc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dnc
    PORT(
         clk : IN  std_logic;
         src_dout : IN  std_logic_vector(7 downto 0);
         dst_dout : IN  std_logic_vector(7 downto 0);
         pc_dout : IN  std_logic_vector(7 downto 0);
         jmp_dout : IN  std_logic_vector(7 downto 0);
         res_dout : IN  std_logic_vector(8 downto 0);
         mem_dout0 : IN  std_logic_vector(7 downto 0);
         mem_dout1 : IN  std_logic_vector(7 downto 0);
         res_din : OUT  std_logic_vector(8 downto 0);
         pc_din : OUT  std_logic_vector(7 downto 0);
         pc_incd : OUT  std_logic_vector(7 downto 0);
         pc_inccd : OUT  std_logic_vector(7 downto 0);
         mem_a0 : OUT  std_logic_vector(7 downto 0);
         mem_a1 : OUT  std_logic_vector(7 downto 0);
         mem_pc_we : OUT  std_logic;
         src_dst_jmp_we : OUT  std_logic;
         res_we : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal src_dout : std_logic_vector(7 downto 0) := (others => '0');
   signal dst_dout : std_logic_vector(7 downto 0) := (others => '0');
   signal pc_dout : std_logic_vector(7 downto 0) := (others => '0');
   signal jmp_dout : std_logic_vector(7 downto 0) := (others => '0');
   signal res_dout : std_logic_vector(8 downto 0) := (others => '0');
   signal mem_dout0 : std_logic_vector(7 downto 0) := (others => '0');
   signal mem_dout1 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal res_din : std_logic_vector(8 downto 0);
   signal pc_din : std_logic_vector(7 downto 0);
   signal pc_incd : std_logic_vector(7 downto 0);
   signal pc_inccd : std_logic_vector(7 downto 0);
   signal mem_a0 : std_logic_vector(7 downto 0);
   signal mem_a1 : std_logic_vector(7 downto 0);
   signal mem_pc_we : std_logic;
   signal src_dst_jmp_we : std_logic;
   signal res_we : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dnc PORT MAP (
          clk => clk,
          src_dout => src_dout,
          dst_dout => dst_dout,
          pc_dout => pc_dout,
          jmp_dout => jmp_dout,
          res_dout => res_dout,
          mem_dout0 => mem_dout0,
          mem_dout1 => mem_dout1,
          res_din => res_din,
          pc_din => pc_din,
          pc_incd => pc_incd,
          pc_inccd => pc_inccd,
          mem_a0 => mem_a0,
          mem_a1 => mem_a1,
          mem_pc_we => mem_pc_we,
          src_dst_jmp_we => src_dst_jmp_we,
          res_we => res_we
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
      src_dout <= X"00";
      dst_dout <= X"00";
      pc_dout <= X"00";
      jmp_dout <= X"00";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"00";
      mem_dout1 <= X"00";

      wait for 10 ns;

      src_dout <= X"00";
      dst_dout <= X"00";
      pc_dout <= X"00";
      jmp_dout <= X"00";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"00";
      mem_dout1 <= X"00";

      wait for 10 ns;

      src_dout <= X"00";
      dst_dout <= X"01";
      pc_dout <= X"00";
      jmp_dout <= X"09";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"01";
      mem_dout1 <= X"00";

      wait for 10 ns;

      src_dout <= X"00";
      dst_dout <= X"01";
      pc_dout <= X"00";
      jmp_dout <= X"09";
      res_dout <= B"0_0000_0001";
      mem_dout0 <= X"01";
      mem_dout1 <= X"00";

      wait for 10 ns;

      src_dout <= X"00";
      dst_dout <= X"01";
      pc_dout <= X"03";
      jmp_dout <= X"09";
      res_dout <= B"0_0000_0001";
      mem_dout0 <= X"01";
      mem_dout1 <= X"00";

      wait for 10 ns;

      src_dout <= X"02";
      dst_dout <= X"06";
      pc_dout <= X"03";
      jmp_dout <= X"09";
      res_dout <= B"0_0000_0001";
      mem_dout0 <= X"09";
      mem_dout1 <= X"09";

      wait for 10 ns;

      src_dout <= X"02";
      dst_dout <= X"06";
      pc_dout <= X"03";
      jmp_dout <= X"09";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"09";
      mem_dout1 <= X"09";

      wait for 10 ns;

      src_dout <= X"02";
      dst_dout <= X"06";
      pc_dout <= X"09";
      jmp_dout <= X"09";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"09";
      mem_dout1 <= X"09";

      wait for 10 ns;

      src_dout <= X"05";
      dst_dout <= X"07";
      pc_dout <= X"09";
      jmp_dout <= X"0F";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"00";
      mem_dout1 <= X"09";

      wait for 10 ns;

      src_dout <= X"05";
      dst_dout <= X"07";
      pc_dout <= X"09";
      jmp_dout <= X"0F";
      res_dout <= B"1_1111_0111";
      mem_dout0 <= X"00";
      mem_dout1 <= X"09";

      wait for 10 ns;

      src_dout <= X"05";
      dst_dout <= X"07";
      pc_dout <= X"0F";
      jmp_dout <= X"0F";
      res_dout <= B"1_1111_0111";
      mem_dout0 <= X"00";
      mem_dout1 <= X"09";

      wait for 10 ns;

      src_dout <= X"00";
      dst_dout <= X"00";
      pc_dout <= X"0F";
      jmp_dout <= X"0F";
      res_dout <= B"1_1111_0111";
      mem_dout0 <= X"00";
      mem_dout1 <= X"00";

      wait for 10 ns;

      src_dout <= X"00";
      dst_dout <= X"00";
      pc_dout <= X"0F";
      jmp_dout <= X"0F";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"00";
      mem_dout1 <= X"00";

      wait for 10 ns;

      src_dout <= X"00";
      dst_dout <= X"00";
      pc_dout <= X"0F";
      jmp_dout <= X"0F";
      res_dout <= B"0_0000_0000";
      mem_dout0 <= X"00";
      mem_dout1 <= X"00";

      wait;

   end process;

END;
