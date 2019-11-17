library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity s_box is
	port (  s_in 	: in std_logic_vector(3 downto 0);
			s_out	: out std_logic_vector(3 downto 0));
end s_box;


architecture behavior of s_box is
begin
process(s_in)
begin
case s_in is
	when "0000" => s_out <= "1110";
	when "0001" => s_out <= "0100";
	when "0010" => s_out <= "1011";
	when "0011" => s_out <= "0010";
	when "0100" => s_out <= "0011";
	when "0101" => s_out <= "1000";
	when "0110" => s_out <= "0000";
	when "0111" => s_out <= "1001";
	when "1000" => s_out <= "0001";
	when "1001" => s_out <= "1010";
	when "1010" => s_out <= "0111";
	when "1011" => s_out <= "1111";
	when "1100" => s_out <= "0110";
	when "1101" => s_out <= "1100";
	when "1110" => s_out <= "0101";
	when "1111" => s_out <= "1101";
	when others => s_out <= "0000";
end case;
end process;
end behavior;
