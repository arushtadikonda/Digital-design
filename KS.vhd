entity KS is
port (A_ks, B_ks: in bit_vector(15 downto 0); sel: in bit ; S_ks: out bit_vector(15 downto 0); C_ks: out bit);
end entity KS;


architecture Struct of KS is

signal g_0, g_1, g_2, g_3, g_4, p_0, p_1, p_2, p_3, p_4, c : bit_vector(15 downto 0);
signal B_p: bit_vector(15 downto 0);
signal sel_p4: bit_vector(15 downto 0);

component node_init is 
	port (x, y : in bit ; g, p : out bit);
end component ;

component node_op is 
	port (g_in1, g_in2, p_in1, p_in2 : in bit ; g_out, p_out : out bit);
end component ;

component onebitxorgate is
	port( x_xor,y_xor: in bit;z_xor: out bit);
end component;

component onebitorgate is
	port( I,J: in bit;K: out bit);
end component;

component onebitandgate is
	port(P,Q : in bit ; R : out bit);
end component;

begin

init0: for i in 0 to 15 generate


	b_pi: onebitxorgate port map (B_ks(i), sel, B_p(i));
	
end generate;


init: for i in 0 to 15 generate

	pm: node_init 
	port map (A_ks(i), B_p(i), g_0(i), p_0(i));
				
end generate;

-----------------------------------

stage1:for i in 1 to 15 generate

	pm: node_op 
	port map (g_0(i), g_0(i-1), p_0(i), p_0(i-1), g_1(i), p_1(i));
				
end generate;

g_1(0) <= g_0(0);
p_1(0) <= p_0(0);
----------------------------------

stage2:for i in 2 to 15 generate

	pm: node_op 
	port map (g_1(i), g_1(i-2), p_1(i), p_1(i-2), g_2(i), p_2(i));
				
end generate;

buff2:for i in 0 to 1 generate

	g_2(i) <= g_1(i);
	p_2(i) <= p_1(i);
				
end generate;

-----------------------------------

stage3:for i in 4 to 15 generate

	pm: node_op 
	port map (g_2(i), g_2(i-4), p_2(i), p_2(i-4), g_3(i), p_3(i));
				
end generate;

buff3:for i in 0 to 3 generate

	g_3(i) <= g_2(i);
	p_3(i) <= p_2(i);
				
end generate;

-----------------------------------

stage4:for i in 8 to 15 generate

	pm: node_op 
	port map (g_3(i), g_3(i-8), p_3(i), p_3(i-8), g_4(i), p_4(i));
				
end generate;

buff4: for i in 0 to 7 generate

	      g_4(i) <= g_3(i);
	      p_4(i) <= p_3(i);
				
       end generate;

c_gen: for i in 0 to 15 generate
		   
		
			s_p: onebitandgate port map (sel, p_4(i), sel_p4(i));
			c_i: onebitorgate port map (g_4(i), sel_p4(i), c(i));
       
		 end generate;

----------------------------------


s_ks0: onebitxorgate port map (p_0(0), sel, S_ks(0));

final:for i in 1 to 15 generate
	
	s_ksi: onebitxorgate port map (p_0(i), c(i-1), S_ks(i));

end generate;

C_ks <= c(15);

end Struct;