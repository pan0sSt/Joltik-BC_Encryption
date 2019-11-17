library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtweakey_gen is
	port (  w0_in 			: in std_logic_vector(63 downto 0);
			w1_in 			: in std_logic_vector(63 downto 0);
			w2_in 			: in std_logic_vector(63 downto 0);
			rc 				: in std_logic_vector(63 downto 0);
			w0				: out std_logic_vector(63 downto 0);
			w1_out			: out std_logic_vector(63 downto 0);
			w2_out			: out std_logic_vector(63 downto 0);
			s_tweakey_out	: out std_logic_vector(63 downto 0));
end subtweakey_gen;

architecture behavior of subtweakey_gen is
signal w0_sig, w1, w2, w1_out_sig, w2_out_sig 				  : std_logic_vector(63 downto 0);

component h_perm is
port (  h_in 	: in std_logic_vector(63 downto 0);
		h_out	: out std_logic_vector(63 downto 0)); 
end component;

component g_mul2 is
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

a1: h_perm port map(w0_in, w0_sig);
a2: h_perm port map(w1_in, w1);
a3: h_perm port map(w2_in, w2);

b1: g_mul2 port map(w1(63 downto 60), w1_out_sig(63 downto 60));
b2: g_mul2 port map(w1(59 downto 56), w1_out_sig(59 downto 56));
b3: g_mul2 port map(w1(55 downto 52), w1_out_sig(55 downto 52));
b4: g_mul2 port map(w1(51 downto 48), w1_out_sig(51 downto 48));
b5: g_mul2 port map(w1(47 downto 44), w1_out_sig(47 downto 44));
b6: g_mul2 port map(w1(43 downto 40), w1_out_sig(43 downto 40));
b7: g_mul2 port map(w1(39 downto 36), w1_out_sig(39 downto 36));
b8: g_mul2 port map(w1(35 downto 32), w1_out_sig(35 downto 32));
b9: g_mul2 port map(w1(31 downto 28), w1_out_sig(31 downto 28));
b10: g_mul2 port map(w1(27 downto 24), w1_out_sig(27 downto 24));
b11: g_mul2 port map(w1(23 downto 20), w1_out_sig(23 downto 20));
b12: g_mul2 port map(w1(19 downto 16), w1_out_sig(19 downto 16));
b13: g_mul2 port map(w1(15 downto 12), w1_out_sig(15 downto 12));
b14: g_mul2 port map(w1(11 downto 8), w1_out_sig(11 downto 8));
b15: g_mul2 port map(w1(7 downto 4), w1_out_sig(7 downto 4));
b16: g_mul2 port map(w1(3 downto 0), w1_out_sig(3 downto 0));

c1: g_mul4 port map(w2(63 downto 60), w2_out_sig(63 downto 60));
c2: g_mul4 port map(w2(59 downto 56), w2_out_sig(59 downto 56));
c3: g_mul4 port map(w2(55 downto 52), w2_out_sig(55 downto 52));
c4: g_mul4 port map(w2(51 downto 48), w2_out_sig(51 downto 48));
c5: g_mul4 port map(w2(47 downto 44), w2_out_sig(47 downto 44));
c6: g_mul4 port map(w2(43 downto 40), w2_out_sig(43 downto 40));
c7: g_mul4 port map(w2(39 downto 36), w2_out_sig(39 downto 36));
c8: g_mul4 port map(w2(35 downto 32), w2_out_sig(35 downto 32));
c9: g_mul4 port map(w2(31 downto 28), w2_out_sig(31 downto 28));
c10: g_mul4 port map(w2(27 downto 24), w2_out_sig(27 downto 24));
c11: g_mul4 port map(w2(23 downto 20), w2_out_sig(23 downto 20));
c12: g_mul4 port map(w2(19 downto 16), w2_out_sig(19 downto 16));
c13: g_mul4 port map(w2(15 downto 12), w2_out_sig(15 downto 12));
c14: g_mul4 port map(w2(11 downto 8), w2_out_sig(11 downto 8));
c15: g_mul4 port map(w2(7 downto 4), w2_out_sig(7 downto 4));
c16: g_mul4 port map(w2(3 downto 0), w2_out_sig(3 downto 0));

d1: rc_xor port map(w0_sig, w1_out_sig, w2_out_sig, rc, s_tweakey_out);
w0	   <= w0_sig;
w1_out <= w1_out_sig;
w2_out <= w2_out_sig;

end behavior;