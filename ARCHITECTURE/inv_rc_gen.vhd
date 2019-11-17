library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_rc_gen is
	port (  round 	: in std_logic_vector(5 downto 0);
			rc_out	: out std_logic_vector(63 downto 0));
end inv_rc_gen;


architecture behavior of inv_rc_gen is
signal rc  : std_logic_vector(5 downto 0);
signal rc1 : std_logic_vector(15 downto 0);
signal rc2 : std_logic_vector(31 downto 0);
begin
process(round)
begin
case round is
	when "000000" => rc <= "110001";
	when "000001" => rc <= "111000";
	when "000010" => rc <= "011100";
	when "000011" => rc <= "101110";
	when "000100" => rc <= "010111";
	when "000101" => rc <= "001011";
	when "000110" => rc <= "000101";
	when "000111" => rc <= "000010";
	when "001000" => rc <= "100001";
	when "001001" => rc <= "110000";
	when "001010" => rc <= "011000";
	when "001011" => rc <= "101100";
	when "001100" => rc <= "010110";
	when "001101" => rc <= "101011";
	when "001110" => rc <= "110101";
	when "001111" => rc <= "111010";
	when "010000" => rc <= "011101";
	when "010001" => rc <= "001110";
	when "010010" => rc <= "100111";
	when "010011" => rc <= "110011";
	when "010100" => rc <= "111001";
	when "010101" => rc <= "111100";
	when "010110" => rc <= "011110";
	when "010111" => rc <= "101111";
	when "011000" => rc <= "110111";
	when "011001" => rc <= "111011";
	when "011010" => rc <= "111101";
	when "011011" => rc <= "111110";
	when "011100" => rc <= "011111";
	when "011101" => rc <= "001111";
	when "011110" => rc <= "000111";
	when "011111" => rc <= "000011";
	when "100000" => rc <= "000001";
	when others   => rc <= "000000";
end case;
rc1	   <= "0000"&"0001"&"0010"&"0011";
rc2    <= "0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000";
end process;
rc_out <= rc1 &"0"& rc(5 downto 3) &"0"& rc(2 downto 0) &"0"& rc(5 downto 3) &"0"& rc(2 downto 0) & rc2;
end behavior;
