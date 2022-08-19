entity bitwisemux is
	port(E,F,G,H,S0,S1 : in bit; I : out bit);
end bitwisemux;

architecture structure of bitwisemux is
signal A,B,C,D,U,V : bit;

component threeinandgate is
	port(X,Y,Z : in bit ; T : out bit);
end component;

component fourinorgate is
	port ( L,M,N,O : in  bit ; P : out bit);
end component;

component onebitnotgate is
	port(Z : in bit ; A : out bit);
end component;

begin

notgate1 : onebitnotgate port map(S0,U);
notgate2 : onebitnotgate port map(S1,V);

andgate1 : threeinandgate port map(E,V,U,A);
andgate2 : threeinandgate port map(F,V,S0,B);
andgate3 : threeinandgate port map(G,S1,U,C);
andgate4 : threeinandgate port map(H,S1,S0,D);

orgate1 : fourinorgate port map(A,B,C,D,I);

end structure;