------------------------------------------------------------------------
--
-- Implementation of 4-bit binary counter.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is

port(
	clk_in: in STD_LOGIC;
	BTN0: in STD_LOGIC;
	CPLD_leds_o: out STD_LOGIC_VECTOR(6-1 downto 0)
	);

end top;

architecture Behavioral of top is

begin
	traffic: entity work.traffic
	port map (
		clk_i => clk_in,         
		srst_n_i => BTN0,			
		lights_o => CPLD_leds_o
	);


end Behavioral;