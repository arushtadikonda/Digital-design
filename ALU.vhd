entity ALU is
port (A, B: in bit_vector(15 downto 0); sel0, sel1: in bit; R: buffer bit_vector(15 downto 0); C, z: out bit);
end entity ALU;

architecture Struct of ALU is

component KS is 
	port (A_ks, B_ks: in bit_vector(15 downto 0); sel: in bit ; S_ks: out bit_vector(15 downto 0); C_ks: out bit);
end component ;

component Nandgate is
	port(A_nand, B_nand : in bit_vector(15 downto 0) ; R_nand : out bit_vector(15 downto 0));
end component;

component xorgate is
	port(A_xor, B_xor : in bit_vector(15 downto 0) ; R_xor : out bit_vector(15 downto 0));
end component;

component fourinputmux is
	port(A_mux, B_mux, C_mux, D_mux : in bit_vector(15 downto 0) ; S0, S1 : in bit ; R_mux : out bit_vector( 15 downto 0));
end component;

component bitwisemux is
	port(E, F, G, H, S0, S1 : in bit; I : out bit);
end component;

signal R_1, R_2, R_3, R_4 : bit_vector(15 downto 0);
signal C_1, C_2, C_3, C_4 : bit;

begin

r1: KS port map (A, B, '0', R_1, C_1);
r2: KS port map (A, B, '1', R_2, C_2);
r3: Nandgate port map (A, B, R_3);
C_3 <= '0';
r4: xorgate port map (A, B, R_4);
C_4 <= '0';

r_out: fourinputmux port map (R_1, R_2, R_3, R_4, sel0, sel1, R);
c_out: bitwisemux port map (C_1, C_2, C_3, C_4, sel0, sel1, C);

z <= '1' when R = "0000000000000000" else '0';

end Struct;