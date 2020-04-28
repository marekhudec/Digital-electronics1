
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- Provides unsigned numerical computation
use IEEE.NUMERIC_STD.ALL;

entity delay is

port (
    time_i: in unsigned (7-1 downto 0); --input value from convertor
	 clk_enable_i   : in  std_logic; -- clock from clock_enable 
    srst_n_i       : in  std_logic; -- Synchronous reset (active low)
    start_PWM_o : out std_logic;
	 BTN: in std_logic
);
end entity delay;


architecture Behavioral of delay is
    signal s_cnt : unsigned(7-1 downto 0) := "0000000";
	
begin

    p_delay : process (clk_enable_i)
    begin
		 if rising_edge(clk_enable_i) then  -- Rising clock edge
           if  BTN = '1' then
			  if srst_n_i = '0' then  -- Synchronous reset (active low)
                s_cnt <= (others => '0');   -- Clear all bits
                start_PWM_o <= '0';
            elsif s_cnt >= time_i then -- Enable pulse
               
                start_PWM_o <= '1';
            else
                s_cnt <= s_cnt + 1;
                start_PWM_o <= '0';
           
				end if;
			end if;
		  end if;
    end process p_delay;
end architecture Behavioral;