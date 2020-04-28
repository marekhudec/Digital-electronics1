--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:24:06 04/27/2020
-- Design Name:   
-- Module Name:   C:/ISE/Project_PWM/delay_tb.vhd
-- Project Name:  Project_PWM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: delay
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
USE ieee.numeric_std.ALL;
 
ENTITY delay_tb IS
END delay_tb;
 
ARCHITECTURE behavior OF delay_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT delay
    PORT(
         time_i : IN  unsigned(6 downto 0);
         clk_enable_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         start_PWM_o : OUT  std_logic;
         BTN : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal time_i : unsigned(6 downto 0) := (others => '0');
   signal clk_enable_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   signal BTN : std_logic := '0';

 	--Outputs
   signal start_PWM_o : std_logic;

   -- Clock period definitions
   constant clk_enable_i_period : time := 10 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: delay PORT MAP (
          time_i => time_i,
          clk_enable_i => clk_enable_i,
          srst_n_i => srst_n_i,
          start_PWM_o => start_PWM_o,
          BTN => BTN
        );

   -- Clock process definitions
   clk_enable_i_process :process
   begin
		clk_enable_i <= '0';
		wait for clk_enable_i_period/2;
		clk_enable_i <= '1';
		wait for clk_enable_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     wait for clk_enable_i_period/2;
	  time_i <= "0000100";
		wait for clk_enable_i_period;
		BTN <='1';
		wait for clk_enable_i_period;
		srst_n_i <= '1';
		 wait for clk_enable_i_period;	
	
		wait;
   end process;

END;
