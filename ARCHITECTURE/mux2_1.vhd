library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1 is
	port (  A 		: in std_logic_vector(255 downto 0);
			B		: in std_logic_vector(255 downto 0);
			SEL		: in std_logic;
			mux_out : out std_logic_vector(255 downto 0));
end mux2_1;

architecture behavior of mux2_1 is
begin

mux_out <= A when (SEL = '0') else B;

end behavior;