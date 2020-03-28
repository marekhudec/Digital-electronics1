library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  traffic is
port ( clk_i: in std_logic;
		 srst_n_i: in std_logic;
		 lights_o: out std_logic_vector(6-1 downto 0)
		 );

end traffic;
architecture traffic of traffic is
    type state_type is (green_red, yellow_red, red_red, red_green,red_yellow,red_red_2);
	 signal state: state_type;
    signal s_count: unsigned(3 downto 0);
    constant SEC5: unsigned(3 downto 0) := "1111";
    constant SEC1: unsigned(3 downto 0) := "0011";
  
begin
process(clk_i,srst_n_i)
begin
    if rising_edge(clk_i) then
	 if srst_n_i = '0' then
	 state <= green_red;
	 s_count <= x"0"; 
		else 
		case state is
		when green_red => 
			if s_count < SEC5 then
				state <= green_red;
				s_count <= s_count +1;
			else 
				state <= yellow_red;
				s_count <= x"0";
			end if;
		when yellow_red =>
			if s_count < SEC1 then
				state <= yellow_red;
				s_count <= s_count +1;
			else 
				state <= red_red;
				s_count <= x"0";
			end if;
		when red_red => 
			if s_count < SEC1 then
				state <= red_red;
				s_count <= s_count + 1;
			else 
				state <= red_green;
				s_count <= x"0";
			end if;
		when red_green => 
			if s_count < SEC1 then
				state <= red_green;
				s_count <= s_count +1;
			else 
				state <= red_yellow;
				s_count <= x"0";
			end if;
		when red_yellow =>
			if  s_count < SEC1 then
				 state <= red_yellow;
				 s_count <= s_count +1;
			else
				 state <= red_red_2;
				 s_count <= x"0";
				end if;
		when red_red_2 =>
			if  s_count < SEC1 then
				 state <= red_red_2;
				 s_count <= s_count +1;
			else
				 state <= green_red;
				 s_count <= x"0";
				end if;
		when others => 
				 state <= green_red;
			end case;
		end if;
	end if;
end process;
	
	C2: process(state)
	begin

	case state is
			when green_red => lights_o <= "100001";
			when yellow_red => lights_o <= "100010";
			when red_red => lights_o<= "100100";
			when red_green => lights_o <= "001100";
			when red_yellow => lights_o <= "010100";
			when red_red_2 => lights_o <= "100100";
			when others	=> lights_o <= "100001";
		end case;
	
	end process; 
end traffic;    
    
