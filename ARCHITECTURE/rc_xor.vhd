library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rc_xor is
	port (  w0 		: in std_logic_vector(63 downto 0);
			w1 		: in std_logic_vector(63 downto 0);
			w2 		: in std_logic_vector(63 downto 0);
			rc 		: in std_logic_vector(63 downto 0);
			xor_out	: out std_logic_vector(63 downto 0));
end rc_xor;

architecture behavior of rc_xor is
begin

xor_out <= ((w0 xor w1) xor w2)	xor rc;

end behavior;