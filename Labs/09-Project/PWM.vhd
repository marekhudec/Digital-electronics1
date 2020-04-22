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
		s_rst: in std_logic;
		start_PWM: in std_logic;
		clk_i: in std_logic;
		PWM_o: out std_logic
		);

end PWM;

architecture Behavioral of PWM is
signal percent: unsigned(7-1 downto 0):= "0000000";
signal T_count: unsigned(7-1 downto 0):= "0000000";
signal s_out: std_logic;

begin

PWM:process(clk_i,s_rst,start_PWM)
begin
if s_rst = '1' then
	if start_PWM = '1' then
	  if T_count = "1100100" then
			s_out <= '0';
		else	
			if rising_edge(clk_i) then
		 percent <= percent +1;
		 if percent < 100 - T_count then
			s_out <= '1';
		 else s_out <= '0';
		 end if;
		
			if percent = 100 then
			T_count <= T_count +1;
			percent <= (others => '0');
			end if;
			
		end if;
		end if;
	 else s_out <= '0';
	 end if;
else s_out <= '0';
end if;
end process PWM;
PWM_o <= s_out;	 
end architecture Behavioral;

