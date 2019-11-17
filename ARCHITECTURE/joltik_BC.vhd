library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity joltik_BC is
	port (	KT 		  	 : in std_logic_vector(191 downto 0);
			ptext_in  	 : in std_logic_vector(63 downto 0);
			state 	  	 : in std_logic;
			cypher_state : in std_logic;
			CLK    	  	 : in std_logic;
			ptext_out 	 : out std_logic_vector(63 downto 0));
end joltik_BC;

architecture behavior of joltik_BC is
signal fr_text, reg_w0, reg_w1, reg_w2, reg_text 	 			 : std_logic_vector(63 downto 0);
signal w0_sig, w1_out_sig, w2_out_sig, lp_text 	 				 : std_logic_vector(63 downto 0);
signal inv_w0_sig, inv_w1_out_sig, inv_w2_out_sig, inv_lp_text 	 : std_logic_vector(63 downto 0);
signal fr_key_text, lp_key_text, inv_lp_key_text, mux_out_sig 	 : std_logic_vector(255 downto 0);
signal KT_in, KT_out_sig								 		 : std_logic_vector(191 downto 0);
signal or_count, state_out_sig, buffer_en				 	 	 : std_logic;
signal cout_sig								 	 				 : std_logic_vector(5 downto 0);
signal lp_key_text_final										 : std_logic_vector(255 downto 0);

component first_round is
port (  KT 	  	  	 : in std_logic_vector(191 downto 0);
		ptext_in  	 : in std_logic_vector(63 downto 0);
		cypher_state : in std_logic;
		KT_out 	  	 : out std_logic_vector(191 downto 0);
		ptext_out 	 : out std_logic_vector(63 downto 0));
end component;

component mux2_1 is
port (  A 		: in std_logic_vector(255 downto 0);
		B		: in std_logic_vector(255 downto 0);
		SEL		: in std_logic;
		mux_out : out std_logic_vector(255 downto 0));
end component;

component counter is
port (	CLK    :in  std_logic;
		reset  :in  std_logic;
		cout   :out std_logic_vector (5 downto 0));
end component;

component comparator is
port (  r 	  	  : in std_logic_vector(5 downto 0);
		state 	  : in std_logic;
		state_out : out std_logic);
end component;

component reg64 is
port (  reg_in	: in std_logic_vector(63 downto 0);
		CLK		: in std_logic;
		reg_out	: out std_logic_vector(63 downto 0));
end component;

component reg01 is
port (  enable	: in std_logic;
		CLK		: in std_logic;
		reg_out	: out std_logic);
end component;

component round is
port (  r	 : in std_logic_vector(5 downto 0);
		w0_in 	  : in std_logic_vector(63 downto 0);
		w1_in 	  : in std_logic_vector(63 downto 0);
		w2_in 	  : in std_logic_vector(63 downto 0);
		ptext_in  : in std_logic_vector(63 downto 0);
		w0		  : out std_logic_vector(63 downto 0);
		w1_out	  : out std_logic_vector(63 downto 0);
		w2_out	  : out std_logic_vector(63 downto 0);
		ptext_out : out std_logic_vector(63 downto 0));
end component;

component inv_round is
port (  r	 : in std_logic_vector(5 downto 0);
		w0_in 	  : in std_logic_vector(63 downto 0);
		w1_in 	  : in std_logic_vector(63 downto 0);
		w2_in 	  : in std_logic_vector(63 downto 0);
		ptext_in  : in std_logic_vector(63 downto 0);
		w0		  : out std_logic_vector(63 downto 0);
		w1_out	  : out std_logic_vector(63 downto 0);
		w2_out	  : out std_logic_vector(63 downto 0);
		ptext_out : out std_logic_vector(63 downto 0));
end component;

component tri_state_buffer is
port (  ptext_in  : in std_logic_vector(63 downto 0);
		enable	  : in std_logic;
		ptext_out : out std_logic_vector(63 downto 0));
end component;

begin

process(state)
begin
	if(state = '0') then
		KT_in <= KT(127 downto 0) & KT(191 downto 128);
	else
		KT_in <= KT;
	end if;
end process;

FIRST_R1: first_round port map(KT_in, ptext_in, cypher_state, KT_out_sig, fr_text);
fr_key_text <= KT_out_sig & fr_text;

MUX1: mux2_1 port map(fr_key_text, lp_key_text_final, or_count, mux_out_sig);

CNTR1: counter port map(CLK, state_out_sig, cout_sig);
or_count <= cout_sig(5) or cout_sig(4) or cout_sig(3) or cout_sig(2) or cout_sig(1);

CMP1: comparator port map(cout_sig, state, state_out_sig);

RG_W0:  reg64 port map(mux_out_sig(255 downto 192), CLK, reg_w0);
RG_W1:  reg64 port map(mux_out_sig(191 downto 128), CLK, reg_w1);
RG_W2:  reg64 port map(mux_out_sig(127 downto 64), CLK, reg_w2);
RG_TXT: reg64 port map(mux_out_sig(63 downto 0), CLK, reg_text);

R1: 	round port map(cout_sig, reg_w0, reg_w1, reg_w2, reg_text, w0_sig, w1_out_sig, w2_out_sig, lp_text);
INV_R1: inv_round port map(cout_sig, reg_w0, reg_w1, reg_w2, reg_text, inv_w0_sig, inv_w1_out_sig, inv_w2_out_sig, inv_lp_text);

lp_key_text 	<= w0_sig & w1_out_sig & w2_out_sig & lp_text;
inv_lp_key_text <= inv_w0_sig & inv_w1_out_sig & inv_w2_out_sig & inv_lp_text;

MUX2: mux2_1 port map(lp_key_text, inv_lp_key_text, cypher_state, lp_key_text_final);
RG_BIT1: reg01 port map(state_out_sig, CLK, buffer_en);
TRI_STATE1: tri_state_buffer port map(reg_text, buffer_en, ptext_out);

end behavior;