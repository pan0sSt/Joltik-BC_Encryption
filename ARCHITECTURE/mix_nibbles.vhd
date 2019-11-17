library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mix_nibbles is
	port (  ptext_in 	: in std_logic_vector(63 downto 0);
			ptext_out	: out std_logic_vector(63 downto 0));
end mix_nibbles;


architecture behavior of mix_nibbles is
signal p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15 : std_logic_vector(3 downto 0);
signal p_out0, p_out1, p_out2, p_out3, p_out4, p_out5, p_out6, p_out7		: std_logic_vector(3 downto 0);
signal p_out8, p_out9, p_out10, p_out11, p_out12, p_out13, p_out14, p_out15 : std_logic_vector(3 downto 0);
signal m1, m4, m9, m13														: std_logic_vector(3 downto 0);

component matrix_mult is
port (  p_nibble1 	: in std_logic_vector(3 downto 0);
		p_nibble2 	: in std_logic_vector(3 downto 0);
		p_nibble3 	: in std_logic_vector(3 downto 0);
		p_nibble4 	: in std_logic_vector(3 downto 0);
		m_nibble1 	: in std_logic_vector(3 downto 0);
		m_nibble2 	: in std_logic_vector(3 downto 0);
		m_nibble3 	: in std_logic_vector(3 downto 0);
		m_nibble4 	: in std_logic_vector(3 downto 0);
		pnibble_out	: out std_logic_vector(3 downto 0));
end component;

begin

p0 	<= ptext_in(63 downto 60);
p1 	<= ptext_in(59 downto 56);
p2 	<= ptext_in(55 downto 52);
p3 	<= ptext_in(51 downto 48);
p4 	<= ptext_in(47 downto 44);
p5 	<= ptext_in(43 downto 40);
p6 	<= ptext_in(39 downto 36);
p7 	<= ptext_in(35 downto 32);
p8 	<= ptext_in(31 downto 28);
p9 	<= ptext_in(27 downto 24);
p10 <= ptext_in(23 downto 20);
p11 <= ptext_in(19 downto 16);
p12 <= ptext_in(15 downto 12);
p13 <= ptext_in(11 downto 8);
p14 <= ptext_in(7 downto 4);
p15 <= ptext_in(3 downto 0);
m1	<= "0001";
m4	<= "0100";
m9	<= "1001";
m13	<= "1011";

mm1: matrix_mult port map(p0, p4, p8, p12, m1, m4, m9, m13, p_out0);
mm2: matrix_mult port map(p0, p4, p8, p12, m4, m1, m13, m9, p_out4);
mm3: matrix_mult port map(p0, p4, p8, p12, m9, m13, m1, m4, p_out8);
mm4: matrix_mult port map(p0, p4, p8, p12, m13, m9, m4, m1, p_out12);

mm5: matrix_mult port map(p1, p5, p9, p13, m1, m4, m9, m13, p_out1);
mm6: matrix_mult port map(p1, p5, p9, p13, m4, m1, m13, m9, p_out5);
mm7: matrix_mult port map(p1, p5, p9, p13, m9, m13, m1, m4, p_out9);
mm8: matrix_mult port map(p1, p5, p9, p13, m13, m9, m4, m1, p_out13);

mm9: matrix_mult port map(p2, p6, p10, p14, m1, m4, m9, m13, p_out2);
mm10: matrix_mult port map(p2, p6, p10, p14, m4, m1, m13, m9, p_out6);
mm11: matrix_mult port map(p2, p6, p10, p14, m9, m13, m1, m4, p_out10);
mm12: matrix_mult port map(p2, p6, p10, p14, m13, m9, m4, m1, p_out14);

mm13: matrix_mult port map(p3, p7, p11, p15, m1, m4, m9, m13, p_out3);
mm14: matrix_mult port map(p3, p7, p11, p15, m4, m1, m13, m9, p_out7);
mm15: matrix_mult port map(p3, p7, p11, p15, m9, m13, m1, m4, p_out11);
mm16: matrix_mult port map(p3, p7, p11, p15, m13, m9, m4, m1, p_out15);

ptext_out <= p_out0 & p_out1 & p_out2 & p_out3 & p_out4 & p_out5 & p_out6 & p_out7 & p_out8 & p_out9 & p_out10 & p_out11 & p_out12 & p_out13 & p_out14 & p_out15;

end behavior;
