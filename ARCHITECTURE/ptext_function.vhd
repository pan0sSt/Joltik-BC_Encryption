library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ptext_function is
	port (  ptext_in	 : in std_logic_vector(63 downto 0);
			s_tweakey_in : in std_logic_vector(63 downto 0);
			ptext_out	 : out std_logic_vector(63 downto 0));
end ptext_function;

architecture behavior of ptext_function is
signal s_text, sh_text, mix_text : std_logic_vector(63 downto 0);

component s_box is
port (  s_in 	: in std_logic_vector(3 downto 0);
		s_out	: out std_logic_vector(3 downto 0));
end component;

component shiftrows is
port (  ptext_in	: in std_logic_vector(63 downto 0);
		ptext_out	: out std_logic_vector(63 downto 0));
end component;

component mix_nibbles is
port (  ptext_in 	: in std_logic_vector(63 downto 0);
		ptext_out	: out std_logic_vector(63 downto 0));
end component;

component addroundtweaky is
port (  ptext_in	 : in std_logic_vector(63 downto 0);
		s_tweakey_in : in std_logic_vector(63 downto 0);
		ptext_out	 : out std_logic_vector(63 downto 0));
end component;

begin

e1: s_box port map(ptext_in(63 downto 60), s_text(63 downto 60));
e2: s_box port map(ptext_in(59 downto 56), s_text(59 downto 56));
e3: s_box port map(ptext_in(55 downto 52), s_text(55 downto 52));
e4: s_box port map(ptext_in(51 downto 48), s_text(51 downto 48));
e5: s_box port map(ptext_in(47 downto 44), s_text(47 downto 44));
e6: s_box port map(ptext_in(43 downto 40), s_text(43 downto 40));
e7: s_box port map(ptext_in(39 downto 36), s_text(39 downto 36));
e8: s_box port map(ptext_in(35 downto 32), s_text(35 downto 32));
e9: s_box port map(ptext_in(31 downto 28), s_text(31 downto 28));
e10: s_box port map(ptext_in(27 downto 24), s_text(27 downto 24));
e11: s_box port map(ptext_in(23 downto 20), s_text(23 downto 20));
e12: s_box port map(ptext_in(19 downto 16), s_text(19 downto 16));
e13: s_box port map(ptext_in(15 downto 12), s_text(15 downto 12));
e14: s_box port map(ptext_in(11 downto 8), s_text(11 downto 8));
e15: s_box port map(ptext_in(7 downto 4), s_text(7 downto 4));
e16: s_box port map(ptext_in(3 downto 0), s_text(3 downto 0));

f1: shiftrows port map(s_text, sh_text);

matrix1: mix_nibbles port map(sh_text, mix_text);

g1: addroundtweaky port map(mix_text, s_tweakey_in, ptext_out);

end behavior;