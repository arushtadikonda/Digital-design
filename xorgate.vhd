entity xorgate is
	port(A_xor,B_xor : in bit_vector(15 downto 0) ; R_xor : out bit_vector(15 downto 0));
end xorgate;

architecture structure of xorgate is 
	signal X,Y,Z : bit_vector(15 downto 0) ;
	
component Nandgate is
	port(A_nand,B_nand : in bit_vector(15 downto 0) ; R_nand : out bit_vector(15 downto 0));
end component;

begin

nand1 : Nandgate port map(A_xor,B_xor,X);
nand2 : Nandgate port map(A_xor,X,Y);
nand3 : Nandgate port map(B_xor,X,Z);
nand4 : Nandgate port map(Y,Z,R_xor);

end structure;