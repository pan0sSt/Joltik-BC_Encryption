library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_ptext_function is
	port (  ptext_in	 : in std_logic_vector(63 downto 0);
			s_tweakey_in : in std_logic_vector(63 downto 0);
			ptext_out	 : out std_logic_vector(63 downto 0));
end inv_ptext_function;

architecture behavior of inv_ptext_function is
signal s_text, sh_text, mix_text : std_logic_vector(63 downto 0);

component inv_s_box is
port (  s_in 	: in std_logic_vector(3 downto 0);
		s_out	: out std_logic_vector(3 downto 0));
end component;

component mix_nibbles is
port (  ptext_in 	: in std_logic_vector(63 downto 0);
		ptext_out	: out std_logic_vector(63 downto 0));
end component;

component inv_shiftrows is
port (  ptext_in	: in std_logic_vector(63 downto 0);
		ptext_out	: out std_logic_vector(63 downto 0));
end component;

component addroundtweaky is
port (  ptext_in	 : in std_logic_vector(63 downto 0);
		s_tweakey_in : in std_logic_vector(63 downto 0);
		ptext_out	 : out std_logic_vector(63 downto 0));
end component;

begin

matrix2: mix_nibbles port map(ptext_in, mix_text);

f2: inv_shiftrows port map(mix_text, sh_text);

e17: inv_s_box port map(sh_text(63 downto 60), s_text(63 downto 60));
e18: inv_s_box port map(sh_text(59 downto 56), s_text(59 downto 56));
e19: inv_s_box port map(sh_text(55 downto 52), s_text(55 downto 52));
e20: inv_s_box port map(sh_text(51 downto 48), s_text(51 downto 48));
e21: inv_s_box port map(sh_text(47 downto 44), s_text(47 downto 44));
e22: inv_s_box port map(sh_text(43 downto 40), s_text(43 downto 40));
e23: inv_s_box port map(sh_text(39 downto 36), s_text(39 downto 36));
e24: inv_s_box port map(sh_text(35 downto 32), s_text(35 downto 32));
e25: inv_s_box port map(sh_text(31 downto 28), s_text(31 downto 28));
e26: inv_s_box port map(sh_text(27 downto 24), s_text(27 downto 24));
e27: inv_s_box port map(sh_text(23 downto 20), s_text(23 downto 20));
e28: inv_s_box port map(sh_text(19 downto 16), s_text(19 downto 16));
e29: inv_s_box port map(sh_text(15 downto 12), s_text(15 downto 12));
e30: inv_s_box port map(sh_text(11 downto 8), s_text(11 downto 8));
e31: inv_s_box port map(sh_text(7 downto 4), s_text(7 downto 4));
e32: inv_s_box port map(sh_text(3 downto 0), s_text(3 downto 0));

g2: addroundtweaky port map(s_text, s_tweakey_in, ptext_out);

end behavior;