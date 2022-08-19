entity fourinorgate is
	port ( L,M,N,O : in  bit ; P : out bit);
end fourinorgate;



architecture structure of fourinorgate is
signal U,V : bit;

component onebitorgate is
	port( I,J : in  bit; K : out bit);
end component;

begin
orgate1 : onebitorgate port map (L,M,U);
orgate2 : onebitorgate port map (N,O,V);
orgate3 : onebitorgate port map (U,V,P);

end structure;
