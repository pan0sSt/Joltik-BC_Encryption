library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_subtweakey_gen is
	port (  w0_in 			: in std_logic_vector(63 downto 0);
			w1_in 			: in std_logic_vector(63 downto 0);
			w2_in 			: in std_logic_vector(63 downto 0);
			rc 				: in std_logic_vector(63 downto 0);
			w0				: out std_logic_vector(63 downto 0);
			w1_out			: out std_logic_vector(63 downto 0);
			w2_out			: out std_logic_vector(63 downto 0);
			s_tweakey_out	: out std_logic_vector(63 downto 0));
end inv_subtweakey_gen;

architecture behavior of inv_subtweakey_gen is
signal w0_sig, w1, w2, w1_out_sig, w2_out_sig 				  : std_logic_vector(63 downto 0);

component inv_h_perm is
port (  h_in 	: in std_logic_vector(63 downto 0);
		h_out	: out std_logic_vector(63 downto 0)); 
end component;

component g_div2 is
port (  g_in 	: in std_logic_vector(3 downto 0);
		g_out	: out std_logic_vector(3 downto 0));
end component;

component g_mul4 is
port (  g_in 	: in std_logic_vector(3 downto 0);
		g_out	: out std_logic_vector(3 downto 0));
end component;

component rc_xor is
port (  w0 		: in std_logic_vector(63 downto 0);
		w1 		: in std_logic_vector(63 downto 0);
		w2 		: in std_logic_vector(63 downto 0);
		rc 		: in std_logic_vector(63 downto 0);
		xor_out	: out std_logic_vector(63 downto 0));
end component;

begin

b17: g_div2 port map(w1_in(63 downto 60), w1(63 downto 60));
b18: g_div2 port map(w1_in(59 downto 56), w1(59 downto 56));
b19: g_div2 port map(w1_in(55 downto 52), w1(55 downto 52));
b20: g_div2 port map(w1_in(51 downto 48), w1(51 downto 48));
b21: g_div2 port map(w1_in(47 downto 44), w1(47 downto 44));
b22: g_div2 port map(w1_in(43 downto 40), w1(43 downto 40));
b23: g_div2 port map(w1_in(39 downto 36), w1(39 downto 36));
b24: g_div2 port map(w1_in(35 downto 32), w1(35 downto 32));
b25: g_div2 port map(w1_in(31 downto 28), w1(31 downto 28));
b26: g_div2 port map(w1_in(27 downto 24), w1(27 downto 24));
b27: g_div2 port map(w1_in(23 downto 20), w1(23 downto 20));
b28: g_div2 port map(w1_in(19 downto 16), w1(19 downto 16));
b29: g_div2 port map(w1_in(15 downto 12), w1(15 downto 12));
b30: g_div2 port map(w1_in(11 downto 8), w1(11 downto 8));
b31: g_div2 port map(w1_in(7 downto 4), w1(7 downto 4));
b32: g_div2 port map(w1_in(3 downto 0), w1(3 downto 0));


c17: g_mul4 port map(w2_in(63 downto 60), w2(63 downto 60));
c18: g_mul4 port map(w2_in(59 downto 56), w2(59 downto 56));
c19: g_mul4 port map(w2_in(55 downto 52), w2(55 downto 52));
c20: g_mul4 port map(w2_in(51 downto 48), w2(51 downto 48));
c21: g_mul4 port map(w2_in(47 downto 44), w2(47 downto 44));
c22: g_mul4 port map(w2_in(43 downto 40), w2(43 downto 40));
c23: g_mul4 port map(w2_in(39 downto 36), w2(39 downto 36));
c24: g_mul4 port map(w2_in(35 downto 32), w2(35 downto 32));
c25: g_mul4 port map(w2_in(31 downto 28), w2(31 downto 28));
c26: g_mul4 port map(w2_in(27 downto 24), w2(27 downto 24));
c27: g_mul4 port map(w2_in(23 downto 20), w2(23 downto 20));
c28: g_mul4 port map(w2_in(19 downto 16), w2(19 downto 16));
c29: g_mul4 port map(w2_in(15 downto 12), w2(15 downto 12));
c30: g_mul4 port map(w2_in(11 downto 8), w2(11 downto 8));
c31: g_mul4 port map(w2_in(7 downto 4), w2(7 downto 4));
c32: g_mul4 port map(w2_in(3 downto 0), w2(3 downto 0));

a4: inv_h_perm port map(w0_in, w0_sig);
a5: inv_h_perm port map(w1, w1_out_sig);
a6: inv_h_perm port map(w2, w2_out_sig);

d2: rc_xor port map(w0_sig, w1_out_sig, w2_out_sig, rc, s_tweakey_out);
w0	   <= w0_sig;
w1_out <= w1_out_sig;
w2_out <= w2_out_sig;

end behavior;