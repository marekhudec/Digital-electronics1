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
use ieee.std_logic_unsigned.all;
entity top is
port( in_AB: in std_logic_vector(2-1 downto 0); --inputs connectet to encoder pins
		BTN_enc: in std_logic;  --button in encoder
		clk_i: in std_logic;  	-- internal clock in CPLD
		LD0: out std_logic; --LED light down
		BTN0: in std_logic --synchronous reset
		);
		
end entity top;

architecture Behavioral of top is
signal s_number: unsigned(7-1 downto 0); 
signal s_allow: std_logic;
signal s_start: std_logic;
signal s_en: std_logic;
signal s_input: std_logic_vector(2-1 downto 0);
begin

		clock_enable: entity work.clock_enable
			port map( clk_i => clk_i,
						 srst_n_i => BTN0,
						 clock_enable_o => s_en);
	
	delay: entity work.delay
			port map( time_i => s_number,
						 BTN => s_allow,
						 start_PWM_o => s_start,
						 srst_n_i => BTN0,
						 clk_enable_i => s_en);
			 

			Encoder_to_time: entity work.Encoder_to_time
			port map( enc_in_A_B => s_input,
						  number_o => s_number,
						  srst_n_i => BTN0 );
						  
	PWM: entity work.PWM
			port map( clk_i => clk_i,
						 start_PWM => s_start,
						 PWM_o => LD0,
						 rst_n_i => BTN0 
						 );
			s_allow <= BTN_enc ;
			s_input <= in_AB;				
end architecture Behavioral;

