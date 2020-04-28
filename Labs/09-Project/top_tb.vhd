--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:31:44 04/25/2020
-- Design Name:   
-- Module Name:   C:/ISE/Project_PWM/top_tb.vhd
-- Project Name:  Project_PWM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
USE ieee.numeric_std.ALL;
 use ieee.std_logic_unsigned.all;
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         in_AB : IN  std_logic_vector(1 downto 0);
         BTN_enc : IN  std_logic;
         clk_i : IN  std_logic;
         LD0: OUT  std_logic;
         BTN0:IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_AB : std_logic_vector(1 downto 0) := (others => '0');
   signal BTN_enc : std_logic := '0';
   signal clk_i : std_logic := '0';
   signal BTN0 : std_logic := '0';

 	--Outputs
   signal LD0 : std_logic;
	

   -- Clock period definitions
   constant clk_i_period : time := 100 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          in_AB => in_AB,
          BTN_enc => BTN_enc,
          clk_i => clk_i,
          LD0 => LD0,
          BTN0 => BTN0
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
     
    wait for clk_i_period/2;
    in_AB <= "01";
    wait for clk_i_period/2;
	 in_AB <= "11";
	 wait for clk_i_period/2;
	 in_AB <= "10";
	 wait for clk_i_period/2;
	 in_AB <= "00";
    wait for clk_i_period/2;
    in_AB <= "01";	 
	 wait for clk_i_period/2;
	 BTN_enc <= '1';
     wait for clk_i_period/2;
	  BTN0 <= '1';
	  wait;
   end process;

END;
