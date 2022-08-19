entity onebitnandgate is
	port(L,M: in bit; N:out bit);
end onebitnandgate;

architecture behavofnand of onebitnandgate is

signal X : bit ;

component onebitnotgate is 
	port(Z : in bit ; A : out bit);
end component ;

component onebitandgate is 
	port (P,Q : in bit ; R : out bit);
end component ;

begin 

andgate : onebitandgate port map(L,M,X);
notgate : onebitnotgate port map(X,N);

end behavofnand;