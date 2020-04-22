--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:45:29 04/19/2020
-- Design Name:   
-- Module Name:   C:/ISE/Project_PWM/Encoder_to_time_TB.vhd
-- Project Name:  Project_PWM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Encoder_to_time
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
 use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Encoder_to_time_TB IS
END Encoder_to_time_TB;
 
ARCHITECTURE behavior OF Encoder_to_time_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoder_to_time
    PORT(
         enc_in_A_B : IN  std_logic_vector(1 downto 0);
         srst_n_i : IN  std_logic;
         s_number : OUT  unsigned(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal enc_in_A_B : std_logic_vector(1 downto 0) := (others => '0');
   signal srst_n_i : std_logic := '0';

 	--Outputs
   signal s_number : unsigned(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder_to_time PORT MAP (
          enc_in_A_B => enc_in_A_B,
          srst_n_i => srst_n_i,
          s_number => s_number
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     
		srst_n_i <= '1';
	 
    wait for clk_period;
    enc_in_A_B <= "01";
    wait for clk_period;
	 enc_in_A_B <= "11";
	 wait for clk_period;
	 enc_in_A_B <= "10";
	 wait for clk_period;
	 enc_in_A_B <= "00";
     wait;
   end process;

END;
