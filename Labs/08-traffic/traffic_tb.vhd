--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:42:47 03/28/2020
-- Design Name:   
-- Module Name:   C:/ISE/traffic_lights/traffic_tb.vhd
-- Project Name:  traffic_lights
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: traffic
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
 
ENTITY traffic_tb IS
END traffic_tb;
 
ARCHITECTURE behavior OF traffic_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT traffic
    PORT(
         clk_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         lights_o : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';

 	--Outputs
   signal lights_o : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 300 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: traffic PORT MAP (
          clk_i => clk_i,
          srst_n_i => srst_n_i,
          lights_o => lights_o
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
      -- hold reset state for 100 ,s.
      wait for 100 ms;
		srst_n_i <= '1';	

      wait for clk_i_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
