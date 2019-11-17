library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity first_round is
	port (  KT 	  	  	 : in std_logic_vector(191 downto 0);
			ptext_in  	 : in std_logic_vector(63 downto 0);
			cypher_state : in std_logic;
			KT_out 	  	 : out std_logic_vector(191 downto 0);
			ptext_out 	 : out std_logic_vector(63 downto 0));
end first_round;

architecture behavior of first_round is
signal w0_sig, w1_sig, w2_sig, rc_sig, rc_out_sig : std_logic_vector(63 downto 0);
signal rc1 : std_logic_vector(15 downto 0);
signal rc2 : std_logic_vector(31 downto 0);
signal rc  : std_logic_vector(5 downto 0);

component rc_xor is
port (  w0 		: in std_logic_vector(63 downto 0);
		w1 		: in std_logic_vector(63 downto 0);
		w2 		: in std_logic_vector(63 downto 0);
		rc 		: in std_logic_vector(63 downto 0);
		xor_out	: out std_logic_vector(63 downto 0));
end component;

component addroundtweaky is
port (  ptext_in	 : in std_logic_vector(63 downto 0);
		s_tweakey_in : in std_logic_vector(63 downto 0);
		ptext_out	 : out std_logic_vector(63 downto 0));
end component;

begin

w0_sig <= KT(191 downto 128);
w1_sig <= KT(127 downto 64);
w2_sig <= KT(63 downto 0);
rc1	   <= "0000"&"0001"&"0010"&"0011";
rc2    <= "0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000";

process(cypher_state)
begin
		if(cypher_state = '0') then
			rc_sig <= x"0123010100000000";
		elsif(cypher_state = '1') then
			rc_sig <= x"0123616100000000";
		else
			rc_sig <= x"0000000000000000";
		end if;

end process;

RC_XOR1: rc_xor port map(w0_sig, w1_sig, w2_sig, rc_sig, rc_out_sig);

ADDTK1: addroundtweaky port map(ptext_in, rc_out_sig, ptext_out);
KT_out <= KT;

end behavior;