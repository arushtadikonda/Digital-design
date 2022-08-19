entity Nandgate is
	port(A_nand,B_nand : in bit_vector(15 downto 0) ; R_nand : out bit_vector(15 downto 0));
end Nandgate;

architecture structure of Nandgate is 

component onebitnandgate is 
	port (L,M : in bit ; N : out bit);
end component ;


begin

res:for i in 0 to 15 generate

	ng : onebitnandgate port map(A_nand(i),B_nand(i),R_nand(i));
	
end generate;

end structure;