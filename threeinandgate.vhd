entity threeinandgate is
	port(X,Y,Z : in bit ; T : out bit);
end threeinandgate;

architecture structure of threeinandgate is 
signal A: bit;

component onebitandgate is
	port(P,Q : in bit ; R : out bit);
end component;

begin

andgate1 : onebitandgate port map(X,Y,A);
andgate2 : onebitandgate port map(A,Z,T);

end structure;