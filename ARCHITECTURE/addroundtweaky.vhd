library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addroundtweaky is
	port (  ptext_in	 : in std_logic_vector(63 downto 0);
			s_tweakey_in : in std_logic_vector(63 downto 0);
			ptext_out	 : out std_logic_vector(63 downto 0));
end addroundtweaky;

architecture behavior of addroundtweaky is
begin

ptext_out <= ptext_in xor s_tweakey_in;

end behavior;