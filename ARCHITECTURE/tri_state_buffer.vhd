library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer is
	port (  ptext_in  : in std_logic_vector(63 downto 0);
			enable	  : in std_logic;
			ptext_out : out std_logic_vector(63 downto 0));
end tri_state_buffer;

architecture behavior of tri_state_buffer is
begin

ptext_out <= ptext_in when enable = '1' else (others => 'Z');

end behavior;