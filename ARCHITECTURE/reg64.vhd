library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg64 is
	port (  reg_in	: in std_logic_vector(63 downto 0);
			CLK		: in std_logic;
			reg_out	: out std_logic_vector(63 downto 0));
end reg64;

architecture behavior of reg64 is
begin

	process(CLK)
	begin
		if rising_edge(CLK) then
			reg_out <= reg_in;
		end if;
	end process;

end behavior;