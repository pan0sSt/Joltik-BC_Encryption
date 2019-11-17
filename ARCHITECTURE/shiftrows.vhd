library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftrows is
	port (  ptext_in	: in std_logic_vector(63 downto 0);
			ptext_out	: out std_logic_vector(63 downto 0));
end shiftrows;

architecture behavior of shiftrows is
signal p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15 : std_logic_vector(3 downto 0);
begin

p0 <= ptext_in(63 downto 60);
p1 <= ptext_in(59 downto 56);
p2 <= ptext_in(55 downto 52);
p3 <= ptext_in(51 downto 48);
p4 <= ptext_in(47 downto 44);
p5 <= ptext_in(43 downto 40);
p6 <= ptext_in(39 downto 36);
p7 <= ptext_in(35 downto 32);
p8 <= ptext_in(31 downto 28);
p9 <= ptext_in(27 downto 24);
p10 <= ptext_in(23 downto 20);
p11 <= ptext_in(19 downto 16);
p12 <= ptext_in(15 downto 12);
p13 <= ptext_in(11 downto 8);
p14 <= ptext_in(7 downto 4);
p15 <= ptext_in(3 downto 0);

ptext_out <= p0 & p5 & p10 & p15 & p4 & p9 & p14 & p3 & p8 & p13 & p2 & p7 & p12 & p1 & p6 & p11;

end behavior;