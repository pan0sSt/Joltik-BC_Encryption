library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
	port (  r 	  	  : in std_logic_vector(5 downto 0);
			state 	  : in std_logic;
			state_out : out std_logic);
end comparator;

architecture behavior of comparator is
begin

	process(r)
	begin
		if(state = '0') then
			if(r = "011001") then
				state_out <= '1';
			else
				state_out <= '0';
			end if;
		elsif(state = '1') then
			if(r = "100001") then
				state_out <= '1';
			else
				state_out <= '0';
			end if;
		else
			state_out <= '0';
		end if;
	end process;

end behavior;