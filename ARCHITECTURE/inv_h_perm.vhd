library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_h_perm is
	port (  h_in 	: in std_logic_vector(63 downto 0);
			h_out	: out std_logic_vector(63 downto 0));
end inv_h_perm;


architecture behavior of inv_h_perm is
signal p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15 : std_logic_vector(3 downto 0);
begin
	p7 	<= h_in(63 downto 60);
	p0 	<= h_in(59 downto 56);
	p13 <= h_in(55 downto 52);
	p10 <= h_in(51 downto 48);
	p11 <= h_in(47 downto 44);
	p4 	<= h_in(43 downto 40);
	p1 	<= h_in(39 downto 36);
	p14 <= h_in(35 downto 32);
	p15 <= h_in(31 downto 28);
	p8 	<= h_in(27 downto 24);
	p5 	<= h_in(23 downto 20);
	p2 	<= h_in(19 downto 16);
	p3 	<= h_in(15 downto 12);
	p12 <= h_in(11 downto 8);
	p9 	<= h_in(7 downto 4);
	p6 	<= h_in(3 downto 0);
	
h_out	<= p0 & p1 & p2 & p3 & p4 & p5 & p6 & p7 & p8 & p9 & p10 & p11 & p12 & p13 & p14 & p15;

end behavior;
