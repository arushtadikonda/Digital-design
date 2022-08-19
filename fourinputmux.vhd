entity fourinputmux is
	port(A_mux,B_mux,C_mux,D_mux : in bit_vector(15 downto 0) ; S0,S1 : in bit ; R_mux : out bit_vector( 15 downto 0));
end fourinputmux;

architecture structure of fourinputmux is
 
component bitwisemux is
	port(E,F,G,H,S0,S1 : in bit; I : out bit);
end component;

begin 

mux_loop:for i in 0 to 15 generate

	m : bitwisemux port map(A_mux(i),B_mux(i),C_mux(i),D_mux(i),S0,S1,R_mux(i));
				
end generate;

end structure;