----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:24 04/22/2020 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
port( in_AB: in std_logic_vector(2-1 downto 0);
		BTN: in std_logic;
		clk_i: in std_logic;
		PWM_O: out std_logic
		);
		
end entity top;

architecture Behavioral of top is
signal s_number: unsigned(2-1 downto 0); 
signal s_allow: std_logic;
begin

	Encoder_to_time: entity work.Encoder_to_time
			port map( enc_in_A_B => in_AB;
						 number_o=>s_numeber);
	
	delay: entity work.delay
			port map( ...);
			
	PWM: entity work.PWM
			port map( 
			
							
end Behavioral;

