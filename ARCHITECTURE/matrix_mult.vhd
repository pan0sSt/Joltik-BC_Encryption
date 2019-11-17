library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity matrix_mult is
	port (  p_nibble1 	: in std_logic_vector(3 downto 0);
			p_nibble2 	: in std_logic_vector(3 downto 0);
			p_nibble3 	: in std_logic_vector(3 downto 0);
			p_nibble4 	: in std_logic_vector(3 downto 0);
			m_nibble1 	: in std_logic_vector(3 downto 0);
			m_nibble2 	: in std_logic_vector(3 downto 0);
			m_nibble3 	: in std_logic_vector(3 downto 0);
			m_nibble4 	: in std_logic_vector(3 downto 0);
			pnibble_out	: out std_logic_vector(3 downto 0));
end matrix_mult;


architecture behavior of matrix_mult is
signal mult_sig1, mult_sig2, mult_sig3, mult_sig4 :std_logic_vector(7 downto 0);
signal add_sig 									  :std_logic_vector(10 downto 0);
signal out_sig 									  :std_logic_vector(4 downto 0);
begin

mult_sig1 	<= std_logic_vector(unsigned(p_nibble1) * unsigned(m_nibble1));
mult_sig2 	<= std_logic_vector(unsigned(p_nibble2) * unsigned(m_nibble2));
mult_sig3 	<= std_logic_vector(unsigned(p_nibble3) * unsigned(m_nibble3));
mult_sig4 	<= std_logic_vector(unsigned(p_nibble4) * unsigned(m_nibble4));

add_sig	  	<= std_logic_vector(("000" & unsigned(mult_sig1)) + ("000" & unsigned(mult_sig2)) + ("000" & unsigned(mult_sig3)) + ("000" & unsigned(mult_sig4)));

out_sig 	<= std_logic_vector(unsigned(add_sig) mod "10000");
pnibble_out <= out_sig(3 downto 0);

end behavior;
