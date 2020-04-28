----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:12 04/11/2020 
-- Design Name: 
-- Module Name:    Encoder_to_time - Behavioral 
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
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Encoder_to_time is
port ( enc_in_A_B: in std_logic_vector(2-1 downto 0); -- input from encoder KY040
		 srst_n_i: in  std_logic; 		 --synchronous reset
		 number_o: out unsigned(7-1 downto 0) -- output value of time converted from encoder`s output pulses
		);
end Encoder_to_time;

architecture Behavioral of Encoder_to_time is
signal timing: unsigned(7-1 downto 0); 
signal before: std_logic_vector(2-1 downto 0);

begin

convert: process(enc_in_A_B)		
begin
	if srst_n_i = '1' then  --asynchronous reset
		case enc_in_A_B is  -- defining state of input A and B
		when "00"  =>
			if before = "10" then   -- compare with previous state
			timing <= timing +1;			--increment
			elsif before = "01" then -- compare with previous state
			timing <= timing -1;     --decrement
			else
			timing <= "0000000";		--reset output
			end if;
			
		when "01" =>
		   if before = "00" then
			timing <= timing +1;
			elsif before = "11" then
			timing <= timing -1;
			else
			timing <= "0000000";
			end if;
			
		when "11" =>
		   if before = "01" then
			timing <= timing +1;
			elsif before = "10" then
			timing <= timing -1;
			else timing <= "0000000";
			end if;
			
		when "10" =>
		   if before = "11" then
			timing <= timing +1;
			elsif before = "00" then
			timing <= timing -1;
			else timing <= "0000000";
			end if;	
		when others => timing <= "0000000";
		end case;
	else timing <= "0000000";
	end if;
end process convert;
	before <= enc_in_A_B;
	number_o <= timing;
end architecture Behavioral;

