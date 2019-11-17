library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	port (	CLK    :in  std_logic;
			reset  :in  std_logic;
			cout   :out std_logic_vector (5 downto 0));
end counter;

architecture behavior of counter is
signal count :std_logic_vector (5 downto 0) := "000001";

begin

	process (CLK, reset)
	begin
		if (reset = '1') then
			count <= "000001";
		elsif (rising_edge(CLK)) then
			count <= count + 1;
		end if;
	end process;
	
cout  <= count;

end behavior;