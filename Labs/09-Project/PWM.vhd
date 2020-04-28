----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:55 04/20/2020 
-- Design Name: 
-- Module Name:    PWM - Behavioral 
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
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity PWM is

port (
		rst_n_i: in std_logic;   --synchronous reset
		start_PWM: in std_logic; --start signal from delay block
		clk_i: in std_logic;
		PWM_o: out std_logic
		);

end PWM;

architecture Behavioral of PWM is
signal percent: unsigned(7-1 downto 0):= "0000000"; -- count of percent from  one period (0 to 100)
signal T_count: unsigned(7-1 downto 0):= "0000000"; --count of periodes (0 to 100)
signal s_out: std_logic;

begin

PWM:process(clk_i)
begin
if rising_edge(clk_i) then
	if rst_n_i = '1' then  --synchronous reset
		if start_PWM = '1' then --input signal from delay block (active in 1)
			if T_count = "1100100" then -- log 0 after 0% PWM
			s_out <= '0';
			else	
		 percent <= percent +1;  --increment of percents of one period
		 if percent < "1100100" - T_count then  
			s_out <= '1';
		 else s_out <= '0';
		 end if;
		
			if percent = "1100100" then
			T_count <= T_count +1;	--inkcement of period
			percent <= (others => '0');
			end if;
		end if;
		else s_out <= '0';
		end if;
	 else s_out <= '0';
	 end if;
end if;
end process PWM;
PWM_o <= s_out;	 
end architecture Behavioral;

