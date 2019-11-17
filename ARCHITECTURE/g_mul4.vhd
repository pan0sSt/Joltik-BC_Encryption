library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity g_mul4 is
	port (  g_in 	: in std_logic_vector(3 downto 0);
			g_out	: out std_logic_vector(3 downto 0));
end g_mul4;


architecture behavior of g_mul4 is
begin
	
g_out <= g_in(1) & g_in(0) & g_in(3) & g_in(2);

end behavior;
