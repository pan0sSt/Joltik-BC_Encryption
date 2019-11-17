library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity joltik_testbench is

end joltik_testbench;

architecture behavior of joltik_testbench is
signal CLK, state, cypher_state : std_logic;
signal ptext_in, ptext_out 		: std_logic_vector(63 downto 0);
signal KT						: std_logic_vector(191 downto 0);

component joltik_BC is
port (	KT 		  	 : in std_logic_vector(191 downto 0);
		ptext_in  	 : in std_logic_vector(63 downto 0);
		state 	  	 : in std_logic;
		cypher_state : in std_logic;
		CLK    	  	 : in  std_logic;
		ptext_out 	 : out std_logic_vector(63 downto 0));
end component;

begin

KT 			 <= x"000000000000000012345678123456781234567812345678";
ptext_in 	 <= x"abcdefababcdefab";
state 		 <= '0';
cypher_state <= '0';

BC1: joltik_BC port map(KT, ptext_in, state, cypher_state, CLK, ptext_out);

clk_generation : process
begin
		CLK <= '1';
		wait for 50 ns;
		CLK <= '0';
		wait for 50 ns;
end process clk_generation;

end behavior;