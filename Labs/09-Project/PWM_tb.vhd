--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:14:07 04/21/2020
-- Design Name:   
-- Module Name:   C:/ISE/Project_PWM/PWM_tb.vhd
-- Project Name:  Project_PWM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PWM
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
 
ENTITY PWM_tb IS
END PWM_tb;
 
ARCHITECTURE behavior OF PWM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PWM
    PORT(
         rst_n_i : IN  std_logic;
         start_PWM : IN  std_logic;
         clk_i : IN  std_logic;
         PWM_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst_n_i : std_logic := '0';
   signal start_PWM : std_logic := '0';
   signal clk_i : std_logic := '0';

 	--Outputs
   signal PWM_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 100 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PWM PORT MAP (
          rst_n_i => rst_n_i,
          start_PWM => start_PWM,
          clk_i => clk_i,
          PWM_o => PWM_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 5 ms;
		rst_n_i <= '1';
		wait for 5 ms;
		start_PWM <= '1';
		

      -- insert stimulus here 

      wait;
   end process;

END;
