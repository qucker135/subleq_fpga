----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    19:04:01 10/21/2023
-- Design Name:
-- Module Name:    dnc - Behavioral
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

entity dnc is
  port (
    clk            : in    std_logic;
    src_dout       : in    std_logic_vector(7 downto 0);
    dst_dout       : in    std_logic_vector(7 downto 0);
    pc_dout        : in    std_logic_vector(7 downto 0);
    jmp_dout       : in    std_logic_vector(7 downto 0);
    res_dout       : in    std_logic_vector(8 downto 0);
    mem_dout0      : in    std_logic_vector(7 downto 0);
    mem_dout1      : in    std_logic_vector(7 downto 0);
    res_din        : out   std_logic_vector(8 downto 0);
    pc_din         : out   std_logic_vector(7 downto 0);
    pc_incd        : out   std_logic_vector(7 downto 0);
    pc_inccd       : out   std_logic_vector(7 downto 0);
    mem_a0         : out   std_logic_vector(7 downto 0);
    mem_a1         : out   std_logic_vector(7 downto 0);
    mem_pc_we      : out   std_logic;
    src_dst_jmp_we : out   std_logic;
    res_we         : out   std_logic
  );
end entity dnc;

architecture behavioral of dnc is

  type clock_phase is (q0, q1, q2);

  signal clock_phase_s : clock_phase := q1;

  signal ext_mem_dout0 : std_logic_vector(8 downto 0);
  signal ext_mem_dout1 : std_logic_vector(8 downto 0);

  signal res_leq0 : std_logic;

begin

  -- outputs dependent on clock phase:
  -- mem_a0
  -- mem_a1
  -- mem_pc_we
  -- src_dst_jmp_we
  -- res_we
  main : process (clk) is
  begin

    if rising_edge(clk) then

      case clock_phase_s is

        when q0 =>

          clock_phase_s  <= q1;
          mem_a0         <= dst_dout;
          mem_a1         <= src_dout;
          mem_pc_we      <= '1';
          src_dst_jmp_we <= '0';
          res_we         <= '0';

        when q1 =>

          clock_phase_s  <= q2;
          mem_a0         <= pc_dout;
          mem_a1         <= std_logic_vector(unsigned(pc_dout) + 1);
          mem_pc_we      <= '0';
          src_dst_jmp_we <= '1';
          res_we         <= '0';

        when q2 =>

          clock_phase_s  <= q0;
          mem_a0         <= dst_dout;
          mem_a1         <= src_dout;
          mem_pc_we      <= '0';
          src_dst_jmp_we <= '0';
          res_we         <= '1';

      end case;

    end if;

  end process main;

  -- res_din
  ext_mem_dout0 <= '0' & mem_dout0;
  ext_mem_dout1 <= '0' & mem_dout1;
  res_din       <= std_logic_vector(unsigned(ext_mem_dout0) - unsigned(ext_mem_dout1));

  -- pc_din
  res_leq0 <= '1' when (res_dout = B"0_0000_0000") else
              res_dout(8);

  pc_din_process : process (res_leq0, jmp_dout, pc_dout) is
  begin

    if (res_leq0 = '1') then
      pc_din <= jmp_dout;
    else
      pc_din <= std_logic_vector(unsigned(pc_dout) + 3);
    end if;

  end process pc_din_process;

  -- pc_incd
  pc_incd <= std_logic_vector(unsigned(pc_dout) + 1);

  -- pc_inccd
  pc_inccd <= std_logic_vector(unsigned(pc_dout) + 2);

end architecture behavioral;

