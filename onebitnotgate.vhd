entity onebitnotgate is
	port(Z : in bit ; A : out bit);
end onebitnotgate;

architecture behavofnot of onebitnotgate is
begin
	A <= not Z;
end behavofnot;