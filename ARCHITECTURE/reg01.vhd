library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg01 is
	port (  enable	: in std_logic;
			CLK		: in std_logic;
			reg_out	: out std_logic);
end reg01;

architecture behavior of reg01 is
begin

	process(CLK, enable)
	begin
		if enable = '1' then
			reg_out <= '1';
		elsif rising_edge(CLK) then
			reg_out <= '0';
		end if;
	end process;

end behavior;