library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity round is
	port (  r	 : in std_logic_vector(5 downto 0);
			w0_in 	  : in std_logic_vector(63 downto 0);
			w1_in 	  : in std_logic_vector(63 downto 0);
			w2_in 	  : in std_logic_vector(63 downto 0);
			ptext_in  : in std_logic_vector(63 downto 0);
			w0		  : out std_logic_vector(63 downto 0);
			w1_out	  : out std_logic_vector(63 downto 0);
			w2_out	  : out std_logic_vector(63 downto 0);
			ptext_out : out std_logic_vector(63 downto 0));
end round;

architecture behavior of round is
signal curr_rc, s_tweakey_sig : std_logic_vector(63 downto 0);

component rc_gen is
port (  round 	: in std_logic_vector(5 downto 0);
		rc_out	: out std_logic_vector(63 downto 0));
end component;

component subtweakey_gen is
port (  w0_in 			: in std_logic_vector(63 downto 0);
		w1_in 			: in std_logic_vector(63 downto 0);
		w2_in 			: in std_logic_vector(63 downto 0);
		rc 				: in std_logic_vector(63 downto 0);
		w0				: out std_logic_vector(63 downto 0);
		w1_out			: out std_logic_vector(63 downto 0);
		w2_out			: out std_logic_vector(63 downto 0);
		s_tweakey_out	: out std_logic_vector(63 downto 0));
end component;

component ptext_function is
port (  ptext_in	 : in std_logic_vector(63 downto 0);
		s_tweakey_in : in std_logic_vector(63 downto 0);
		ptext_out	 : out std_logic_vector(63 downto 0));
end component;

begin

RC_GEN1: rc_gen port map(r, curr_rc);

SUBTK_GEN1: subtweakey_gen port map(w0_in, w1_in, w2_in, curr_rc, w0, w1_out, w2_out, s_tweakey_sig);

FNCT1: ptext_function port map(ptext_in, s_tweakey_sig, ptext_out);

end behavior;