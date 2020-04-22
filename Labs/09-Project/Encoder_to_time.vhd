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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Encoder_to_time is
port ( enc_in_A_B: in std_logic_vector(2-1 downto 0);
		 srst_n_i : in  std_logic;
		 number_o: out unsigned(2-1 downto 0)
		);
end Encoder_to_time;

architecture Behavioral of Encoder_to_time is
signal timing: unsigned(2-1 downto 0); 
signal before: std_logic_vector(2-1 downto 0);

begin

convert: process(enc_in_A_B, srst_n_i )
begin
	if srst_n_i = '1' then  
		case enc_in_A_B is
		when "00"  =>
			if before = "10" then
			timing <= timing +1;
			elsif before = "01" then
			timing <= timing -1;
			else
			timing <= "00";
			end if;
			
		when "01" =>
		   if before = "00" then
			timing <= timing +1;
			elsif before = "11" then
			timing <= timing -1;
			else
			timing <= "00";
			end if;
			
		when "11" =>
		   if before = "01" then
			timing <= timing +1;
			elsif before = "10" then
			timing <= timing -1;
			else timing <= "00";
			end if;
			
		when "10" =>
		   if before = "11" then
			timing <= timing +1;
			elsif before = "00" then
			timing <= timing -1;
			else timing <= "00";
			end if;	
		when others => timing <= "00";
		end case;
	else timing <= "00";
	end if;
end process convert;
	before <= enc_in_A_B;
	number_o <= timing;
end architecture Behavioral;

